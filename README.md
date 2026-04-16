# BrightGreen — Documentation Generation (Nunjucks)

This branch extends the [BrightGreen](../../tree/BrightGreen) example with **Nunjucks** templates that generate markdown documentation from a CrossModel `DataModel`.

## What's in this branch

The BrightGreen models (JuiceERP, PreciseFinance, Example DWH) plus:

| Path | Purpose |
|:-----|:--------|
| `BrightGreen/Generation/Templates/datamodel/DataModelDocumentation.njk` | Main template (scope: `DataModel`) |
| `BrightGreen/Generation/Templates/datamodel/menu.njk` | Include — table-of-contents sidebar |
| `BrightGreen/Generation/Templates/datamodel/entity.njk` | Include — single entity block |
| `BrightGreen/Generation/Templates/datamodel/relationship.njk` | Include — single relationship block |
| `BrightGreen/Generation/Templates/datamodel/mapping.njk` | Include — single mapping block |
| `BrightGreen/Generation/Output/Documentation/` | Example generated markdown for each data model |

Includes are resolved by Nunjucks relative to the main template's directory.

## How to generate

1. Open CrossGenerate in CrossModel (`Ctrl+Shift+P` → *CrossGenerate: Open Test View*).
2. Select a **DataModel** (e.g. `JuiceERP`, `PreciseFinance`, or `example-dwh`), or *All Data Models*.
3. Choose engine **Nunjucks**.
4. Select main template `DataModelDocumentation.njk`.
5. Set output filename pattern to `{{datamodel.id}}.md`.
6. Set output directory, e.g. `Generation/Output/Documentation`.
7. Generate — the resulting markdown includes a table of contents and sections for entities, relationships and mappings.
