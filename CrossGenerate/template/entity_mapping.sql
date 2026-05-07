{#-
    Generates a Snowflake CREATE VIEW that projects source attributes onto target attributes.
    - The view is named src_<target_entity_id> and is referenced by the load procedure template.
-#}
USE DATABASE CrossModel;
USE SCHEMA dwh;

CREATE OR REPLACE VIEW src_{{ mapping.target.entity.id }} AS (
    SELECT
    {#- Loop through each mapped attribute, aliased to the target attribute's ID. #}
    {%- for attr in mapping.target.mappings %}
        {#- if custom expressions are defined, emit the expressions in order #}
        {%- if attr.expressions | length %}
            {% for expr in attr.expressions -%} {{ expr.expression | replace("{{","") | replace("}}","") }} {%- endfor %} AS {{ attr.attribute.value.id }}
        {#- otherwise falls back to the first source attribute (there should only be one attribute in that case) #}
        {%- else %}
            {{ attr.sources[0].value.$refText }} AS {{ attr.attribute.value.id }}
        {%- endif %}
        {%- if not loop.last %},{% endif %}
    {%- endfor %}
    {#- Build the FROM clause from the source whose join is 'from' (aliased by source.id). #}
    {%- for source in mapping.sources %}
        {{ source.join | replace("-"," ") | upper }} SourceVault.{{ source.entity.id }} AS {{ source.id }}
        {%- for condition in source.conditions %}
            {% if loop.first %}ON{% else %}AND{% endif %} {{ condition.expression.left.$refText }} {{ condition.expression.op }} {{ condition.expression.right.$refText }}
        {%- endfor %}
    {%- endfor %}
);