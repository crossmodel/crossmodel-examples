with mapping_CustomerFullName as (select
    CustomerID 
		AS CustomerID,
			 CONCAT(CONCAT(CustomerSourceObject.FirstName, ' '), CustomerSourceObject.LastName) AS FullName 
			from {{ ref('Customer')}} as CustomerSourceObject) select * from mapping_CustomerFullName