with Product as (select
    ProductID, 
    EANCode, 
    Description, 
    ItemPrice
    from {{ ref('raw_Product') }}
)
select * from Product