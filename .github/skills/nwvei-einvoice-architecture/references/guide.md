# NWVEI E-Invoice Integration — Architecture & Data Flow Baseline

> **Document purpose:** Authoritative architectural reference for the NaviWorld Vietnam E-Invoice (NWVEI) Viettel integration engine.  
> **Source revision:** Reverse-engineered from workspace at `\NWVEI` (May 2026).  
> **Target audience:** D365 F&O technical architects and senior developers working on the NWVEI module.

---

## Table of Contents

1. [System Overview](#1-system-overview)
2. [Class & Component Hierarchy](#2-class--component-hierarchy)
3. [NWVEIHeader Staging Table Schema](#3-nwveiheader-staging-table-schema)
4. [NWVEILines Staging Table Schema](#4-nwveilines-staging-table-schema)
5. [Supported Source Documents](#5-supported-source-documents)
6. [Supported API Operations (NWVEIAPIType)](#6-supported-api-operations-nwveiapitype)
7. [End-to-End Data Flow — Per Operation](#7-end-to-end-data-flow--per-operation)
   - 7.1 [SendEInvoice (Normal / Replace / Adjust)](#71-sendinvoice--normal--replace--adjust)
   - 7.2 [Cancel Invoice](#72-cancel-invoice)
   - 7.3 [CreateDraft](#73-createdraft)
   - 7.4 [DeleteDraft](#74-deletedraft)
   - 7.5 [PrintEInvoice](#75-printeinvoice)
   - 7.6 [UpdateTaxInfo](#76-updatetaxinfo)
8. [Source-Document–Specific Data Mapping](#8-source-document-specific-data-mapping)
   - 8.1 [AccountReceivable (AR — Sales Orders / FTI)](#81-accountreceivable-ar--sales-orders--fti)
   - 8.2 [AccountPayable (AP — Purchase Invoices)](#82-accountpayable-ap--purchase-invoices)
   - 8.3 [Project Invoices](#83-project-invoices)
   - 8.4 [InventoryManagement (Transfer / Journal)](#84-inventorymanagement-transfer--journal)
9. [JSON Payload Construction Architecture](#9-json-payload-construction-architecture)
10. [Token Acquisition Flow](#10-token-acquisition-flow)
11. [API Response Handling & Status Machine](#11-api-response-handling--status-machine)
12. [Core Business Rules](#12-core-business-rules)
13. [Technical Debt & Observations](#13-technical-debt--observations)

---

## 1. System Overview

The NWVEI module provides a **multi-provider, data-driven e-invoice issuance engine** for D365 F&O Vietnam localisation. The Viettel integration is one of seven supported providers (Viettel, VNPT, BKAV, Vacom, FPT, MISA, ThaiSon), all sharing the same abstract framework.

**High-level flow:**

```
User Action (Form / MenuItemAction)
  → NWVEIIssueInvoice.main()          [RunBaseBatch entry point]
      → NWVEIIssueInvoiceFactory::construct(Provider)
          → NWVEIIssueInvoice_Viettel.processInvoice()
              → NWVEIJsonBuilder_Viettel::buildJson()
                  → NWVEIJsonBuilderBase.generateJson()       [data-driven mapping engine]
                      ← NWVEIMappingTable / NWVEIProviderCategory / NWVEIMappingDetail
              → NWVEIApiClientViettel.postRequest()           [HTTP POST to Viettel]
              → NWVEIHeader / NWVEILog update
```

**Key design principle:** The JSON payload is **entirely data-driven**. No D365FO fields are hardcoded into the builder. All mappings (D365FO table.field → Viettel JSON element name) live in the `NWVEIMappingDetail` configuration table, keyed by `(Provider, ApiType, SourceDocument)`.

---

## 2. Class & Component Hierarchy

```
RunBaseBatch
  └── NWVEIIssueInvoice                       [entry point, not provider-specific]

NWVEIIssueInvoiceBase (abstract)
  ├── header: NWVEIHeader
  ├── apiType: NWVEIAPIType
  ├── token: str
  ├── processInvoice() [abstract]
  ├── updateInventorySourceStatus()           [writes back to InventJournalTable / InventTransferJour]
  └── getOrFetchFromApi_Token()               [BUG: calls Vacom builder — see §13]
        └── NWVEIIssueInvoice_Viettel         [concrete Viettel implementation]

NWVEIIssueInvoiceFactory
  └── construct(NWVEIProvider) → NWVEIIssueInvoiceBase

NWVEIJsonBuilderBase (abstract)
  ├── generateJson()                          [main data-driven orchestrator]
  ├── buildJSONLines()                        [JArray for itemInfo / taxBreakdowns]
  ├── buildMetadataFromSetup()               [metadata / dataExtension from NWVEIMetadataSetup]
  ├── processNode() / processLeaf()          [recursive JSON tree walk]
  ├── getFieldValue()                         [resolves table.field → anytype at runtime]
  └── addProperty()                          [typed JToken serialisation]
        └── NWVEIJsonBuilder_Viettel
              ├── BuildJSONGetToken()         [token request payload]
              ├── buildJson()                 [public façade → generateJson()]
              ├── resolveApiType()            [Adjust / Replace / CreateDraft routing]
              └── onTransferJourLoaded()      [loads first InventTransferJourLine]
```

### Supporting tables used by the builder engine

| Table | Purpose |
|---|---|
| `NWVEIMappingTable` | Top-level mapping config key: `(ApiType, SourceDocument, Provider)` |
| `NWVEIProviderCategory` | Defines JSON tree nodes: name, parent, RequestCategory, HasChild, IsNumber |
| `NWVEIMappingDetail` | Maps JSON `ElementName` → `TableName.FieldName`; flags: `IsDefault`, `IsMethod`, `FieldType`, `MappingArea`, `MetadataID` |
| `NWVEIMetadataSetup` | Drives `metadata` / `dataExtension` arrays per `(Provider, TemplateCode)` |
| `NWVEILinesGroup` | Line-grouping rows — collapse multiple `NWVEILines` into a single JSON line |
| `NWVEITaxBreakdowns` | Tax breakdown summary rows per `AuthId` for the `TaxBreakdowns` category |

---

## 3. NWVEIHeader Staging Table Schema

`NWVEIHeader` is the **central invoice staging record** that decouples source documents from the e-invoice engine. One row exists per e-invoice attempt. All provider operations operate exclusively against `NWVEIHeader`; source tables are only re-joined during JSON building.

| Field | Type | EDT | Description |
|---|---|---|---|
| `AuthId` | String | `NWVEIAuthId` | Primary clustered key — GUID linking header to source document extension fields (e.g. `CustInvoiceJour.NWVEIAuthId`) |
| `InvoiceId` | String | `NWVEIInvoiceId` | Editable invoice identifier (SalesId / ProjInvoiceId / TransferId) |
| `Voucher` | String | `Voucher` | Ledger voucher from source document |
| `InvoiceDate` | Date | `TransDate` | Original posting date |
| `SourceDocument` | Enum | `NWVEISourceDocument` | `AccountReceivable`, `AccountPayable`, `Project`, `InventoryManagement` |
| `SourceDocumentId` | String | `NWVEISourceDocumentId` | SalesId / PurchId / ProjId / TransferId |
| `InvoiceType` | String | `NWVEIInvoiceType` | Textual type (e.g. "SalesOrder", "Project") |
| `InvoiceAccount` | String | `CustVendAC` | Customer / vendor account |
| `CurrencyCode` | String | `CustCurrencyCode` | Transaction currency |
| `InvoiceAmount` | Real | `AmountCur` | Total inc. VAT |
| `SalesBalance` | Real | `AmountCur` | Pre-tax amount (= `SalesBalance + SumMarkup + SumLineDisc`) |
| `SumTax` | Real | `TaxAmountCur` | Total VAT |
| `ExchRate` | Real | `CustExchRate` | Exchange rate ÷ 100 (stored as decimal, e.g. 1.0 for VND) |
| `InvoiceAmountMST` | Real | `AmountMST` | Amount in accounting currency (VND) |
| `Status` | Enum | `NWVEIStatus` | Workflow state — see §11 |
| `EInvoiceType` | Enum | `NWVEIType` | `Origin`, `Replace`, `IncreaseAdjustment`, `DecreaseDdjustment`*, `Cancel`, `Cancelled`, `Adjusted`, `Replaced` |
| `EInvoiceNumber` | String | `NWVEIEInvoiceNumber` | Viettel-assigned invoice number (written back after issue) |
| `EIAuthId` | String | `NWVEIEIAuthId` | Tax authority authentication code (`codeOfTax`) |
| `EInvoiceDate` | Date | `TransDate` | E-invoice official date |
| `EIPattern` | String | `NWVEIPattern` | Invoice form pattern (e.g. "01GTKT0/001") |
| `EInvoiceSerial` | String | `NWVEISerial` | Invoice series (from template) |
| `EICompanyAddress` | String | `LogisticsAddressStreet` | Seller company address |
| `EICompanyName` | String | `Description` | Seller company name |
| `EITaxCode` | String | `TaxRegistrationNumber` | Buyer tax code |
| `EIBuyerName` | String | `NWVEIBuyerName` | Buyer name (overridable) |
| `EIBuyerBankAccountNum` | String | `NWVEIBankAccountNum` | Buyer bank account |
| `EIBuyerBankName` | String | `NWVEIBankAddress` | Buyer bank name |
| `EIPaymId` | String | `NWVEIPaymId` | Payment method identifier |
| `EIEmail` | String | `Email` | Buyer email for delivery |
| `EInvoiceNote` | String | `NWVEInvoiceNote` | Adjustment/replacement note line (appended as `Selection='4'`) |
| `EInvoiceDescription` | Enum | `NWVEIDescription` | Vietnamese item name mode |
| `EINegativeInvoice` | Enum | `NWVEINegativeInvoice` | Negative invoice flag |
| `EIOriginalInvoice` | String | `NWVEIInvoiceId` | Source InvoiceId of the original invoice for adj/replace/cancel |
| `EIOriginalEInvoice` | String | `NWVEIInvoiceId` | Original E-Invoice number |
| `EIReason` | String | `NWVEIReason` | Reason text for cancel/adjust/replace |
| `NWVEITemplate` | Int64 | `RefRecId` | FK → `NWVEITemplate.RecId` |
| `Party` | Int64 | `DirPartyRecId` | Global address book party for buyer |
| `RefRecId` | Int64 | `RefRecId` | RecId of the source document journal record |
| `EIVendorGUID` | String | `NWVEIAuthId` | Provider-assigned GUID (Viettel `transactionUuid`) |
| `TransferOrderType` | Enum | `NWVEITransferOrderType` | Internal / AgentTransfer — governs which `NWVEIProviderCategory` nodes apply |
| `CompanyRequirement` | String | `NWVEICompanyRequirement` | Consignee company name (inventory) |
| `NumberRequirement` | String | `NWVEIContractNumber` | Delivery note number (inventory) |
| `ContractNumber` | String | `NWVEIContractNumber` | Contract reference (inventory) |
| `DeliverName` | String | `NWVEIDelivery` | Deliverer name |
| `Transportation` | String | `String50` | Transport vehicle/type |
| `WarehouseExport` | String | `NWVEICompanyAddress` | Export warehouse address |
| `ReceiverName` | String | `NWVEIBuyerName` | Receiver name |
| `WarehouseImport` | String | `NWVEICompanyAddress` | Import warehouse address |
| `DateRequirement` | Date | `TransDate` | Delivery date requirement |

> **Note:** `NWVEIHeader` is a **denormalized snapshot** at the time of invoice creation. Changes to the source document after staging do NOT automatically update the header.

---

## 4. NWVEILines Staging Table Schema

One row per invoice line, linked to `NWVEIHeader` via `AuthId`. The JSON builder reads from a **sorted temporary buffer** of these rows.

| Field | Type | Description |
|---|---|---|
| `AuthId` | String | FK → `NWVEIHeader.AuthId` |
| `LineNum` | Real | Sequence number (re-numbered 1..N during build) |
| `InvoiceType` | String | Inherited from header |
| `ItemId` | String | D365FO item number (cleared for group-summary rows) |
| `Description` | String | Line description / Vietnamese item name |
| `Qty` | Real | Quantity |
| `SalesUnit` | String | Unit of measure |
| `CurrencyCode` | String | Transaction currency |
| `UnitPrice` | Real | Unit price |
| `LineAmount` | Real | Line amount excl. VAT |
| `TaxAmount` | Real | VAT amount for this line |
| `TaxItemGroup` | String | D365FO item sales tax group |
| `TaxGroup` | String | D365FO customer sales tax group |
| `TaxCode` | String | Effective tax rate as string (e.g. `"10"` for 10%) |
| `RefRecId` | Int64 | RecId of source journal line (used to load `CustInvoiceTrans` etc.) |
| `GroupId` | String | Group identifier — blank for ungrouped lines |
| `Selection` | String | `'1'` normal, `'2'` zero-amount, `'4'` adjustment note |
| `IsDecrease` | Enum | `NoYes` — indicates a decrease adjustment line |

---

## 5. Supported Source Documents

| `NWVEISourceDocument` | D365FO Journal Table | D365FO Line Table | Init Method on NWVEIHeader |
|---|---|---|---|
| `AccountReceivable` | `CustInvoiceJour` | `CustInvoiceTrans` | `initFromCustInvoiceJour()` |
| `AccountPayable` | `VendInvoiceJour` | `VendInvoiceTrans` | `initFromVendInvoiceJour()` |
| `Project` | `ProjInvoiceJour` | `ProjInvoiceItem`, `ProjInvoiceEmpl`, `ProjInvoiceRevenue`, `ProjInvoiceOnAcc`, `ProjInvoiceCost` | `initFromProjProposalJour()` |
| `InventoryManagement` | `InventJournalTable` **or** `InventTransferJour` | `InventJournalTrans` **or** `InventTransferJourLine` | `initFromInventTransferJour()` |

### Entry point dispatch (NWVEIIssueInvoice.main)

`Args.record()` can be of type `InventJournalTable`, `InventTransferJour`, or `NWVEIHeader` directly. For inventory tables, the header is located via `NWVEIHeader::find(inventXxx.NWVEIAuthId)`.

---

## 6. Supported API Operations (NWVEIAPIType)

| `NWVEIAPIType` | Description | HTTP Method / Content-Type | Viettel Endpoint Pattern |
|---|---|---|---|
| `RequestAccessToken` | Obtain JWT bearer token | POST / `application/json` | Configured in `NWVEIAPISetup` |
| `CreateDraft` | Submit draft invoice | POST / `application/json` | `{url}/{TaxNumber}` |
| `PrintEInvoice` | Download PDF (Base64) | POST / `application/json` | `{url}` |
| `SendEInvoice` | Officially issue / replace / adjust | POST / `application/json` | `{url}/{TaxNumber}` |
| `DeleteDraft` | **Local only** — resets status to `NotSend` | None (no HTTP call) | — |
| `CancelInvoice` | Cancel an issued invoice | POST / `application/x-www-form-urlencoded` | `{url}` |
| `UpdateTaxInfo` | Query Viettel for `codeOfTax` and `invoiceNo` | POST / `application/x-www-form-urlencoded` | `{url}` |

---

## 7. End-to-End Data Flow — Per Operation

### 7.1 SendEInvoice — Normal / Replace / Adjust

```
processInvoice()
  1. Obtain token  → BuildJSONGetToken → POST RequestAccessToken URL
  2. Extract token = response["access_token"]
  3. User confirmation: Box::yesNo("@NWVEI:ConfimrIsueInvoices")
  4. If EInvoiceType == Cancel  → redirect to Cancel sub-flow (§7.2)
  5. If EInvoiceType ∈ {Replace, IncreaseAdjustment, DecreaseDdjustment}
       → validate originalHeader = NWVEIHeader::findByInvoiceId(header.EIOriginalInvoice)
  6. Build body  → NWVEIJsonBuilder_Viettel::buildJson(header, SendEInvoice)
  7. POST {SendEInvoice_URL}/{setup.TaxNumber}  via NWVEIApiClientViettel.postRequest()
  8. SUCCESS criterion: response contains literal string "invoiceNo"
       → Extract: result["result"]["invoiceNo"]  → header.EInvoiceNumber
       → Extract: result["result"]["codeOfTax"]  → header.EIAuthId
       → header.Status = Issued
       → If Adjustment: originalHeader.EInvoiceType = Adjusted
       → If Replace:    originalHeader.EInvoiceType = Replaced
       → updateInventorySourceStatus(Issued, invoiceNo, codeOfTax)
  9. FAILURE: response does NOT contain "invoiceNo"
       → NWVEILog.Status = SendError, NWVEILog.ResponeDescription = response["data"]
       (header status NOT updated on failure for SendEInvoice — see §13)
```

### 7.2 Cancel Invoice

There are two entry paths for cancellation:

**Path A — `NWVEIAPIType::CancelInvoice` (direct cancel)**
```
  1. Obtain token
  2. SearchInvoiceByTransactionUuid_Vietel(header, token) → issueDate
     (queries UpdateTaxInfo endpoint with supplierTaxCode + transactionUuid)
  3. POST CancelInvoice URL with URL-encoded body:
       supplierTaxCode, templateCode, invoiceNo, strIssueDate, additionalReferenceDate,
       additionalReferenceDesc=header.EIReason, reasonDelete=header.EIReason
  4. SUCCESS: response["code"] == "200" OR response["code"] == "" (absent)
       → header.Status = Issued (⚠ confirms cancellation as "issued")
       → header.EInvoiceType = Cancelled
       → updateInventorySourceStatus(Issued, '', '', markAsCancelled=Yes)
  5. FAILURE: log error; header NOT updated
```

**Path B — `NWVEIAPIType::SendEInvoice` with `EInvoiceType == Cancel`**
```
  1. If InventoryManagement: originalHeader = NWVEIHeader::find(header.AuthId)
     Else:                    originalHeader = NWVEIHeader::findByInvoiceId(header.EIOriginalInvoice)
  2. SearchInvoiceByTransactionUuid_Vietel(originalHeader, token) → issueDate
  3. Same URL-encoded POST as Path A, but using originalHeader fields
  4. SUCCESS: header.Status = Issued; originalHeader.EInvoiceType = Cancelled
```

> **Key difference:** Path A operates on the `header` itself; Path B targets a *cancel record* whose `EInvoiceType = Cancel` and cancels the *original* invoice.

### 7.3 CreateDraft

```
  1. Guard: header.Status == Issued → throw error "@NWVEI:ErrorDraft"
  2. User confirmation
  3. Build body → NWVEIJsonBuilder_Viettel::buildJson(header, CreateDraft)
  4. POST {CreateDraft_URL}/{TaxNumber} via apiClient.postRequest()
  5. SUCCESS: response contains "fileToBytes"
       → Base64-decode → MemoryStream → File::SendFileToUser(stream, "{InvoiceId/SourceDocumentId}.pdf")
       → header.Status = Draft
       → updateInventorySourceStatus(Draft)
  6. FAILURE: response does NOT contain "fileToBytes"
       → log error
       → header.Status = SendError
       → updateInventorySourceStatus(SendError)
```

### 7.4 DeleteDraft

```
  1. Guard: header.Status == Issued → throw error "@NWVEI:ErrorDeleteDraft"
  2. User confirmation
  3. NO API CALL — Viettel draft deletion is handled locally only
  4. NWVEILog.Status = DeleteDraft (logged as confirmation)
  5. header.Status = NotSend
  6. updateInventorySourceStatus(NotSend)
```

> **Note:** This is a local-only operation. The draft is not actually deleted from Viettel's system. Requires further tracing to confirm if Viettel provides a delete-draft endpoint.

### 7.5 PrintEInvoice

```
  1. Obtain token
  2. If header.Status == Issued:
       Build body → NWVEIJsonBuilder_Viettel::buildJson(header, PrintEInvoice)
       POST PrintEInvoice URL with token
  Else (not yet issued):
       Build body → NWVEIJsonBuilder_Viettel::buildJson(header, CreateDraft)
       POST CreateDraft_URL/{TaxNumber} via apiClient.postRequest()
  3. SUCCESS: response contains "fileToBytes"
       → Base64-decode → MemoryStream
       → If InventoryManagement: filename = "{SourceDocumentId}.pdf"
         Else:                   filename = "{InvoiceId}.pdf"
       → File::SendFileToUser(stream, filename)
       → NWVEILog.Status = PrintEInvoice
  4. FAILURE: NWVEILog.Status = SendError
     (header.Status NOT updated for PrintEInvoice — read-only operation)
```

### 7.6 UpdateTaxInfo

```
  1. Obtain token
  2. POST UpdateTaxInfo URL with URL-encoded: supplierTaxCode + transactionUuid=header.AuthId
  3. Parse response["result"] JArray → iterate items
       → exchangeDes, codeOfTax, invoiceNo from each item
  4. SUCCESS: result == 'null' (meaning exchangeDes is the literal string "null" = no error)
       → header.EIAuthId = codeOfTax
       → header.EInvoiceNumber = invoiceNo
       → updateInventorySourceStatus(UpdateTaxInfo, invoiceNo, codeOfTax)
  5. FAILURE: result != 'null' → log error
```

---

## 8. Source-Document–Specific Data Mapping

### Pre-staging (initFrom… methods)

Before the JSON builder runs, `NWVEIHeader.initFromXxx()` populates the staging record. The following tables document what is read from the source document at **staging time** and where it lands in `NWVEIHeader`.

### 8.1 AccountReceivable (AR — Sales Orders / FTI)

**Source table:** `CustInvoiceJour` (header), `CustInvoiceTrans` (lines)

| `CustInvoiceJour` Field | `NWVEIHeader` Field | Notes |
|---|---|---|
| `NWVEIAuthId` | `AuthId` | Correlation key |
| `SalesId` | `SourceDocumentId` | |
| `InvoiceId` | `InvoiceId` | |
| `LedgerVoucher` | `Voucher` | |
| `InvoiceDate` | `InvoiceDate` | |
| `enum2Str(RefNum)` | `InvoiceType` | |
| `InvoiceAccount` | `InvoiceAccount` | |
| `CurrencyCode` | `CurrencyCode` | |
| `InvoiceAmount` | `InvoiceAmount` | |
| `SalesBalance + SumMarkup + SumLineDisc` | `SalesBalance` | Pre-tax amount |
| `SumTax` | `SumTax` | |
| `ExchRate / 100` | `ExchRate` | D365FO stores rate × 100 |
| `InvoiceAmountMST` | `InvoiceAmountMST` | |
| `NWVEIEInvoice` | `EInvoice` | |
| `NWVEIType` | `EInvoiceType` | |
| `NWVEIBuyerName` | `EIBuyerName` | Editable buyer name override |
| `NWVEIBankAccountNum` | `EIBuyerBankAccountNum` | |
| `NWVEIBankName` | `EIBuyerBankName` | |
| `NWVEIPaymId` | `EIPaymId` | |
| `NWVEIEmail` | `EIEmail` | |
| `NWVEInvoiceNote` | `EInvoiceNote` | |
| `NWVEIEInvoiceDescription` | `EInvoiceDescription` | |
| `NWVEINegativeInvoice` | `EINegativeInvoice` | |
| `NWVEIOriginalInvoice` | `EIOriginalInvoice` | |
| `NWVEIOriginalEInvoice` | `EIOriginalEInvoice` | |
| `NWVEIReason` | `EIReason` | |
| `NWVEICompanyAddress` | `EICompanyAddress` | |
| `NWVEICompanyName` | `EICompanyName` | |
| `NWVEITaxCode` | `EITaxCode` | |
| `NWVEITemplate` | `NWVEITemplate` | FK to NWVEITemplate |
| `template.SerialNo` | `EInvoiceSerial` | Resolved from template |
| `template.Pattern` | `EIPattern` | |
| `custTable_InvoiceAccount().Party` | `Party` | Global address book |

**JSON builder source buffers loaded at build time:**

```xpp
// In generateJson() for AccountReceivable:
select firstonly custInvoiceJour where custInvoiceJour.NWVEIAuthId == _header.AuthId;
this.custTable = CustTable::find(_header.InvoiceAccount);

// Per line, in initLineSourceDocuments():
custInvoiceTrans = CustInvoiceTrans::findRecId(this.lines.RefRecId);
```

Available tables for `NWVEIMappingDetail` field resolution:
- `NWVEIHeader`, `NWVEILines`, `NWVEISetup`, `NWVEITemplate`
- `CustTable`, `CustInvoiceJour`, `CustInvoiceTrans`

### 8.2 AccountPayable (AP — Purchase Invoices)

**Source table:** `VendInvoiceJour` (header), `VendInvoiceTrans` (lines)

Staging logic mirrors AR exactly. Differences:

| `VendInvoiceJour` Field | `NWVEIHeader` Field | Notes |
|---|---|---|
| `PurchId` | `SourceDocumentId` | |
| `enum2Str(PurchaseType)` | `InvoiceType` | |
| — | `Party` | `vendTable_InvoiceAccount().Party` |

**JSON builder source buffers:**
- `NWVEIHeader`, `NWVEILines`, `NWVEISetup`, `NWVEITemplate`
- `VendTable`, `VendInvoiceJour`, `VendInvoiceTrans`

### 8.3 Project Invoices

**Source table:** `ProjInvoiceJour` (header), multiple line tables

| `ProjInvoiceJour` Field | `NWVEIHeader` Field | Notes |
|---|---|---|
| `ProjInvoiceId` | `InvoiceId` | |
| `LedgerVoucher` | `Voucher` | |
| `'Project'` (literal) | `InvoiceType` | Hardcoded string |
| `InvoiceAccount` | `InvoiceAccount` | |
| `CurrencyId` | `CurrencyCode` | Note: field name differs from other sources |
| `SalesOrderbalance + SumMarkup + SumLineDisc` | `SalesBalance` | |
| `invoiceAmountMST()` (method call) | `InvoiceAmountMST` | Uses method, not field |
| `ProjProposalJour::find(ProposalId).projId()` | `SourceDocumentId` | Two-hop resolution |
| `CustTable::find(InvoiceAccount).Party` | `Party` | |

**JSON builder line buffers** (loaded per line via `RefRecId`):
```xpp
invoiceItem    = ProjInvoiceItem::findRecId(lines.RefRecId);
invoiceEmpl    = ProjInvoiceEmpl::findRecId(lines.RefRecId);
invoiceRevenue = ProjInvoiceRevenue::findRecId(lines.RefRecId);
invoiceOnAcc   = ProjInvoiceOnAcc::findRecId(lines.RefRecId);
invoiceCost    = ProjInvoiceCost::findRecId(lines.RefRecId);
```

> All five project line types are loaded for every `NWVEILines` row. Only the one matching the original source will be non-empty. Field mapping in `NWVEIMappingDetail` must point to the correct table.

### 8.4 InventoryManagement (Transfer / Journal)

**Source table:** `InventTransferJour` **or** `InventJournalTable` (header); `InventTransferJourLine` **or** `InventJournalTrans` (lines)

This source document has the most complex header staging logic (`initFromInventTransferJour`):

| `InventTransferJour` Field | `NWVEIHeader` Field | Notes |
|---|---|---|
| `NWVEIAuthId` | `AuthId` | |
| `TransferId` | `SourceDocumentId` + `InvoiceId` | Used for PDF filename too |
| `VoucherId` | `Voucher` | |
| `TransDate` | `InvoiceDate` + `EInvoiceDate` | |
| `NWVEICompanyRequirement` | `CompanyRequirement` | Falls back to `NWVEIParameter.CompanyRequirement` |
| `NWVEINumberRequirement` | `NumberRequirement` | |
| `NWVEIContractNumber` | `ContractNumber` | Falls back to `NWVEIParameter.ContractNumber` |
| `NWVEITaxNumber` | `EITaxCode` | Buyer tax code |
| `NWVEICompanyRequirement` (if TaxNumber set) | `EICompanyName` | Condition: if `EITaxCode != ''` |
| `NWVEIDeliverName` | `DeliverName` | Falls back to `NWVEIParameter.Delivery` |
| `NWVEITransportation` | `Transportation` | |
| `NWVEIWarehouseExport` | `WarehouseExport` | |
| `NWVEIReceiverName` | `ReceiverName` | |
| `NWVEIWarehouseImport` | `WarehouseImport` | |
| `NWVEIType` | `EInvoiceType` | |
| `NWVEITemplate` | `NWVEITemplate` | Falls back to `NWVEIParameter.NWVEITemplate` |
| `NWVEICurrencyCode` | `CurrencyCode` | Falls back to `curExt()`, then `'VND'` for VN |
| `1` (literal) | `ExchRate` | Hardcoded for inventory |
| `NWVEITransferOrderType` | `TransferOrderType` | Controls which category nodes are used (`InternalTransfer` vs. `AgentTransfer`) |

**Inventory-specific `NWVEIProviderCategory` filtering:**

```xpp
// In generateJson(), category nodes for InventoryManagement are filtered by:
childCategory.TransferOrderType == NWVEITransferOrderType::InternalTransfer
    || childCategory.TransferOrderType == this.header.TransferOrderType
```

This allows different JSON structures for internal warehouse transfers vs. agent-based transfers (PXK).

**Line source buffer loading:**
```xpp
select firstonly inventJournalTrans where inventJournalTrans.RecId == lines.RefRecId;
inventTransferJourLine = InventTransferJourLine::findRecId(lines.RefRecId);
```

**Viettel-specific override — `onTransferJourLoaded()`:**
```xpp
// NWVEIJsonBuilder_Viettel.onTransferJourLoaded():
select firstonly inventTransferJourLine
    where inventTransferJourLine.VoucherId == inventTransferJour.VoucherId;
```
This preloads the first line of the transfer journal as a header-level buffer, allowing `NWVEIMappingDetail` to reference `InventTransferJourLine` fields in the header section.

**Line Selection logic for InventoryManagement:**
```xpp
// All inventory lines always get Selection = '1' (regardless of LineAmount)
sortedTmpLines.Selection = '1';  // hardcoded for InventoryManagement
```

Contrast with AR/AP/Project:
```xpp
sortedTmpLines.Selection = (sortedTmpLines.LineAmount == 0) ? '2' : '1';
```

---

## 9. JSON Payload Construction Architecture

`NWVEIJsonBuilderBase.generateJson()` is a **table-driven recursive tree builder**. Understanding the configuration tables is essential to understanding any JSON payload.

### Configuration table relationships

```
NWVEIMappingTable  (1) ──────────────────────────────────────── (N)  NWVEIMappingDetail
   │  key: (ApiType, SourceDocument, Provider)                         │  key: (EIMappingTableRecId, ProviderCategory / MappingArea / RequestCategory)
   │                                                                    │  fields: TableName, FieldName, ElementName, IsDefault, DefaultValue,
   │                                                                    │          IsMethod, FieldType, MappingArea, MetadataID, LineNum
   │
   └── via (Provider, ApiType, SourceDocument) ── NWVEIProviderCategory
            fields: CategoryName, CategoryNameParent, CategoryDesc,
                    RequestCategory, HasChild, IsNumber, No (sort order),
                    TransferOrderType (for InventoryManagement filtering)
```

### Processing algorithm

```
generateJson(_header, _apiType):
  Load source-document journals into instance variables
  Find NWVEIMappingTable for (apiType, sourceDocument, provider)
  Load firstLine = first NWVEILines where AuthId = header.AuthId
  Construct JObject rootObj

  foreach rootCategory (CategoryNameParent == '') ordered by No:
    if RequestCategory == ItemInfo or TaxBreakdowns:
      → buildJSONLines()          // JArray
    elif RequestCategory == Metadata:
      → buildMetadataFromSetup()  // dynamic from NWVEIMetadataSetup
    elif HasChild == 1:
      → processNode()             // recursive
    else:
      → processLeaf()             // single header-level field

  return rootObj.ToString()
```

### MappingArea values in NWVEIMappingDetail

| `NWVEIMappingArea` | Used by | Description |
|---|---|---|
| `Header` | `buildJObjectMappingDetail`, `buildTaxBreakDownsJObject`, `processLeaf` | Header-level fields (invoice date, buyer info, etc.) |
| `Line` | `buildJObjectMappingDetail` | Per-line fields (item, qty, price) |
| `Footer` | `buildJObjectMappingDetail`, `buildTaxBreakDownsJObject` | Summary/footer fields |

### Field type serialisation

| `NWVEICustomFieldType` | JSON output |
|---|---|
| `String` (default) | JSON string `"value"` |
| `Integer` | JSON number (no decimals) |
| `Real` | JSON number (with decimals) |
| `Date` | ISO `"YYYY-MM-DD"` or `""` if `dateNull()` |
| `DateTime` | ISO 8601 `"YYYY-MM-DDTHH:MM:SS"` |
| `Boolean` | `true` / `false` / `null` (if DefaultValue == 'null') |
| `Array` | Raw JSON parse of the string value |

### String sanitisation

All string values pass through `stringReplace()`:
- Strips `<` and `>` characters (XML injection prevention)
- Strips `\n` and `\r`
- Trims whitespace (`strLRTrim`)

### Line grouping (NWVEILinesGroup)

When `NWVEILinesGroup` rows exist for an `AuthId`, individual `NWVEILines` rows with a matching `GroupId` are collapsed into a single summary row. The group row uses:
- `linesGroup.Description` as the item description
- `linesGroup.LineAmount`, `TaxAmount`, `Qty`, `UnitPrice`, `SalesUnit`
- `ItemId` cleared (set to `''`)
- `Selection = '1'`

Ungrouped lines (where `NWVEILines.GroupId == ''`) are appended after all group rows.

---

## 10. Token Acquisition Flow

```xpp
// NWVEIJsonBuilder_Viettel.BuildJSONGetToken():
NWVEIJsonBuilder_Viettel builder = new NWVEIJsonBuilder_Viettel();
return builder.serializeTokenPayload(builder.buildTokenObject(_setup));

// buildTokenObject() reads NWVEIMappingDetail for (RequestAccessToken, None, Provider)
// where MappingArea == Header:
//   IsDefault == false → read _setup.(fieldName2Id(...))   [e.g. username, password]
//   IsDefault == true  → use DefaultValue                  [e.g. grant_type = 'password']
```

The token JSON structure (field names, credentials field names) is therefore **fully configurable** via `NWVEIMappingDetail` — no hardcoded credential field names exist in the class.

`serializeTokenPayload()` default: returns `jObject.ToString()` (plain JSON object). Override in ThaiSon/MISA wraps in a JArray.

---

## 11. API Response Handling & Status Machine

### NWVEIStatus state machine

```
NotSend
  │
  ├─[CreateDraft OK]──→ Draft
  │                       │
  │                       ├─[DeleteDraft]──────────────────→ NotSend
  │                       └─[SendEInvoice OK]───────────────→ Issued
  │                                                               │
  ├─[SendEInvoice OK]──────────────────────────────────────→ Issued
  │                                                               │
  │                                                               ├─[CancelInvoice OK]──→ Issued (EInvoiceType=Cancelled)
  │                                                               └─[UpdateTaxInfo OK]──→ Issued (EIAuthId/EInvoiceNumber updated)
  │
  └─[Any API Error]──→ SendError
```

### Response parsing logic by operation

| Operation | Success Criterion | Key Extracted Fields |
|---|---|---|
| `SendEInvoice` | `strScan(response, 'invoiceNo') != 0` | `result.invoiceNo` → `EInvoiceNumber`; `result.codeOfTax` → `EIAuthId` |
| `CreateDraft` | `strScan(response, 'fileToBytes') != 0` | `fileToBytes` (Base64 PDF) |
| `PrintEInvoice` | `strScan(response, 'fileToBytes') != 0` | `fileToBytes` (Base64 PDF) |
| `CancelInvoice` | `code == '200'` or `code == ''` (absent) | — |
| `UpdateTaxInfo` | `result == 'null'` (string literal) | `codeOfTax`, `invoiceNo`, from `result` JArray |
| `RequestAccessToken` | Field `access_token` present | `access_token` → `token` |

> **Fragility note:** Success detection uses `strScan` on the raw response string rather than structured JSON parsing. This means a response containing the word `"invoiceNo"` anywhere (e.g., in an error message) would be misidentified as success.

### NWVEILog record

Every API operation (success or failure) inserts a `NWVEILog` record:

| Field | Value |
|---|---|
| `AuthId` | `header.AuthId` |
| `InvoiceId` | `header.InvoiceId` |
| `Voucher` | `header.Voucher` |
| `APIType` | Current `apiType` |
| `Request` | Request body (JSON or URL-encoded string) |
| `Response` | Raw response string |
| `ResponeDescription` | Error detail (from `data` field on failure) |
| `Status` | `NWVEIStatus` value (Issued / SendError / Draft / etc.) |

### CLRError handling

A `catch (Exception::CLRError)` block wraps the entire `processInvoice()` body:

```xpp
ex = ClrInterop::getLastException();
ex = ex.get_InnerException();
if (ex is System.Net.WebException)
    httpWebResponse = webResponse as System.Net.HttpWebResponse;

// Writes log with httpWebResponse.StatusDescription
// Sets header.Status = SendError
// Calls updateInventorySourceStatus(SendError)
```

HTTP-level errors (4xx/5xx) are captured here. Application-level errors (invalid credentials, business rule violations) are returned in the response JSON `data` field and handled by the per-operation `if/else` blocks.

---

## 12. Core Business Rules

### R1 — User permission check
```xpp
// In NWVEIIssueInvoice.run():
select firstonly userPermission
    where userPermission.TemplateCode == template.TemplateCode
       && userPermission.UserId == curUserId();
if (!userPermission) throw Error("@NWVEI:ErrorPermission");
```
The current user must have an explicit row in `NWVEIUserPermission` for the invoice's template code. There is no role-based bypass.

### R2 — Template-SourceDocument validation
```xpp
// In NWVEIHeader.validateWrite():
if (SourceDocument == InventoryManagement && template.IsTranfer == No)   → error
if (SourceDocument != InventoryManagement && template.IsTranfer == Yes)  → error
```
Transfer templates (`IsTranfer = Yes`) may only be used for inventory source documents.

### R3 — Issued invoice immutability
```xpp
// In NWVEIHeader.validateDelete():
if (this.Status == NWVEIStatus::Issued) → checkFailed("@NWVEI:InvoiceIssuedCannotDelete")
```
Issued invoices cannot be deleted from `NWVEIHeader`. They must be formally cancelled via the Viettel API.

### R4 — Draft creation guard
```xpp
if (header.Status == NWVEIStatus::Issued) throw error("@NWVEI:ErrorDraft");
```
A draft cannot be created for an already-issued invoice.

### R5 — Cancel requires original invoice
For `Cancel`-type invoices, the original `NWVEIHeader` record must exist and be locatable. If `NWVEIHeader::findByInvoiceId()` returns empty, an error is thrown before any API call.

### R6 — Cancel uses issueDate from Viettel
The `strIssueDate` parameter in the cancel API call is **not taken from `NWVEIHeader.EInvoiceDate`**. It is dynamically retrieved from Viettel's `UpdateTaxInfo` endpoint via `SearchInvoiceByTransactionUuid_Vietel()`. This means a cancel always makes two API calls.

### R7 — Tax reduction indicator (8%)
```xpp
// NWVEIHeader.isTaxReduction43() display method:
while select TaxCode from lines where lines.AuthId == this.AuthId
    if (str2Num(lines.TaxCode) == 8) return 'true';
return 'false';
```
A display method checks whether any line has `TaxCode == 8` (numeric string comparison) to flag Decree 43 VAT reduction. This value is available as a `NWVEIHeader` display method for use in `NWVEIMappingDetail`.

### R8 — Adjustment note line
When `EInvoiceNote != ''` AND `EInvoiceType ∈ {DecreaseDdjustment, IncreaseAdjustment, Replace}`, an extra `NWVEILines`-equivalent row is appended to the JSON lines array with:
- `Description = header.EInvoiceNote`
- `Selection = '4'`
- `LineNum = N+1` (appended last)

### R9 — Metadata required field warning
```xpp
if (!resolvedValue && metaSetup.IsRequired == NoYes::Yes)
    warning(strFmt("@NWVEI:MetadataRequiredFieldEmpty", metaSetup.KeyLabel));
```
Missing required metadata fields produce a `warning()` (non-blocking), not an `error()`. Processing continues.

### R10 — NWVEIStatus::Issued on cancel confirmation
When a cancel succeeds, `header.Status` is set to `NWVEIStatus::Issued`, not a dedicated `Cancelled` status. The cancellation state is encoded in `header.EInvoiceType = NWVEIType::Cancelled`. Developers querying "cancelled invoices" must filter on `EInvoiceType`, not `Status`.

---

## 13. Technical Debt & Observations

### TD-1 — Typo in enum value: `DecreaseDdjustment`
```xpp
NWVEIType::DecreaseDdjustment  // Missing 'a' in 'Adjustment'
```
This typo is embedded in the `NWVEIType` enum and is referenced in conditional logic across all providers (`processInvoice`, `buildJSONLines`, `isTaxReduction43`, etc.). Renaming requires a coordinated change to all referencing code and the enum XML. Until fixed, all new code must replicate the typo to compile.

### TD-2 — `getOrFetchFromApi_Token()` calls wrong builder
```xpp
// In NWVEIIssueInvoiceBase.getOrFetchFromApi_Token():
str tokenJson = NWVEIJsonBuilder_Vacom::BuildJSONGetToken(_setup);
```
This protected base method hardcodes `Vacom` builder regardless of which provider is active. It is **not called** by `NWVEIIssueInvoice_Viettel.processInvoice()` (which calls `NWVEIJsonBuilder_Viettel::BuildJSONGetToken()` directly), but any new provider that inherits and calls `super.getOrFetchFromApi_Token()` will silently use the Vacom token format. This method should be abstract or accept a builder parameter.

### TD-3 — Success detection via `strScan` on raw response
```xpp
if (strScan(response, 'invoiceNo', 1, strLen(response)) == 0) { /* failure */ }
```
Using string scanning for JSON success detection is fragile. A response with `"invoiceNo"` in an error description (e.g., `"invoiceNo already exists"`) would be misidentified as success. Should be replaced with structured JSON parsing checking a `statusCode` or `errorCode` field.

### TD-4 — `DeleteDraft` makes no API call
The `DeleteDraft` operation resets `NWVEIHeader.Status` to `NotSend` but does not call the Viettel API. This creates a discrepancy: D365FO believes there is no draft, but Viettel's system may still hold the draft record. Requires verification of whether Viettel provides a draft-deletion endpoint and, if so, implementation of the API call.

### TD-5 — `NWVEIIssueInvoice` is `RunBaseBatch` but cannot run as batch
```xpp
public boolean canGoBatchJournal() { return false; }
```
The class inherits `RunBaseBatch` but explicitly disables batch journal capability. E-invoice issuance is therefore always interactive (UI-blocking). For high-volume scenarios this is a scalability constraint.

### TD-6 — `updateInventorySourceStatus()` uses `doUpdate()`
```xpp
inventJournalTable.doUpdate();
inventTransferJour.doUpdate();
```
`doUpdate()` bypasses overridden `update()` methods and all `DataEventHandler` subscribers on both tables. If those tables have CoC wrappers or event handlers performing audit or integration logic, they will not fire during NWVEI status write-back. Replace with `update()` unless there is a documented performance or recursion reason for the bypass.

### TD-7 — Five project line buffers loaded unconditionally per line
```xpp
invoiceItem    = ProjInvoiceItem::findRecId(lines.RefRecId);
invoiceEmpl    = ProjInvoiceEmpl::findRecId(lines.RefRecId);
invoiceRevenue = ProjInvoiceRevenue::findRecId(lines.RefRecId);
invoiceOnAcc   = ProjInvoiceOnAcc::findRecId(lines.RefRecId);
invoiceCost    = ProjInvoiceCost::findRecId(lines.RefRecId);
```
For every project invoice line, five `findRecId()` selects execute regardless of line type. For invoices with many lines, this is O(5N) round trips. An optimization would store the line type in `NWVEILines` and load only the relevant buffer.

### TD-8 — Hardcoded `today()` call (commented out, unresolved)
```xpp
//header.EInvoiceDate = today();
```
A commented-out `today()` usage exists in the `SendEInvoice` cancel flow. While not currently executing, it violates BP rule `BPUpgradeCodeToday`. The replacement (`DateTimeUtil::getToday(DateTimeUtil::getUserPreferredTimeZone())`) was never added.

### TD-9 — `NWVEIHeader.delete()` does not handle `Project` → `ProjProposalJour` completly
The `delete()` method clears custom fields on `ProjInvoiceJour` and `ProjProposalJour` but there is no equivalent clean-up for `InventJournalTable` in the delete path (only `AccountPayable` and `AccountReceivable` and `Project` are cased). Inventory management records are excluded from `NWVEIHeader.delete()`.

### TD-10 — Metadata validation is a warning, not an error
Required metadata fields (§R9) generate `warning()` instead of `error()`. If a required Viettel metadata field is blank, the API call will proceed and likely fail at the provider side with a cryptic error rather than a clear D365FO validation message. Consider upgrading required metadata field violations to `checkFailed()`.

### TD-11 — `CurrencyCode` fallback for inventory uses `curExt()` before VN check
```xpp
if (!this.CurrencyCode) this.CurrencyCode = curExt();
if (!this.CurrencyCode && SysCountryRegionCode::isLegalEntityInCountryRegion([#isoVN]))
    this.CurrencyCode = 'VND';
```
The `curExt()` call returns the company's default currency. If the company's default currency is already set, the VN-specific `'VND'` hardcode is never reached. The second `if` can never be true if `curExt()` returns a non-empty string. The VN hardcode is dead code in any properly configured environment.

---

*Document generated by reverse-engineering the NWVEI X++ source. All class names, table names, method signatures, and field names reflect the actual AOT objects found in the workspace. Where behavior could not be confirmed from code alone, the observation is marked "Requires further tracing."*
