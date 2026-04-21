CREATE VIEW Invoice AS
SELECT
    i.InvoiceId,
    so.CustomerNumber  AS CustomerId,
    o.SalesPersonId,
    i.InvoiceDate,
    i.DueDate,
    i.TotalAmount,
    so.Currency,
    i.Status
FROM erp_source.Invoice i
INNER JOIN erp_source.SalesOrder so
    ON i.SalesOrderId = so.SalesOrderId
LEFT JOIN crm_source.Opportunity o
    ON so.CustomerNumber = o.CustomerId;
