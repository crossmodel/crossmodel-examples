CREATE VIEW Customer AS
SELECT
    c.CustomerId,
    c.CompanyName,
    c.ContactName,
    c.Email,
    c.Industry,
    o.SalesPersonId
FROM crm_source.Customer c
LEFT JOIN crm_source.Opportunity o
    ON c.CustomerId = o.CustomerId;
