{#- Generates a Snowflake CREATE TABLE for a source entity in the SourceVault schema. -#}
USE DATABASE CrossModel;
USE SCHEMA SourceVault;

CREATE TABLE {{ entity.id }} (
{%- for attr in entity.attributes %}
    {{ attr.id }} 
    {%- if attr.datatype == 'Integer' %} INT{% elif attr.datatype == 'Date' %} DATE{% elif attr.datatype == 'Boolean' %} BOOLEAN{% elif attr.datatype == 'Decimal' %} DECIMAL{% else %} VARCHAR{% endif %}
    {%- if attr.mandatory %} NOT NULL{% endif -%}
    {%- if not loop.last or entity.identifiers | length > 0 %},{% endif -%}{%- endfor %}
{%- for identifier in entity.identifiers %}
    {%- if identifier.primary %}
        CONSTRAINT pk_{{ entity.id }} PRIMARY KEY ({% for attr in identifier.attributes %}{{ attr.id }}{% if not loop.last %}, {% endif %}{% endfor %})
    {%- endif %}
{%- endfor %}
);
