{#- Generates a dbt data-warehouse model for a target entity. 
Selects every attribute from the corresponding mapping CTE (mapping_<entity>, produced by entity_mapping.sql) and wraps it in a CTE named after the entity. -#}
with {{ entity.name}} as (select
    {% for attr in entity.attributes -%}
        {{ attr.id }} {%- if not loop.last %}, {% endif %}
    {% endfor -%}
from {% raw %}{{{% endraw %} ref('mapping_{{entity.name}}') }}
)
select * from {{ entity.name }}