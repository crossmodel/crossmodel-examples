with SalesOrderLine as (select
    SalesOrderID, 
    ProductID, 
    ItemPrice, 
    Quantity, 
    LineAmt
    from {{ ref('raw_SalesOrderLine') }}
)
select * from SalesOrderLine