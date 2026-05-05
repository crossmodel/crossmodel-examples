{#-
	Generates a dbt mapping model that projects source attributes onto target attributes.
	- Wraps the select in a CTE named mapping_<target_entity_id>, which downstream
	  dwh_entity_model.sql templates reference via ref('mapping_<entity>').
-#}
with mapping_{{ mapping.target.entity.id }} as (
    select
{%- for attr in mapping.target.mappings %}
        {% if attr.expressions | length -%}
            {%- for expr in attr.expressions -%}{{ expr.expression | replace("{{","") | replace("}}","") }}{%- endfor -%}
        {%- else -%}
            {{ attr.sources[0].value.$refText -}}
        {%- endif %} AS {{ attr.attribute.value.id }}{% if not loop.last %},{% endif %}
{%- endfor %}
{%- for source in mapping.sources %}
    {{ source.join | replace("-"," ") }} {{ '{{' }} ref('{{ source.entity.id }}') {{ '}}' }} as {{ source.id }}
    {%- for condition in source.conditions %}
        {% if loop.first %}ON{% else %}AND{% endif %} {{ condition.expression.left.$refText }} {{ condition.expression.op }} {{ condition.expression.right.$refText }}
    {%- endfor %}
{%- endfor %}
) select * from mapping_{{ mapping.target.entity.id }}