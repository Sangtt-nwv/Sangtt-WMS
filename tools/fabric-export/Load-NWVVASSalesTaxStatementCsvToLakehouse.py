# Fabric notebook helper.
# Upload the exported CSV folder to a Lakehouse path such as:
# Files/nwvvas_sales_tax_statement/data
# Then run this notebook cell to create Delta tables.

source_folder = "Files/nwvvas_sales_tax_statement/data"

tables = [
    "TaxTrans",
    "NWVVASTaxStatementLineTaxCode",
    "NWVVASTaxStatementLine",
    "NWVVASTaxStatement",
    "NWVVASParameters",
    "LedgerJournalTrans",
    "CustInvoiceJour",
    "CustTable",
    "ProjInvoiceJour",
    "TaxRegistration",
    "TaxRegistrationTypeApplicabilityRule",
    "TaxRegistrationLegislationTypes",
    "DirPartyLocation",
    "TaxVATNumTable",
    "CompanyInfo",
    "LogisticsLocation",
    "LogisticsLocationRole",
    "DirPartyPostalAddressView",
    "Ledger",
    "Currency",
]

for table in tables:
    path = f"{source_folder}/{table}.csv"
    target_table = table.lower()
    print(f"Loading {path} -> {target_table}")

    df = (
        spark.read
        .option("header", "true")
        .option("quote", "\"")
        .option("escape", "\"")
        .option("multiLine", "true")
        .option("inferSchema", "true")
        .csv(path)
    )

    (
        df.write
        .format("delta")
        .mode("overwrite")
        .option("overwriteSchema", "true")
        .saveAsTable(target_table)
    )

print("Done.")
