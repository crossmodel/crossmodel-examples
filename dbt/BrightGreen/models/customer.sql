with customer as (
    select
        CustomerID,
        FirstName,
        LastName,
        DateOfBirth,
        EmailAddress
    from {{ ref('raw_customer') }}
), final as(
    select *
    from customer
)
select * from final;
