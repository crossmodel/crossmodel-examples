# BrightGreen — Documentation Generation (Handlebars)

This branch extends the [BrightGreen](../../tree/BrightGreen) example with **Handlebars** templates that generate markdown documentation from a CrossModel `DataModel`.

## What's in this branch

The BrightGreen models (JuiceERP, PreciseFinance, Example DWH) plus:

| Path | Purpose |
|:-----|:--------|
| `BrightGreen/Generation/Templates/datamodel/DataModelDocumentation.handlebars` | Main template (scope: `DataModel`) |
| `BrightGreen/Generation/Templates/datamodel/menu.handlebars` | Partial — table-of-contents sidebar |
| `BrightGreen/Generation/Templates/datamodel/entity.handlebars` | Partial — single entity block |
| `BrightGreen/Generation/Templates/datamodel/relationship.handlebars` | Partial — single relationship block |
| `BrightGreen/Generation/Templates/datamodel/mapping.handlebars` | Partial — single mapping block |
| `BrightGreen/Generation/Output/Documentation/` | Example generated markdown for each data model |

Partials are auto-registered by Handlebars from the same directory as the main template.

## How to generate

1. Open CrossGenerate in CrossModel (`Ctrl+Shift+P` → *CrossGenerate: Open Test View*).
2. Select a **DataModel** (e.g. `JuiceERP`, `PreciseFinance`, or `example-dwh`), or *All Data Models*.
3. Choose engine **Handlebars**.
4. Select main template `DataModelDocumentation.handlebars`.
5. Set output filename pattern to `{{datamodel.id}}.md`.
6. Set output directory, e.g. `Generation/Output/Documentation`.
7. Generate — the resulting markdown includes a table of contents and sections for entities, relationships and mappings.
