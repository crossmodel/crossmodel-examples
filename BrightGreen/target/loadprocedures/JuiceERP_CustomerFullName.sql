CREATE OR REPLACE PROCEDURE load_CustomerFullName()
RETURNS INTEGER
LANGUAGE SQL
AS
$$
BEGIN
    INSERT INTO dwh.CustomerFullName(
        CustomerID,
        FullName
    )
    SELECT
        CustomerID,
        FullName
    FROM src_CustomerFullName;

    RETURN 1;
END;
$$;
