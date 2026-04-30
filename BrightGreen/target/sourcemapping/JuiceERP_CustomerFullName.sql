CREATE OR REPLACE VIEW src_CustomerFullName AS (
    SELECT
            CustomerID AS CustomerID,
            CONCAT_WS(' ', CustomerSourceObject.FirstName, CustomerSourceObject.LastName) AS FullName
    FROM SourceVault.Customer AS CustomerSourceObject
);
