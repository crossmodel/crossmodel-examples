CREATE OR ALTER PROCEDURE dwh.load_OrderWithCustomerData
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO dwh.OrderWithCustomerData(
        SalesOrderID,
        Orderdate,
        CustomerName
    )
    SELECT
        SalesOrderID,
        Orderdate,
        CustomerName
    FROM dwh.src_OrderWithCustomerData;
END
GO