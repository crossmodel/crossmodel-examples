---
type: entity
id: StockLevel
name: "Stock Level"
datamodel: WMS
datamodel_name: "Warehouse Management System"
version: 1.0.0
primary_key: [Id]
source: crossmodel
---

# Stock Level

Represents current stock levels for products in warehouses

## Attributes

| Attribute | Type | Required | Key | Definition |
|:----------|:-----|:--------:|:---:|:-----------|
| Id | Integer | yes | PK | Surrogate key for Stock Level |
| Product Id | Integer | yes |  | Foreign key to Product |
| Warehouse Id | Integer | yes |  | Foreign key to Warehouse |
| Quantity | Integer | yes |  | Current quantity in stock |
| Date | DateTime | yes |  | Date when stock level was recorded |

## Relationships

- **1..1** [[WMS/entities/Product|product]] per Stock Level (Product Stock Level): Links a product to its stock levels
  - join: `Stock Level.Product Id` = `Product.Id`
- **1..1** [[WMS/entities/Warehouse|warehouse]] per Stock Level (Warehouse Stock Level): Links a warehouse to its stock levels
  - join: `Stock Level.Warehouse Id` = `Warehouse.Id`

---
_Generated from CrossModel model `WMS`. Do not edit this page by hand: change the model and regenerate._
