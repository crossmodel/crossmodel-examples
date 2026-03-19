with mapping_{{ mapping.target.entity.id }} as (select
    {% for attr in mapping.target.mappings %}
		{%- if attr.expressions | length %}
			{% for expr in attr.expressions %} {{ expr.expression }} {% endfor %}
		{%- else -%}
			{{attr.sources[0].value.id}} 
		{% endif -%} 
		AS {{ attr.attribute.value.id }}
		{%- if not loop.last -%},{%- endif %}
	{%- endfor -%}
	{% for source in mapping.sources %}
        {%- if source.join == 'from' %} 
			from {% raw %}{{{% endraw %} ref('{{source.entity.id }}')}} as {{source.id}} 
		{%- endif -%}
	{%- endfor -%}
) select * from mapping_{{ mapping.target.entity.id }}