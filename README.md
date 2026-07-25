# BrightGreen — Staging Table Generation (Handlebars)

This branch extends the [BrightGreen](../../tree/BrightGreen) example with a **Handlebars**
template that generates staging table DDL from CrossModel `Entity` objects.

It is the smallest of the code generation examples: one scope, one template, and output
short enough to read at a glance.

Written up in the knowledge base:
[Generating staging tables](https://www.crossmodel.io/knowledgebase/examples/generating-staging-tables/).

## What's in this branch

The BrightGreen models (JuiceERP, PreciseFinance, Example DWH) plus:

| Path | Purpose |
|:-----|:--------|
| `BrightGreen/Generation/Templates/entity/StagingTable.handlebars` | Main template (scope: `Entity`) |

## How to generate

1. Open CrossGenerate in CrossModel (**View → CrossGenerate**, or `Ctrl+Shift+P` →
   *CrossGenerate: Open Test View*).
2. Select an **Entity** — for example `Customer` under `Sources/JuiceERP/` — or *All Entities*.
3. Choose engine **Handlebars**.
4. Select template `StagingTable.handlebars`.
5. Set the output filename pattern to `Stg_{{entity.id}}.sql`.
6. Generate — the output is a `CREATE TABLE` statement with one column per attribute.

## Related

- `examples/code-generation/dwh/handlebars` builds on this branch and adds mapping-driven views
- [Examples](https://www.crossmodel.io/knowledgebase/examples/) in the knowledge base
