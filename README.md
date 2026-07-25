# BrightGreen — Configure and use the AI Assistants (finished result)

This branch is the **finished result** of the [Configure and use the AI Assistants](https://www.crossmodel.io/knowledgebase/tutorials/configure-and-use-the-ai-assistants/) tutorial.
Clone it to see what the tutorial produces, or to compare against your own work.

> If you want to *do* the tutorial rather than read the answer, start from
> `BrightGreen` instead.

## Follow the tutorial

  **https://www.crossmodel.io/knowledgebase/tutorials/configure-and-use-the-ai-assistants/**

## Getting this workspace

In CrossModel, open the welcome page and use **Tutorials & Examples**:

    examples  →  ai-assistants  →  configure-and-use

Then press **Clone** and pick your `workspace` folder.

## What this branch adds to BrightGreen

A `Sources/WMS` data model — `Product`, `StockLevel`, `StockTransaction` and `Warehouse`
entities, their relationships and a diagram — reverse engineered by the AI assistants from
`Wms-files/wms-schema.sql` and `wms-doc.pdf`.

## The BrightGreen models

Every branch in this repository builds on **BrightGreen**, a sample workspace that demonstrates
data modeling across multiple source systems and a data warehouse layer.

| Data Model | Location | Description |
|:-----------|:---------|:------------|
| **JuiceERP** | `Sources/JuiceERP/` | ERP source system with customers, products, sales orders and order lines |
| **PreciseFinance** | `Sources/PreciseFinance/` | Finance source system with debtors, invoices and invoice lines |
| **Example DWH** | `ExampleDwh/` | Data warehouse that consolidates data from JuiceERP and PreciseFinance via mappings |

`Wms-files/` contains a WMS schema (`wms-schema.sql`) and its documentation (`wms-doc.pdf`),
used by the AI assistants tutorial for reverse engineering.

## Conventions in this repository

- `BrightGreen` — the base data model. Several tutorials start here.
- `tutorials/…` — **starting points**. Clone one to follow a tutorial.
- `examples/…` — **finished results**. Clone one to see the outcome.

See [Tutorials](https://www.crossmodel.io/knowledgebase/tutorials/) and [Examples](https://www.crossmodel.io/knowledgebase/examples/).
