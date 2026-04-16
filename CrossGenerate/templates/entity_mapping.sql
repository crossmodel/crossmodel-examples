{#-
	Generates a dbt mapping model that projects source attributes onto target attributes.
	- Wraps the select in a CTE named mapping_<target_entity_id>, which downstream
	  dwh_entity_model.sql templates reference via ref('mapping_<entity>').
	Whitespace control ({%- / -%} and {{- / -}}) is deliberate: it keeps the template, as well
	as the rendered SQL readable while avoiding stray blank lines between mappings and the FROM clause.
-#}
with mapping_{{ mapping.target.entity.id }} as (
	select
	{#- Loop through each mapped attribute, aliased to the target attribute's ID. -#}
    {%- for attr in mapping.target.mappings %}
		{#- if custom expressions are defined, emit the expressions in order -#}
		{% if attr.expressions | length -%}
			{% for expr in attr.expressions -%} {{ expr.expression }} {% endfor %}
		{#- otherwise falls back to the first source attribute (there should only be one attribute in that case) -#}
		{%- else %}
			{{- attr.sources[0].value.id }} 
		{%- endif %} AS {{ attr.attribute.value.id }}
		{%- if not loop.last %},{% endif %}
	{%- endfor %}
	{#- Build the FROM clause from the source whose join is 'from' (aliased by source.id). -#}
	{#- Escape the double curly brackets that are required by dbt. -#}
	{% for source in mapping.sources -%}
        {% if source.join == 'from' -%} 
			from {% raw %}{{{% endraw %} ref('{{source.entity.id }}')}} as {{source.id}} 
		{%- endif %}
	{%- endfor %}
) select * from mapping_{{ mapping.target.entity.id }}