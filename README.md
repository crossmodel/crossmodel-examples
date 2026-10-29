# BrightGreen — LLM Wiki Generation (Nunjucks)

This branch extends the [Use the AI Assistants](../../tree/examples/ai-assistants/use) result with **Nunjucks** templates that turn a CrossModel data model into an **LLM Wiki**: a folder of markdown pages an AI agent reads to learn what the data means.

The pattern comes from Andrej Karpathy's LLM Wiki: markdown pages with frontmatter, an `index.md` to start from, a `log.md` the agent appends to, and a schema file with rules for the agent. CrossModel already holds everything such a page needs, so the wiki is generated instead of written by hand.

## What's in this branch

The BrightGreen models plus the `Sources/WMS` model reverse engineered by the AI assistants from `Wms-files/wms-schema.sql` and `wms-doc.pdf`, and:

| Path | Purpose |
|:-----|:--------|
| `BrightGreen/Generation/Templates/llm-wiki/entity-page.njk` | One page per entity (scope: Logical Entity) |
| `BrightGreen/Generation/Templates/llm-wiki/index.njk` | `index.md` for a data model (scope: Data Model) |
| `BrightGreen/Generation/Templates/llm-wiki/schema.njk` | `schema.md`, the rules for the agent (scope: Data Model) |
| `BrightGreen/Generation/Templates/llm-wiki/links.njk` | Macro for path-qualified wiki links, imported by the templates above |
| `BrightGreen/Generation/Output/llm-wiki/` | Example wiki for the WMS model, plus an empty `log.md` |

## From model to wiki

| CrossModel | LLM Wiki |
|:-----------|:---------|
| Entity | One page, `<datamodel>/entities/<EntityId>.md` |
| Description | Definition under the page title |
| Attributes | Table with type, required, key and definition |
| Relationships | Links between pages, with cardinality and join attributes |
| Custom properties (owner, sensitivity, …) | Frontmatter |
| Mappings | Lineage section |
| Data model | `<datamodel>/index.md` and `<datamodel>/schema.md` |

Links are path-qualified (`[[WMS/entities/Warehouse|Warehouse]]`) because entity ids repeat across data models: `Warehouse` exists in WMS, OptimalERP and the DWH. Generate every data model into the same wiki root (`Generation/Output/llm-wiki/`) so the paths resolve. The wiki opens as-is as an Obsidian vault.

## How to generate

Open CrossGenerate in CrossModel (`Ctrl+Shift+P` → *CrossGenerate: Open Test View*) and choose engine **Nunjucks**. Run it three times per data model, here for `WMS`:

| What | Type | Object | Template | Output filename | Output directory |
|:-----|:-----|:-------|:---------|:----------------|:-----------------|
| Entity pages | Logical Entity | *All Logical Entities* (filtered on `WMS`) | `entity-page.njk` | `{{entity.id}}.md` | `Generation/Output/llm-wiki/WMS/entities` |
| Index | Data Model | `WMS` | `index.njk` | `index.md` | `Generation/Output/llm-wiki/WMS` |
| Agent rules | Data Model | `WMS` | `schema.njk` | `schema.md` | `Generation/Output/llm-wiki/WMS` |

`log.md` is not generated. It belongs to the agent, which appends to it; the templates never overwrite it.

> **Check before relying on it:** the entity page finds its relationships and mappings through `entity.$parent`, the owning data model. The CrossGenerate documentation guarantees `$parent` for cross-referenced entities but not for the entity you generate from. Use **Preview** on one entity: if the *Relationships* section is missing for `Warehouse`, `$parent` is not available there and only that section and *Lineage* are left out.

> The example output in `Generation/Output/llm-wiki/WMS/` was rendered from these templates outside CrossModel. Regenerate it with CrossGenerate to replace it with the real output.

## Using the wiki with an agent

Point the agent at `Generation/Output/llm-wiki/` and tell it to read `<datamodel>/schema.md` first. The schema tells it to answer from the pages, cite page and attribute, follow the listed join attributes instead of guessing keys, and record missing or unclear definitions in `log.md`, so a modeler can fix them in CrossModel and regenerate.

## Documentation

See [Examples](https://www.crossmodel.io/knowledgebase/examples/) for the other ready-made workspaces and the [Code Generation tutorial](https://help.crossmodel.io/tutorials/code-generation/) for how CrossGenerate templates work.
