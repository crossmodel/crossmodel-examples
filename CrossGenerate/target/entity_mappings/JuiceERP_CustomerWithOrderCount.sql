CREATE OR ALTER VIEW dwh.src_CustomerWithOrderCount AS (
    SELECT
            Customer.CustomerID AS Customer_ID,
            COUNT(SalesOrder.SalesOrderID) AS OrderCount
        FROM SourceVault.Customer AS Customer
        LEFT JOIN SourceVault.SalesOrder AS SalesOrder
            ON Customer.CustomerID = SalesOrder.CustomerID
);
GO