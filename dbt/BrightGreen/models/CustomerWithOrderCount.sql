with CustomerWithOrderCount as (select
    Customer_ID, 
    OrderCount
    from {{ ref('raw_CustomerWithOrderCount') }}
)
select * from CustomerWithOrderCount