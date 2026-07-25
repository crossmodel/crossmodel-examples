# BrightGreen — DWH View Generation (Handlebars)

This branch extends [`examples/code-generation/staging/handlebars`](../../tree/examples/code-generation/staging/handlebars) with a template that generates **data warehouse views** from CrossModel `Mapping` objects.

## What's in this branch

Everything from the staging/handlebars branch, plus:

| Path | Purpose |
|:-----|:--------|
| `BrightGreen/Generation/Templates/mapping/MappingView.handlebars` | Generates `CREATE OR REPLACE VIEW` statements from mappings (scope: `Mapping`) |

The staging template (`Templates/entity/StagingTable.handlebars`) remains available for generating staging tables from source entities.

## How to generate DWH views

1. Open CrossGenerate in CrossModel (`Ctrl+Shift+P` → *CrossGenerate: Open Test View*).
2. Select a **Mapping** (e.g. any mapping under `ExampleDwh/mappings/`), or *All Mappings*.
3. Choose engine **Handlebars**.
4. Select template `MappingView.handlebars`.
5. Set output filename pattern to `Vw_{{mapping.id}}.sql`.
6. Generate — output is a `CREATE OR REPLACE VIEW` statement that implements the mapping.

## Documentation

This example is written up in the CrossModel knowledge base, with the background and
context that does not belong in a README:

  **[Generating data warehouse views](https://www.crossmodel.io/knowledgebase/examples/generating-dwh-views/)**

See [Examples](https://www.crossmodel.io/knowledgebase/examples/) for the other ready-made workspaces.
