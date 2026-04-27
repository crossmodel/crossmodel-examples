{#-
    Generates a Snowflake CREATE VIEW that projects source attributes onto target attributes.
    - The view is named src_<target_entity_id> and is referenced by the load procedure template.
    - Whitespace control ({%- / -%} and {{- / -}}) keeps the rendered SQL readable.
-#}
CREATE OR REPLACE VIEW src_{{ mapping.target.entity.id }} AS (
    SELECT
    {%- for attr in mapping.target.mappings %}
        {%- if attr.expressions | length %}
            {%- for expr in attr.expressions -%} {{ expr.expression }} {%- endfor %} AS {{ attr.attribute.value.id }}
        {%- else %}
            {{ attr.sources[0].value.id }} AS {{ attr.attribute.value.id }}
        {%- endif %}
        {%- if not loop.last %},{% endif %}
    {%- endfor %}
    {%- for source in mapping.sources %}
        {%- if source.join == 'from' %}
    FROM SourceVault.{{ source.entity.id }} AS {{ source.id }}
        {%- elif source.join == 'left-join' %}
    LEFT JOIN SourceVault.{{ source.entity.id }} AS {{ source.id }}
            {%- if source.conditions | length %}
    ON {{ source.conditions | join(' AND ') }}
            {%- endif %}
        {%- elif source.join == 'inner-join' %}
    INNER JOIN SourceVault.{{ source.entity.id }} AS {{ source.id }}
            {%- if source.conditions | length %}
    ON {{ source.conditions | join(' AND ') }}
            {%- endif %}
        {%- endif %}
    {%- endfor %}
);
