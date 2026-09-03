CREATE TABLE SourceVault.{{ entity.id }} (
{%- for attr in entity.attributes %}
    {{ attr.id }}
    {%- if attr.datatype == 'Integer' %} INT
    {%- elif attr.datatype == 'Date' %} DATE
    {%- elif attr.datatype == 'Boolean' %} BIT
    {%- elif attr.datatype == 'Decimal' %} DECIMAL({{ attr.precision }}, {{ attr.scale }})
    {%- elif attr.datatype == 'Text' %}
        {%- if attr.length %} VARCHAR({{ attr.length }})
        {%- else %} VARCHAR(MAX)
        {%- endif %}
    {%- else %} VARCHAR(MAX)
    {%- endif %}
    {%- if attr.mandatory %} NOT NULL{% endif -%}
    {%- if not loop.last or entity.identifiers | length > 0 %},{% endif -%}
{%- endfor %}
{%- for identifier in entity.identifiers %}
    {%- if identifier.primary %}
        CONSTRAINT pk_{{ entity.id }} PRIMARY KEY ({% for attr in identifier.attributes %}{{ attr.id }}{% if not loop.last %}, {% endif %}{% endfor %})
    {%- endif %}
{%- endfor %}
);
GO