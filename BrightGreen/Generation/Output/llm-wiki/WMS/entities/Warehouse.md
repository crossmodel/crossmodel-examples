---
type: entity
id: Warehouse
name: "Warehouse"
datamodel: WMS
datamodel_name: "Warehouse Management System"
version: 1.0.0
primary_key: [Id]
source: crossmodel
---

# Warehouse

Represents a warehouse location

## Attributes

| Attribute | Type | Required | Key | Definition |
|:----------|:-----|:--------:|:---:|:-----------|
| Id | Integer | yes | PK | Surrogate key for Warehouse |
| Name | Text(100) | yes |  | The name of the warehouse |
| Location | Text(100) | no |  | Physical location of the warehouse |

## Relationships

- **0..N** [[WMS/entities/StockLevel|stock levels]] per Warehouse (Warehouse Stock Level): Links a warehouse to its stock levels
  - join: `Stock Level.Warehouse Id` = `Warehouse.Id`
- **0..N** [[WMS/entities/StockTransaction|stock transactions]] per Warehouse (Warehouse Stock Transaction): Links a warehouse to its stock transactions
  - join: `Stock Transaction.Warehouse Id` = `Warehouse.Id`

---
_Generated from CrossModel model `WMS`. Do not edit this page by hand: change the model and regenerate._
