with mapping_CustomerFullName as (
    select
        CustomerSourceObject.CustomerID AS CustomerID,
        CustomerSourceObject.FirstName || ' ' || CustomerSourceObject.LastName AS FullName
    from {{ ref('Customer') }} as CustomerSourceObject
) select * from mapping_CustomerFullName