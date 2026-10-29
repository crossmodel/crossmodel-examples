---
type: entity
id: Product
name: "Product"
datamodel: WMS
datamodel_name: "Warehouse Management System"
version: 1.0.0
primary_key: [Id]
source: crossmodel
---

# Product

Represents a product in the warehouse management system

## Attributes

| Attribute | Type | Required | Key | Definition |
|:----------|:-----|:--------:|:---:|:-----------|
| Id | Integer | yes | PK | Surrogate key for Product |
| Name | Text(100) | yes |  | The name of the product |
| Description | Text(255) | no |  | Description of the product |
| SKU | Text(50) | yes |  | Stock Keeping Unit - unique identifier for the product |

## Relationships

- **0..N** [[WMS/entities/StockLevel|stock levels]] per Product (Product Stock Level): Links a product to its stock levels
  - join: `Stock Level.Product Id` = `Product.Id`
- **0..N** [[WMS/entities/StockTransaction|stock transactions]] per Product (Product Stock Transaction): Links a product to its stock transactions
  - join: `Stock Transaction.Product Id` = `Product.Id`

---
_Generated from CrossModel model `WMS`. Do not edit this page by hand: change the model and regenerate._
