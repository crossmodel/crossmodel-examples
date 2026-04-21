CREATE VIEW CustomerRevenue AS
SELECT
    i.CustomerId,
    i.SalesPersonId,
    SUM(CASE WHEN i.Status IN ('Paid', 'Sent', 'Overdue') THEN i.TotalAmount ELSE 0 END) AS TotalRevenue
FROM Invoice i
INNER JOIN Customer c
    ON c.CustomerId = i.CustomerId
INNER JOIN SalesPerson sp
    ON sp.SalesPersonId = i.SalesPersonId
GROUP BY i.CustomerId, i.SalesPersonId;