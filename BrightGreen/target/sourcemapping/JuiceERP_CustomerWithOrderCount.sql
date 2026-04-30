CREATE OR REPLACE VIEW src_CustomerWithOrderCount AS (
    SELECT
            CustomerID AS Customer_ID,
            COUNT({{SalesOrder.SalesOrderID}}) AS OrderCount
    FROM SourceVault.Customer AS Customer
    LEFT JOIN SourceVault.SalesOrder AS SalesOrder
    ON [object Object]
);
