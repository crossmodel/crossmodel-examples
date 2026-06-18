CREATE OR ALTER VIEW dwh.src_OrderWithCustomerData AS (
    SELECT
            SalesOrder.SalesOrderID AS SalesOrderID,
            SalesOrder.OrderDate AS Orderdate,
            CONCAT_WS(' ', Customer.FirstName, Customer.LastName) AS CustomerName
        FROM SourceVault.SalesOrder AS SalesOrder
        LEFT JOIN SourceVault.Customer AS Customer
            ON Customer.CustomerID = SalesOrder.CustomerID
);
GO