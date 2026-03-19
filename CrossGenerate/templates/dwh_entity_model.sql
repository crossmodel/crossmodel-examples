with {{ entity.name}} as (select
    {% for attr in entity.attributes -%}
        {{ attr.id }} {%- if not loop.last %}, {% endif %}
    {% endfor -%}
from {% raw %}{{{% endraw %} ref('mapping_{{entity.name}}') }}
)
select * from {{ entity.name }}