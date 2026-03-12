with Debtor as (select
    DEBTORID, 
    NAME, 
    IBAN, 
    JUICEERPCUSTOMERID
    from {{ ref('raw_Debtor') }}
)
select * from Debtor