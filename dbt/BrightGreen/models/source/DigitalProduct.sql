with DigitalProduct as (select
    ProductID, 
    EANCode, 
    Description, 
    ItemPrice, 
    ActivationURL, 
    ExpirationPeriodInDays
    from {{ ref('raw_DigitalProduct') }}
)
select * from DigitalProduct