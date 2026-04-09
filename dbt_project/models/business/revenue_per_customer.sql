{{
    config(
        materialized='table'
    )
}}

SELECT
    customer.CustomerId,
    customer.CompanyName,
    customer.Industry,
    salesperson.SalesPersonId,
    salesperson.FullName as SalesPersonName,
    salesperson.Region as SalesRegion,
    SUM(invoice.TotalAmount) as TotalInvoiced,
    SUM(CASE WHEN invoice.Status = 'Paid'
             THEN invoice.TotalAmount ELSE 0 END) as TotalPaid,
    SUM(CASE WHEN invoice.Status IN ('Sent', 'Overdue')
             THEN invoice.TotalAmount ELSE 0 END) as TotalOutstanding,
    COUNT(invoice.InvoiceId) as InvoiceCount,
    COUNT(CASE WHEN invoice.Status = 'Overdue' THEN invoice.InvoiceId END) as OverdueCount
FROM {{ ref('customer') }} customer
LEFT JOIN {{ ref('salesperson') }} salesperson
    ON customer.SalesPersonId = salesperson.SalesPersonId
LEFT JOIN {{ ref('invoice') }} invoice
    ON customer.CustomerId = invoice.CustomerId
GROUP BY
    customer.CustomerId,
    customer.CompanyName,
    customer.Industry,
    salesperson.SalesPersonId,
    salesperson.FullName,
    salesperson.Region
