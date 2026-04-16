
# PreciseFinance


> Source system model for PreciseFinance, containing debtor, invoice, and invoice line data



| | |
|:--|:--|
| **ID** | `PreciseFinance` |
| **Type** | `logical` |
| **Version** | `1.0.0` |




---


## Table of Contents



**Entities**


- [`Debtor`](#DEBTOR)


- [`Invoice`](#INVOICE)


- [`InvoiceLine`](#INVOICELINE)





**Relationships**


- [`FK_INVOICEL_INVOICELI_INVOICE`](#FK_INVOICEL_INVOICELI_INVOICE) — Invoice → InvoiceLine


- [`FK_INVOICE_INVOICE_D_DEBTOR`](#FK_INVOICE_INVOICE_D_DEBTOR) — Debtor → Invoice





---



# Entities



<h2 id="DEBTOR">Debtor</h2>


> Represents a debtor (customer who owes payment) in the PreciseFinance system



| | Attribute | Datatype | PK | Mandatory | Description |
|--:|:----------|:---------|:--:|:---------:|:------------|
| 0 | **DebtorId** | `Integer` | 🔑 |  | *Unique identifier for the debtor* |
| 1 | Name | `Text` |  |  | *Full name of the debtor* |
| 2 | IBAN | `Text` |  |  | *International Bank Account Number of the debtor* |
| 3 | JuiceERP_CustomerID | `Integer` |  |  | *Cross-reference to the corresponding customer in JuiceERP* |


> 🔑 **Primary Key** — **DebtorId**


---





<h2 id="INVOICE">Invoice</h2>


> Represents an invoice issued to a debtor in the PreciseFinance system



| | Attribute | Datatype | PK | Mandatory | Description |
|--:|:----------|:---------|:--:|:---------:|:------------|
| 0 | **InvoiceNo** | `Integer` | 🔑 |  | *Unique invoice number* |
| 1 | DebtorID | `Integer` |  |  | *Reference to the debtor this invoice is issued to* |
| 2 | InvoiceDate | `Date` |  |  | *Date when the invoice was issued* |
| 3 | InvoiceStatus | `Text` |  |  | *Current status of the invoice* |
| 4 | JuiceERP_SalesOrderID | `Integer` |  |  | *Cross-reference to the corresponding sales order in JuiceERP* |


> 🔑 **Primary Key** — **InvoiceNo**


---





<h2 id="INVOICELINE">InvoiceLine</h2>


> Represents an individual line item on an invoice



| | Attribute | Datatype | PK | Mandatory | Description |
|--:|:----------|:---------|:--:|:---------:|:------------|
| 0 | **InvoiceNo** | `Integer` | 🔑 |  | *Reference to the parent invoice* |
| 1 | **InvoiceLineNo** | `Integer` | 🔑 |  | *Sequential line number within the invoice* |
| 2 | LineDescription | `Text` |  |  | *Description of the goods or services on this invoice line* |
| 3 | Price | `Decimal` |  |  | *Unit price for this invoice line item* |
| 4 | VAT | `Decimal` |  |  | *Value Added Tax amount for this invoice line* |
| 5 | Quantity | `Integer` |  |  | *Number of units billed on this invoice line* |


> 🔑 **Primary Key** — **InvoiceNo**, **InvoiceLineNo**


---






# Relationships



<h2 id="FK_INVOICEL_INVOICELI_INVOICE">FK_INVOICEL_INVOICELI_INVOICE</h2>


> Links an invoice to its individual invoice line items


| Role | Entity | Cardinality |
|:-----|:-------|:-----------:|
| **Parent** | [Invoice](#INVOICE) | `0..1` |
| **Child** | [InvoiceLine](#INVOICELINE) | `0..N` |

| Parent | | Child |
|:-------|:-:|:------|
| `InvoiceNo` | ↔ | `InvoiceNo` |

---





<h2 id="FK_INVOICE_INVOICE_D_DEBTOR">FK_INVOICE_INVOICE_D_DEBTOR</h2>


> Links a debtor to the invoices issued to them


| Role | Entity | Cardinality |
|:-----|:-------|:-----------:|
| **Parent** | [Debtor](#DEBTOR) | `0..1` |
| **Child** | [Invoice](#INVOICE) | `0..N` |

| Parent | | Child |
|:-------|:-:|:------|
| `DebtorId` | ↔ | `DebtorID` |

---






---

> *Documentation generated from data model `PreciseFinance` — version 1.0.0*
