# Wiki schema: Warehouse Management System

This folder describes the meaning of the data in **Warehouse Management System** (`WMS`, version 1.0.0). It is generated from a CrossModel data model whose definitions are reviewed by domain experts.

## Layout

The wiki root holds one folder per data model. In this folder:

- `index.md`: start here. Lists every entity with a one-line definition and the relationships between them.
- `entities/<EntityId>.md`: one page per entity.
- `schema.md`: this file.

The wiki root also holds `log.md`: a chronological log of questions answered and gaps found. Append only.

## Entity pages

- **Frontmatter**: `id`, `name`, `datamodel`, `version`, `primary_key` and any custom properties (for example owner or sensitivity). Use these to filter pages.
- **Definition**: the paragraph under the title is the agreed business definition.
- **Attributes**: the table gives each attribute's type, whether it is required, whether it is part of the primary key, and its definition.
- **Relationships**: links to related pages, with cardinality and the join attributes.
- **Lineage**: where the entity is loaded from, if it is the target of a mapping.

Links are path-qualified, `[[<datamodel>/entities/<EntityId>|label]]`, because the same entity name can exist in several data models.

## Rules for the agent

1. Answer from these pages. Cite the page and attribute you used, for example `WMS/entities/<EntityId>` › `<Attribute>`.
2. Follow relationship links to find join paths. Use the listed join attributes; do not guess keys.
3. If a definition is missing or marked `_undefined_`, say so. Do not invent a meaning.
4. Do not edit generated pages (`index.md`, `schema.md`, `entities/`). They are overwritten when the model is regenerated. Record gaps, contradictions and open questions in `log.md` instead, so a modeler can fix them in CrossModel.
5. Log entries start with `## [YYYY-MM-DD] <type> | <subject>`, where type is `query`, `gap` or `lint`.
