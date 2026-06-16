with SalesOrder as (select
    SalesOrderID, 
    OrderDate, 
    CustomerID, 
    OrderStatus
    from {{ ref('raw_SalesOrder') }}
)
select * from SalesOrder