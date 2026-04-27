{#-
    Generates a Snowflake stored procedure that loads data from the source mapping view
    (src_<target_entity_id>, produced by entity_mapping.sql) into the target DWH table.
    The procedure returns 1 on success.
-#}
CREATE OR REPLACE PROCEDURE load_{{ mapping.target.entity.id }}()
RETURNS INTEGER
LANGUAGE SQL
AS
$$
BEGIN
    INSERT INTO dwh.{{ mapping.target.entity.id }}(
    {%- for attr in mapping.target.mappings %}
        {{ attr.attribute.value.id }}{%- if not loop.last %},{% endif %}
    {%- endfor %}
    )
    SELECT
    {%- for attr in mapping.target.mappings %}
        {{ attr.attribute.value.id }}{%- if not loop.last %},{% endif %}
    {%- endfor %}
    FROM src_{{ mapping.target.entity.id }};

    RETURN 1;
END;
$$;
