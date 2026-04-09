{{
    config(
        materialized='table'
    )
}}

/*
  SalesPerson
  -----------
  A sales representative responsible for managing customer accounts and driving revenue.

  Sources:
    - crm_source.SalesPerson (primary)

  FullName is derived by concatenating FirstName and LastName.
*/

with crm_salesperson as (

    select
        SalesPersonId,
        FirstName,
        LastName,
        Email,
        Region
    from {{ source('crm_source', 'SalesPerson') }}

)

select
    SalesPersonId,
    CONCAT(FirstName, ' ', LastName) as FullName,
    Email,
    Region
from crm_salesperson
