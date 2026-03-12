with Invoice as (select
    INVOICENO, 
    DEBTORID, 
    INVOICEDATE, 
    INVOICESTATUS, 
    JUICEERPSALESORDERID
    from {{ ref('raw_Invoice') }}
)
select * from Invoice