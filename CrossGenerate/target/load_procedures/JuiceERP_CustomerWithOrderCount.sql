CREATE OR ALTER PROCEDURE dwh.load_CustomerWithOrderCount
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO dwh.CustomerWithOrderCount(
        Customer_ID,
        OrderCount
    )
    SELECT
        Customer_ID,
        OrderCount
    FROM dwh.src_CustomerWithOrderCount;
END
GO