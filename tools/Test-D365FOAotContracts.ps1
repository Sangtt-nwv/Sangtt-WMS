[CmdletBinding()]
param(
    [Parameter(Mandatory, Position = 0)]
    [string[]] $Path,

    [string] $MetadataRoot = (Join-Path (Get-Location) 'Metadata')
)

$ErrorActionPreference = 'Stop'
$requiredTableFieldGroups = @(
    'AutoReport',
    'AutoLookup',
    'AutoIdentification',
    'AutoSummary',
    'AutoBrowse'
)
$reservedTableFieldNames = @(
    'CreatedBy',
    'CreatedDateTime',
    'DataAreaId',
    'ModifiedBy',
    'ModifiedDateTime',
    'Partition',
    'RecId',
    'RecVersion'
)
$issues = [System.Collections.Generic.List[object]]::new()
$tablePathCache = @{}

function Add-Issue {
    param(
        [string] $File,
        [string] $Object,
        [string] $Code,
        [string] $Message
    )

    $issues.Add([pscustomobject]@{
        File    = $File
        Object  = $Object
        Code    = $Code
        Message = $Message
    })
}

function Get-DirectChild {
    param(
        [System.Xml.XmlNode] $Node,
        [string] $Name
    )

    return $Node.SelectSingleNode("./*[local-name()='$Name']")
}

function Find-TableXml {
    param([string] $TableName)

    if ($tablePathCache.ContainsKey($TableName)) {
        return $tablePathCache[$TableName]
    }

    $match = Get-ChildItem -LiteralPath $MetadataRoot -Recurse -Filter "$TableName.xml" -ErrorAction SilentlyContinue |
        Where-Object { $_.Directory.Name -eq 'AxTable' } |
        Select-Object -First 1

    $tablePathCache[$TableName] = if ($match) { $match.FullName } else { $null }
    return $tablePathCache[$TableName]
}

function Test-AxTable {
    param(
        [string] $File,
        [xml] $Document
    )

    $table = $Document.DocumentElement
    $tableName = (Get-DirectChild -Node $table -Name 'Name').InnerText
    $fieldGroupsNode = Get-DirectChild -Node $table -Name 'FieldGroups'
    $actualGroups = @()

    if ($fieldGroupsNode) {
        $actualGroups = @(
            $fieldGroupsNode.SelectNodes("./*[local-name()='AxTableFieldGroup']") |
                ForEach-Object { (Get-DirectChild -Node $_ -Name 'Name').InnerText }
        )
    }

    foreach ($requiredGroup in $requiredTableFieldGroups) {
        if ($requiredGroup -notin $actualGroups) {
            Add-Issue -File $File -Object $tableName -Code 'TABLE_FIELDGROUP_MISSING' `
                -Message "Missing standard field group '$requiredGroup'."
        }
    }

    if ($fieldGroupsNode) {
        $autoIdentification = $fieldGroupsNode.SelectSingleNode(
            "./*[local-name()='AxTableFieldGroup'][./*[local-name()='Name' and text()='AutoIdentification']]"
        )

        if ($autoIdentification) {
            $autoPopulate = Get-DirectChild -Node $autoIdentification -Name 'AutoPopulate'
            if (-not $autoPopulate -or $autoPopulate.InnerText -ne 'Yes') {
                Add-Issue -File $File -Object $tableName -Code 'TABLE_AUTOIDENTIFICATION' `
                    -Message "AutoIdentification must contain AutoPopulate=Yes."
            }
        }
    }

    $fieldsNode = Get-DirectChild -Node $table -Name 'Fields'
    if ($fieldsNode) {
        $fieldNames = @(
            $fieldsNode.SelectNodes("./*[local-name()='AxTableField']") |
                ForEach-Object { (Get-DirectChild -Node $_ -Name 'Name').InnerText }
        )

        foreach ($duplicate in $fieldNames | Group-Object | Where-Object Count -gt 1) {
            Add-Issue -File $File -Object $tableName -Code 'TABLE_FIELD_DUPLICATE' `
                -Message "Duplicate field '$($duplicate.Name)'."
        }

        foreach ($reservedName in $reservedTableFieldNames) {
            if ($reservedName -in $fieldNames) {
                Add-Issue -File $File -Object $tableName -Code 'TABLE_FIELD_RESERVED' `
                    -Message "Field '$reservedName' is reserved for a system field."
            }
        }
    }
}

function Get-InheritedDataSource {
    param(
        [System.Xml.XmlNode] $Node,
        [System.Xml.XmlNode] $Design
    )

    $cursor = $Node
    while ($cursor -and $cursor -ne $Design.ParentNode) {
        $dataSource = Get-DirectChild -Node $cursor -Name 'DataSource'
        if ($dataSource -and $dataSource.InnerText) {
            return $dataSource.InnerText
        }
        $cursor = $cursor.ParentNode
    }

    $designDataSource = Get-DirectChild -Node $Design -Name 'DataSource'
    return if ($designDataSource) { $designDataSource.InnerText } else { $null }
}

function Test-AxForm {
    param(
        [string] $File,
        [xml] $Document
    )

    $form = $Document.DocumentElement
    $formName = (Get-DirectChild -Node $form -Name 'Name').InnerText
    $design = Get-DirectChild -Node $form -Name 'Design'
    $dataSourceTables = @{}

    $dataSourcesNode = Get-DirectChild -Node $form -Name 'DataSources'
    if ($dataSourcesNode) {
        foreach ($dataSource in $dataSourcesNode.SelectNodes("./*[local-name()='AxFormDataSource']")) {
            $nameNode = Get-DirectChild -Node $dataSource -Name 'Name'
            $tableNode = Get-DirectChild -Node $dataSource -Name 'Table'
            if ($nameNode -and $tableNode) {
                $dataSourceTables[$nameNode.InnerText] = $tableNode.InnerText
            }
        }
    }

    foreach ($control in $form.SelectNodes("//*[local-name()='AxFormControl']")) {
        $controlType = $control.GetAttribute('type', 'http://www.w3.org/2001/XMLSchema-instance')
        if ($controlType -eq 'AxFormIntControl') {
            $controlName = (Get-DirectChild -Node $control -Name 'Name').InnerText
            Add-Issue -File $File -Object $formName -Code 'FORM_CONTROL_TYPE' `
                -Message "Control '$controlName' uses invalid i:type AxFormIntControl; verify AxFormIntegerControl."
        }

        if ($controlType -eq 'AxFormTabControl') {
            $controlsNode = Get-DirectChild -Node $control -Name 'Controls'
            if ($controlsNode) {
                foreach ($child in $controlsNode.SelectNodes("./*[local-name()='AxFormControl']")) {
                    $childType = $child.GetAttribute('type', 'http://www.w3.org/2001/XMLSchema-instance')
                    if ($childType -ne 'AxFormTabPageControl') {
                        $tabName = (Get-DirectChild -Node $control -Name 'Name').InnerText
                        $childName = (Get-DirectChild -Node $child -Name 'Name').InnerText
                        Add-Issue -File $File -Object $formName -Code 'FORM_TAB_CHILD' `
                            -Message "Tab '$tabName' contains non-TabPage child '$childName' ($childType)."
                    }
                }
            }
        }
    }

    foreach ($patternRoot in $form.SelectNodes(
        "//*[local-name()='Pattern' and text()='FieldsFieldGroups']/parent::*"
    )) {
        $rootName = (Get-DirectChild -Node $patternRoot -Name 'Name').InnerText
        $rootColumnsMode = Get-DirectChild -Node $patternRoot -Name 'ColumnsMode'
        if (-not $rootColumnsMode -or $rootColumnsMode.InnerText -ne 'Fill') {
            Add-Issue -File $File -Object $formName -Code 'FORM_FIELDS_ROOT_COLUMNS' `
                -Message "FieldsFieldGroups root '$rootName' must use ColumnsMode=Fill."
        }

        $controlsNode = Get-DirectChild -Node $patternRoot -Name 'Controls'
        if ($controlsNode) {
            foreach ($group in $controlsNode.SelectNodes("./*[local-name()='AxFormControl']")) {
                $groupType = $group.GetAttribute('type', 'http://www.w3.org/2001/XMLSchema-instance')
                if ($groupType -ne 'AxFormGroupControl') {
                    continue
                }

                $groupName = (Get-DirectChild -Node $group -Name 'Name').InnerText
                $nestedPattern = Get-DirectChild -Node $group -Name 'Pattern'
                if ($nestedPattern) {
                    Add-Issue -File $File -Object $formName -Code 'FORM_FIELDS_CHILD_PATTERN' `
                        -Message "Child group '$groupName' must not repeat Pattern=FieldsFieldGroups."
                }

                $columnsMode = Get-DirectChild -Node $group -Name 'ColumnsMode'
                if ($columnsMode -and $columnsMode.InnerText -ne 'Fixed') {
                    Add-Issue -File $File -Object $formName -Code 'FORM_FIELDS_CHILD_COLUMNS' `
                        -Message "Child field group '$groupName' must use ColumnsMode=Fixed when specified."
                }
            }
        }
    }

    foreach ($dataGroupNode in $form.SelectNodes("//*[local-name()='DataGroup']")) {
        $control = $dataGroupNode.ParentNode
        $controlNameNode = Get-DirectChild -Node $control -Name 'Name'
        $controlName = if ($controlNameNode) { $controlNameNode.InnerText } else { '<unnamed>' }
        $dataSourceName = Get-InheritedDataSource -Node $control -Design $design

        if (-not $dataSourceName -or -not $dataSourceTables.ContainsKey($dataSourceName)) {
            Add-Issue -File $File -Object $formName -Code 'FORM_DATAGROUP_DATASOURCE' `
                -Message "Control '$controlName' DataGroup '$($dataGroupNode.InnerText)' has no resolvable datasource."
            continue
        }

        $tableName = $dataSourceTables[$dataSourceName]
        $tablePath = Find-TableXml -TableName $tableName
        if (-not $tablePath) {
            Add-Issue -File $File -Object $formName -Code 'FORM_DATAGROUP_TABLE' `
                -Message "Datasource '$dataSourceName' table '$tableName' was not found under '$MetadataRoot'."
            continue
        }

        [xml] $tableDocument = Get-Content -LiteralPath $tablePath -Raw
        $matchingGroup = $tableDocument.SelectSingleNode(
            "/*[local-name()='AxTable']/*[local-name()='FieldGroups']/*[local-name()='AxTableFieldGroup'][./*[local-name()='Name' and text()='$($dataGroupNode.InnerText)']]"
        )

        if (-not $matchingGroup) {
            Add-Issue -File $File -Object $formName -Code 'FORM_DATAGROUP_MISSING' `
                -Message "Control '$controlName' references missing field group '$($dataGroupNode.InnerText)' on table '$tableName'."
        }
    }
}

foreach ($inputPath in $Path) {
    $resolvedPath = (Resolve-Path -LiteralPath $inputPath).Path
    try {
        [xml] $document = Get-Content -LiteralPath $resolvedPath -Raw
    }
    catch {
        Add-Issue -File $resolvedPath -Object '<unknown>' -Code 'XML_PARSE' -Message $_.Exception.Message
        continue
    }

    switch ($document.DocumentElement.LocalName) {
        'AxTable' { Test-AxTable -File $resolvedPath -Document $document }
        'AxForm'  { Test-AxForm -File $resolvedPath -Document $document }
        default {
            Add-Issue -File $resolvedPath -Object $document.DocumentElement.LocalName -Code 'UNSUPPORTED_ROOT' `
                -Message 'Only AxTable and AxForm contracts are currently validated.'
        }
    }
}

if ($issues.Count -gt 0) {
    $issues | Format-List Object, Code, Message, File
    exit 1
}

Write-Host "AOT contract validation passed for $($Path.Count) file(s)."
