CREATE OR REPLACE PROCEDURE load_CustomerWithOrderCount()
RETURNS INTEGER
LANGUAGE SQL
AS
$$
BEGIN
    INSERT INTO dwh.CustomerWithOrderCount(
        Customer_ID,
        OrderCount
    )
    SELECT
        Customer_ID,
        OrderCount
    FROM src_CustomerWithOrderCount;

    RETURN 1;
END;
$$;
