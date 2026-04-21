CREATE VIEW SalesPerson AS
SELECT
    sp.SalesPersonId,
    CONCAT(sp.FirstName, ' ', sp.LastName) AS FullName,
    sp.Email,
    sp.Region
FROM crm_source.SalesPerson sp;
