{#- Generates a Snowflake CREATE TABLE for a DWH entity in the dwh schema. -#}
USE SCHEMA dwh;

CREATE TABLE {{ entity.id }} (
{%- for attr in entity.attributes %}
    {{ attr.id }} {% if attr.datatype == 'Integer' %}INTEGER{% elif attr.datatype == 'Date' %}DATE{% elif attr.datatype == 'Boolean' %}BOOLEAN{% elif attr.datatype == 'Decimal' %}DECIMAL{% else %}STRING{% endif %}{%- if not loop.last or entity.identifiers | length > 0 %},{% endif %}
{%- endfor %}
{%- for identifier in entity.identifiers %}
{%- if identifier.primary %}
    CONSTRAINT pk_{{ entity.id }} PRIMARY KEY ({% for attrId in identifier.attributes %}{{ attrId }}{% if not loop.last %}, {% endif %}{% endfor %})
{%- endif %}
{%- endfor %}
);
