#requires -Version 5.1
<#
.SYNOPSIS
Exports temporary CSV files for rebuilding NWVVASSalesTaxStatement in Fabric.

.DESCRIPTION
Read-only SQL export utility for Tier-1/dev AxDB access. It writes one CSV per
source object, schema CSV files, index CSV files, and a manifest. It does not
change D365FO metadata or database data.
#>

[CmdletBinding()]
param(
    [Parameter()]
    [string] $ServerInstance = "localhost",

    [Parameter()]
    [string] $Database = "AxDB",

    [Parameter()]
    [string] $OutputPath = (Join-Path $PSScriptRoot "out\NWVVASSalesTaxStatement"),

    [Parameter()]
    [string] $ConfigPath = (Join-Path $PSScriptRoot "NWVVASSalesTaxStatement.tables.json"),

    [Parameter()]
    [ValidateSet("Core", "CustomSetupOnly", "CoreAndFallback", "All")]
    [string] $TableSet = "Core",

    [Parameter()]
    [string[]] $Tables,

    [Parameter()]
    [Alias("Company", "Companies", "DataAreaIds")]
    [string[]] $DataAreaId,

    [Parameter()]
    [datetime] $FromDate,

    [Parameter()]
    [datetime] $ToDate,

    [Parameter()]
    [int] $MaxRows = 0,

    [Parameter()]
    [int] $CommandTimeoutSeconds = 0,

    [Parameter()]
    [System.Management.Automation.PSCredential] $SqlCredential,

    [Parameter()]
    [switch] $TrustServerCertificate,

    [Parameter()]
    [switch] $SkipMissing,

    [Parameter()]
    [switch] $CreateZip
)

Set-StrictMode -Version 2.0
$ErrorActionPreference = "Stop"

$InvariantCulture = [System.Globalization.CultureInfo]::InvariantCulture

function Quote-SqlIdentifier {
    param([Parameter(Mandatory = $true)][string] $Name)
    return "[" + $Name.Replace("]", "]]") + "]"
}

function ConvertTo-CsvField {
    param(
        [AllowNull()][object] $Value,
        [Parameter(Mandatory = $true)][string] $Delimiter
    )

    if ($null -eq $Value -or $Value -eq [DBNull]::Value) {
        return ""
    }

    if ($Value -is [byte[]]) {
        $text = [Convert]::ToBase64String($Value)
    }
    elseif ($Value -is [datetime]) {
        $text = $Value.ToString("yyyy-MM-ddTHH:mm:ss.fffffff", $InvariantCulture)
    }
    elseif ($Value -is [bool]) {
        $text = if ($Value) { "true" } else { "false" }
    }
    elseif ($Value -is [System.IFormattable]) {
        $text = $Value.ToString($null, $InvariantCulture)
    }
    else {
        $text = [string] $Value
    }

    if ($text.Contains('"') -or $text.Contains($Delimiter) -or $text.Contains("`r") -or $text.Contains("`n")) {
        return '"' + $text.Replace('"', '""') + '"'
    }

    return $text
}

function Convert-DataTableToObject {
    param([Parameter(Mandatory = $true)][System.Data.DataTable] $DataTable)

    foreach ($row in $DataTable.Rows) {
        $ordered = [ordered]@{}
        foreach ($column in $DataTable.Columns) {
            $value = $row[$column.ColumnName]
            if ($value -eq [DBNull]::Value) {
                $value = $null
            }
            $ordered[$column.ColumnName] = $value
        }
        [pscustomobject] $ordered
    }
}

function Add-SqlParameter {
    param(
        [Parameter(Mandatory = $true)][System.Data.SqlClient.SqlCommand] $Command,
        [Parameter(Mandatory = $true)][string] $Name,
        [AllowNull()][object] $Value
    )

    if ($null -eq $Value) {
        [void] $Command.Parameters.AddWithValue($Name, [DBNull]::Value)
    }
    else {
        [void] $Command.Parameters.AddWithValue($Name, $Value)
    }
}

function Invoke-DataTableQuery {
    param(
        [Parameter(Mandatory = $true)][System.Data.SqlClient.SqlConnection] $Connection,
        [Parameter(Mandatory = $true)][string] $Sql,
        [hashtable] $Parameters = @{}
    )

    $command = $Connection.CreateCommand()
    $command.CommandText = $Sql
    $command.CommandTimeout = $CommandTimeoutSeconds

    foreach ($name in $Parameters.Keys) {
        Add-SqlParameter -Command $command -Name $name -Value $Parameters[$name]
    }

    $adapter = New-Object System.Data.SqlClient.SqlDataAdapter $command
    $table = New-Object System.Data.DataTable
    [void] $adapter.Fill($table)
    return $table
}

function Get-ConnectionString {
    $builder = New-Object System.Data.SqlClient.SqlConnectionStringBuilder
    $builder["Data Source"] = $ServerInstance
    $builder["Initial Catalog"] = $Database
    $builder["Application Name"] = "NWVVAS Fabric CSV Export"

    if ($PSBoundParameters.ContainsKey("SqlCredential") -and $null -ne $SqlCredential) {
        $builder["Integrated Security"] = $false
        $builder["User ID"] = $SqlCredential.UserName
        $builder["Password"] = $SqlCredential.GetNetworkCredential().Password
    }
    else {
        $builder["Integrated Security"] = $true
    }

    if ($TrustServerCertificate) {
        $builder["TrustServerCertificate"] = $true
    }

    return $builder.ConnectionString
}

function Get-DbObject {
    param(
        [Parameter(Mandatory = $true)][System.Data.SqlClient.SqlConnection] $Connection,
        [Parameter(Mandatory = $true)][string] $ObjectName
    )

    $sql = @"
SELECT TOP (1)
    s.name AS SchemaName,
    o.name AS ObjectName,
    o.object_id AS ObjectId,
    o.type AS ObjectType,
    o.type_desc AS ObjectTypeDesc
FROM sys.objects o
JOIN sys.schemas s ON s.schema_id = o.schema_id
WHERE o.name = @ObjectName
  AND o.type IN ('U', 'V')
ORDER BY CASE WHEN s.name = 'dbo' THEN 0 ELSE 1 END, s.name;
"@

    $result = Invoke-DataTableQuery -Connection $Connection -Sql $sql -Parameters @{ "@ObjectName" = $ObjectName }
    if ($result.Rows.Count -eq 0) {
        return $null
    }

    return Convert-DataTableToObject -DataTable $result | Select-Object -First 1
}

function Get-ObjectColumns {
    param(
        [Parameter(Mandatory = $true)][System.Data.SqlClient.SqlConnection] $Connection,
        [Parameter(Mandatory = $true)][int] $ObjectId
    )

    $sql = @"
SELECT
    SCHEMA_NAME(o.schema_id) AS SchemaName,
    o.name AS ObjectName,
    c.column_id AS ColumnId,
    c.name AS ColumnName,
    t.name AS SqlType,
    c.max_length AS MaxLength,
    c.precision AS NumericPrecision,
    c.scale AS NumericScale,
    c.is_nullable AS IsNullable,
    c.is_identity AS IsIdentity,
    c.is_computed AS IsComputed,
    c.collation_name AS CollationName
FROM sys.columns c
JOIN sys.objects o ON o.object_id = c.object_id
JOIN sys.types t ON t.user_type_id = c.user_type_id
WHERE c.object_id = @ObjectId
ORDER BY c.column_id;
"@

    Invoke-DataTableQuery -Connection $Connection -Sql $sql -Parameters @{ "@ObjectId" = $ObjectId }
}

function Get-ObjectIndexes {
    param(
        [Parameter(Mandatory = $true)][System.Data.SqlClient.SqlConnection] $Connection,
        [Parameter(Mandatory = $true)][int] $ObjectId
    )

    $sql = @"
SELECT
    SCHEMA_NAME(o.schema_id) AS SchemaName,
    o.name AS ObjectName,
    i.name AS IndexName,
    i.type_desc AS IndexType,
    i.is_unique AS IsUnique,
    i.is_primary_key AS IsPrimaryKey,
    i.is_unique_constraint AS IsUniqueConstraint,
    ic.key_ordinal AS KeyOrdinal,
    c.name AS ColumnName,
    ic.is_descending_key AS IsDescendingKey,
    ic.is_included_column AS IsIncludedColumn
FROM sys.indexes i
JOIN sys.objects o ON o.object_id = i.object_id
LEFT JOIN sys.index_columns ic ON ic.object_id = i.object_id AND ic.index_id = i.index_id
LEFT JOIN sys.columns c ON c.object_id = ic.object_id AND c.column_id = ic.column_id
WHERE i.object_id = @ObjectId
  AND i.index_id > 0
ORDER BY i.index_id, ic.key_ordinal, ic.index_column_id;
"@

    Invoke-DataTableQuery -Connection $Connection -Sql $sql -Parameters @{ "@ObjectId" = $ObjectId }
}

function Find-ActualColumnName {
    param(
        [Parameter(Mandatory = $true)][System.Data.DataTable] $Columns,
        [Parameter(Mandatory = $true)][string] $ColumnName
    )

    foreach ($row in $Columns.Rows) {
        if ([string]::Equals([string] $row["ColumnName"], $ColumnName, [System.StringComparison]::OrdinalIgnoreCase)) {
            return [string] $row["ColumnName"]
        }
    }

    return $null
}

function Write-QueryToCsv {
    param(
        [Parameter(Mandatory = $true)][System.Data.SqlClient.SqlConnection] $Connection,
        [Parameter(Mandatory = $true)][string] $Sql,
        [Parameter(Mandatory = $true)][string] $Path,
        [hashtable] $Parameters = @{},
        [string] $Delimiter = ","
    )

    $command = $Connection.CreateCommand()
    $command.CommandText = $Sql
    $command.CommandTimeout = $CommandTimeoutSeconds

    foreach ($name in $Parameters.Keys) {
        Add-SqlParameter -Command $command -Name $name -Value $Parameters[$name]
    }

    $reader = $command.ExecuteReader([System.Data.CommandBehavior]::SequentialAccess)
    $writer = New-Object System.IO.StreamWriter($Path, $false, (New-Object System.Text.UTF8Encoding($false)))
    $rowCount = 0

    try {
        $headers = @()
        for ($i = 0; $i -lt $reader.FieldCount; $i++) {
            $headers += ConvertTo-CsvField -Value $reader.GetName($i) -Delimiter $Delimiter
        }
        $writer.WriteLine(($headers -join $Delimiter))

        while ($reader.Read()) {
            $fields = New-Object string[] $reader.FieldCount
            for ($i = 0; $i -lt $reader.FieldCount; $i++) {
                $fields[$i] = ConvertTo-CsvField -Value $reader.GetValue($i) -Delimiter $Delimiter
            }

            $writer.WriteLine(($fields -join $Delimiter))
            $rowCount++

            if ($rowCount % 50000 -eq 0) {
                Write-Progress -Activity "Exporting SQL data" -Status "$Path : $rowCount rows" -PercentComplete -1
            }
        }
    }
    finally {
        $writer.Dispose()
        $reader.Dispose()
    }

    return $rowCount
}

function Export-DataTableCsv {
    param(
        [Parameter(Mandatory = $true)][System.Data.DataTable] $DataTable,
        [Parameter(Mandatory = $true)][string] $Path
    )

    Convert-DataTableToObject -DataTable $DataTable |
        Export-Csv -LiteralPath $Path -NoTypeInformation -Encoding UTF8
}

if (-not (Test-Path -LiteralPath $ConfigPath)) {
    throw "Config file not found: $ConfigPath"
}

$config = Get-Content -LiteralPath $ConfigPath -Raw | ConvertFrom-Json
$tableConfigByName = @{}
foreach ($table in $config.tables) {
    $tableConfigByName[$table.name.ToLowerInvariant()] = $table
}

if ($PSBoundParameters.ContainsKey("Tables") -and $Tables.Count -gt 0) {
    $selectedNames = $Tables
}
else {
    $selectedNames = @($config.tableSets.$TableSet)
}

if ($selectedNames.Count -eq 0) {
    throw "No tables selected. Check TableSet or Tables parameters."
}

$dataPath = Join-Path $OutputPath "data"
$schemaPath = Join-Path $OutputPath "schema"
New-Item -ItemType Directory -Path $dataPath -Force | Out-Null
New-Item -ItemType Directory -Path $schemaPath -Force | Out-Null

$connection = New-Object System.Data.SqlClient.SqlConnection (Get-ConnectionString)
$connection.Open()

$manifestRows = New-Object System.Collections.Generic.List[object]
$startedAtUtc = [DateTime]::UtcNow

try {
    foreach ($selectedName in $selectedNames) {
        $configKey = $selectedName.ToLowerInvariant()
        $tableConfig = if ($tableConfigByName.ContainsKey($configKey)) { $tableConfigByName[$configKey] } else { $null }

        $dbObject = Get-DbObject -Connection $connection -ObjectName $selectedName
        if ($null -eq $dbObject) {
            $message = "SQL object not found in ${Database}: $selectedName"
            if ($SkipMissing) {
                Write-Warning $message
                continue
            }

            throw $message
        }

        Write-Host "Exporting $($dbObject.SchemaName).$($dbObject.ObjectName)..." -ForegroundColor Cyan

        $columns = Get-ObjectColumns -Connection $connection -ObjectId ([int] $dbObject.ObjectId)
        $indexes = Get-ObjectIndexes -Connection $connection -ObjectId ([int] $dbObject.ObjectId)

        $safeFileName = $selectedName
        $columnsFile = Join-Path $schemaPath "$safeFileName.columns.csv"
        $indexesFile = Join-Path $schemaPath "$safeFileName.indexes.csv"
        $dataFile = Join-Path $dataPath "$safeFileName.csv"

        Export-DataTableCsv -DataTable $columns -Path $columnsFile
        Export-DataTableCsv -DataTable $indexes -Path $indexesFile

        $selectColumns = @()
        foreach ($columnRow in $columns.Rows) {
            $selectColumns += Quote-SqlIdentifier ([string] $columnRow["ColumnName"])
        }

        if ($selectColumns.Count -eq 0) {
            Write-Warning "No columns found for $selectedName. Skipping data export."
            continue
        }

        $topClause = if ($MaxRows -gt 0) { "TOP ($MaxRows) " } else { "" }
        $qualifiedName = (Quote-SqlIdentifier ([string] $dbObject.SchemaName)) + "." + (Quote-SqlIdentifier ([string] $dbObject.ObjectName))
        $sql = "SELECT $topClause$($selectColumns -join ', ') FROM $qualifiedName"
        $whereParts = New-Object System.Collections.Generic.List[string]
        $sqlParameters = @{}

        $dataAreaColumn = Find-ActualColumnName -Columns $columns -ColumnName "DataAreaId"
        if ($DataAreaId -and $DataAreaId.Count -gt 0 -and $dataAreaColumn) {
            $companyParameterNames = @()
            for ($i = 0; $i -lt $DataAreaId.Count; $i++) {
                $parameterName = "@DataAreaId$i"
                $companyParameterNames += $parameterName
                $sqlParameters[$parameterName] = $DataAreaId[$i]
            }
            $whereParts.Add((Quote-SqlIdentifier $dataAreaColumn) + " IN (" + ($companyParameterNames -join ", ") + ")")
        }

        if ($tableConfig -and $tableConfig.PSObject.Properties.Name -contains "dateColumn") {
            $dateColumn = Find-ActualColumnName -Columns $columns -ColumnName ([string] $tableConfig.dateColumn)
            if ($dateColumn) {
                if ($PSBoundParameters.ContainsKey("FromDate")) {
                    $whereParts.Add((Quote-SqlIdentifier $dateColumn) + " >= @FromDate")
                    $sqlParameters["@FromDate"] = $FromDate.Date
                }

                if ($PSBoundParameters.ContainsKey("ToDate")) {
                    $whereParts.Add((Quote-SqlIdentifier $dateColumn) + " <= @ToDate")
                    $sqlParameters["@ToDate"] = $ToDate.Date
                }
            }
        }

        if ($whereParts.Count -gt 0) {
            $sql += " WHERE " + ($whereParts -join " AND ")
        }

        $rowCount = Write-QueryToCsv -Connection $connection -Sql $sql -Path $dataFile -Parameters $sqlParameters

        $manifestRows.Add([pscustomobject]@{
            TableName = $selectedName
            ActualSqlObject = "$($dbObject.SchemaName).$($dbObject.ObjectName)"
            ObjectType = $dbObject.ObjectTypeDesc
            Group = if ($tableConfig) { $tableConfig.group } else { "" }
            DataFile = $dataFile
            ColumnsFile = $columnsFile
            IndexesFile = $indexesFile
            RowCount = $rowCount
            DataAreaFilter = if ($DataAreaId) { $DataAreaId -join "|" } else { "" }
            FromDate = if ($PSBoundParameters.ContainsKey("FromDate")) { $FromDate.ToString("yyyy-MM-dd", $InvariantCulture) } else { "" }
            ToDate = if ($PSBoundParameters.ContainsKey("ToDate")) { $ToDate.ToString("yyyy-MM-dd", $InvariantCulture) } else { "" }
            MaxRows = $MaxRows
            ExportedAtUtc = ([DateTime]::UtcNow.ToString("o", $InvariantCulture))
            Query = $sql
        })

        Write-Host "  Rows: $rowCount" -ForegroundColor Green
    }
}
finally {
    $connection.Dispose()
    Write-Progress -Activity "Exporting SQL data" -Completed
}

$manifestPath = Join-Path $OutputPath "manifest.csv"
$manifestRows | Export-Csv -LiteralPath $manifestPath -NoTypeInformation -Encoding UTF8

$runInfoPath = Join-Path $OutputPath "run.json"
$runInfo = [ordered]@{
    report = "NWVVASSalesTaxStatement"
    serverInstance = $ServerInstance
    database = $Database
    tableSet = $TableSet
    selectedTables = $selectedNames
    outputPath = $OutputPath
    startedAtUtc = $startedAtUtc.ToString("o", $InvariantCulture)
    finishedAtUtc = ([DateTime]::UtcNow.ToString("o", $InvariantCulture))
    dataAreaId = $DataAreaId
    fromDate = if ($PSBoundParameters.ContainsKey("FromDate")) { $FromDate.ToString("yyyy-MM-dd", $InvariantCulture) } else { $null }
    toDate = if ($PSBoundParameters.ContainsKey("ToDate")) { $ToDate.ToString("yyyy-MM-dd", $InvariantCulture) } else { $null }
    maxRows = $MaxRows
}
($runInfo | ConvertTo-Json -Depth 8) | Set-Content -LiteralPath $runInfoPath -Encoding UTF8

if ($CreateZip) {
    Add-Type -AssemblyName System.IO.Compression.FileSystem
    $zipPath = "$OutputPath.zip"
    if (Test-Path -LiteralPath $zipPath) {
        Remove-Item -LiteralPath $zipPath -Force
    }
    [System.IO.Compression.ZipFile]::CreateFromDirectory($OutputPath, $zipPath)
    Write-Host "Created zip package: $zipPath" -ForegroundColor Green
}

Write-Host "Export completed: $OutputPath" -ForegroundColor Green
Write-Host "Manifest: $manifestPath" -ForegroundColor Green
