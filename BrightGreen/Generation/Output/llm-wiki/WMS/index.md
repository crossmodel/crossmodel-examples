---
type: index
datamodel: WMS
name: "Warehouse Management System"
version: 1.0.0
owner: "wms-team"
entities: 4
relationships: 4
source: crossmodel
---

# Warehouse Management System

Logical data model for Warehouse Management System

Read `schema.md` first for how to use this wiki. Each entity has its own page under `entities/`.

## Entities

- [[WMS/entities/Product|Product]]: Represents a product in the warehouse management system
- [[WMS/entities/StockLevel|Stock Level]]: Represents current stock levels for products in warehouses
- [[WMS/entities/StockTransaction|Stock Transaction]]: Represents stock movements (sales, purchases, etc.)
- [[WMS/entities/Warehouse|Warehouse]]: Represents a warehouse location

## Relationships

| From | Cardinality | To | Relationship |
|:-----|:-----------:|:---|:-------------|
| [[WMS/entities/Product\|Product]] | 1..1 : 0..N | [[WMS/entities/StockLevel\|Stock Level]] | Product Stock Level |
| [[WMS/entities/Product\|Product]] | 1..1 : 0..N | [[WMS/entities/StockTransaction\|Stock Transaction]] | Product Stock Transaction |
| [[WMS/entities/Warehouse\|Warehouse]] | 1..1 : 0..N | [[WMS/entities/StockLevel\|Stock Level]] | Warehouse Stock Level |
| [[WMS/entities/Warehouse\|Warehouse]] | 1..1 : 0..N | [[WMS/entities/StockTransaction\|Stock Transaction]] | Warehouse Stock Transaction |

---
_Generated from CrossModel model `WMS`. Do not edit this page by hand: change the model and regenerate._
