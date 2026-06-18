CREATE OR ALTER PROCEDURE dwh.load_{{ mapping.target.entity.id }}
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO dwh.{{ mapping.target.entity.id }}(
    {%- for attr in mapping.target.mappings %}
        {{ attr.attribute.value.id }}{%- if not loop.last %},{% endif %}
    {%- endfor %}
    )
    SELECT
    {%- for attr in mapping.target.mappings %}
        {{ attr.attribute.value.id }}{%- if not loop.last %},{% endif %}
    {%- endfor %}
    FROM dwh.src_{{ mapping.target.entity.id }};
END
GO