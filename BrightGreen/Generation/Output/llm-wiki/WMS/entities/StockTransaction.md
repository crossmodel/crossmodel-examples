---
type: entity
id: StockTransaction
name: "Stock Transaction"
datamodel: WMS
datamodel_name: "Warehouse Management System"
version: 1.0.0
primary_key: [Id]
source: crossmodel
---

# Stock Transaction

Represents stock movements (sales, purchases, etc.)

## Attributes

| Attribute | Type | Required | Key | Definition |
|:----------|:-----|:--------:|:---:|:-----------|
| Id | Integer | yes | PK | Surrogate key for Stock Transaction |
| Product Id | Integer | yes |  | Foreign key to Product |
| Warehouse Id | Integer | yes |  | Foreign key to Warehouse |
| Quantity | Integer | yes |  | Quantity moved in this transaction |
| Type | Text(1) | yes |  | Type of transaction (S=Sale, P=Purchase) |
| Reference Id | Integer | yes |  | Reference to sales or purchase shipment |
| Date | DateTime | yes |  | Date when transaction occurred |

## Relationships

- **1..1** [[WMS/entities/Product|product]] per Stock Transaction (Product Stock Transaction): Links a product to its stock transactions
  - join: `Stock Transaction.Product Id` = `Product.Id`
- **1..1** [[WMS/entities/Warehouse|warehouse]] per Stock Transaction (Warehouse Stock Transaction): Links a warehouse to its stock transactions
  - join: `Stock Transaction.Warehouse Id` = `Warehouse.Id`

---
_Generated from CrossModel model `WMS`. Do not edit this page by hand: change the model and regenerate._
