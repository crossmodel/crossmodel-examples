with mapping_CustomerWithOrderCount as (
    select
        CustomerID AS Customer_ID,
        COUNT(SalesOrder.SalesOrderID) AS OrderCount
    from {{ ref('Customer') }} as Customer
    left join {{ ref('SalesOrder') }} as SalesOrder
        ON Customer.CustomerID = SalesOrder.CustomerID
) select * from mapping_CustomerWithOrderCount