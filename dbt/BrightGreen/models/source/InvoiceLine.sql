with InvoiceLine as (select
    INVOICENO, 
    INVOICELINENO, 
    LINEDESCRIPTION, 
    PRICE, 
    VAT, 
    QUANTITY
    from {{ ref('raw_InvoiceLine') }}
)
select * from InvoiceLine