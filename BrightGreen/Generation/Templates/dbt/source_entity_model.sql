{#- Generates a dbt staging model for a source entity. Selects every attribute from the raw seed table (raw_<entity>) and wraps it in a CTE named after the entity. -#}
with {{ entity.name}} as (select
    {% for attr in entity.attributes -%}
        {{ attr.id }} {%- if not loop.last %}, {% endif %}
    {% endfor -%}
from {% raw %}{{{% endraw %} ref('raw_{{entity.name}}') }}
)
select * from {{ entity.name }}