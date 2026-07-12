# BrightGreen Example

BrightGreen is a sample CrossModel workspace that demonstrates data modeling across multiple source systems and a data warehouse layer.

## Models

| Data Model | Location | Description |
|:-----------|:---------|:------------|
| **JuiceERP** | `Sources/JuiceERP/` | ERP source system with customers, products, sales orders and order lines |
| **PreciseFinance** | `Sources/PreciseFinance/` | Finance source system with debtors, invoices and invoice lines |
| **Example DWH** | `ExampleDwh/` | Data warehouse that consolidates data from JuiceERP and PreciseFinance via mappings |

### JuiceERP (`Sources/JuiceERP/`)

- **Entities:** `Customer`, `Product`, `DigitalProduct`, `PhysicalProduct`, `SalesOrder`, `SalesOrderLine`
- **Relationships:** `Customer_SalesOrder`, `SalesOrder_SalesOrderLine`, `Product_SalesOrderLine`
- **Diagrams:** `JuiceERP.diagram.cm`, `main.diagram.cm`

### PreciseFinance (`Sources/PreciseFinance/`)

- **Entities:** `Debtor`, `Invoice`, `InvoiceLine`
- **Relationships:** `FK_INVOICE_INVOICE_D_DEBTOR`, `FK_INVOICEL_INVOICELI_INVOICE`
- **Diagrams:** `PreciseFinance.diagram.cm`

### Example DWH (`ExampleDwh/`)

Depends on `JuiceERP` and `PreciseFinance`.

- **Entities:** `CustomerWithOrderCount`, `OrderWithCustomerData`
- **Mappings:** `JuiceERP_CustomerWithOrderCount`, `OrderWithCustomerDataMapping`
- **Diagrams:** `ExampleDwh.diagram.cm`

## Supporting Files

- `Wms-files/` contains a WMS schema (`wms-schema.sql`) and accompanying documentation (`wms-doc.pdf`) used for reverse-engineering exercises.
