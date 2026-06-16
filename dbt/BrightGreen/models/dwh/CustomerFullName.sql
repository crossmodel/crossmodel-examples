with CustomerFullName as (select
    CustomerID, 
    FullName
    from {{ ref('mapping_CustomerFullName') }}
)
select * from CustomerFullName