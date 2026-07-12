# BrightGreen — DWH View Generation (Nunjucks)

This branch extends [`examples/code-generation/staging/nunjucks`](../../tree/examples/code-generation/staging/nunjucks) with a template that generates **data warehouse views** from CrossModel `Mapping` objects.

## What's in this branch

Everything from the staging/nunjucks branch, plus:

| Path | Purpose |
|:-----|:--------|
| `BrightGreen/Generation/Templates/mapping/MappingView.njk` | Generates `CREATE OR REPLACE VIEW` statements from mappings (scope: `Mapping`) |

The staging templates (`Templates/entity/StagingTable.njk`, `entity/attributes/SqlColumnDefinition.njk`) remain available for generating staging tables from source entities.

## How to generate DWH views

1. Open CrossGenerate in CrossModel (`Ctrl+Shift+P` → *CrossGenerate: Open Test View*).
2. Select a **Mapping** (e.g. any mapping under `ExampleDwh/mappings/`), or *All Mappings*.
3. Choose engine **Nunjucks**.
4. Select template `MappingView.njk`.
5. Set output filename pattern to `Vw_{{mapping.id}}.sql`.
6. Generate — output is a `CREATE OR REPLACE VIEW` statement that implements the mapping.
