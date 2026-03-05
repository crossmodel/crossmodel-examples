with Customer as (select
    CustomerID, 
    FirstName, 
    LastName, 
    DateOfBirth, 
    EmailAddress
    from {{ ref('raw_Customer') }}
)
select * from Customer