{{
    config(
        materialized='table'
    )
}}

/*
  Customer
  --------
  A customer account with their key identifiers and contact details.

  Sources:
    - crm_source.Customer   (primary)
    - crm_source.Opportunity (left-join to resolve the managing SalesPersonId)

  The Opportunity table is joined to retrieve the SalesPersonId associated
  with the customer. When a customer has multiple opportunities the first
  sales person encountered is used (via MIN as a deterministic tie-breaker).
*/

with crm_customer as (

    select
        CustomerId,
        CompanyName,
        ContactName,
        Email,
        Industry
    from {{ source('crm_source', 'Customer') }}

),

crm_opportunity as (

    select
        CustomerId,
        SalesPersonId
    from {{ source('crm_source', 'Opportunity') }}

),

-- Resolve a single SalesPersonId per customer
customer_salesperson as (

    select
        CustomerId,
        MIN(SalesPersonId) as SalesPersonId
    from crm_opportunity
    group by CustomerId

)

select
    c.CustomerId,
    c.CompanyName,
    c.ContactName,
    c.Email,
    c.Industry,
    cs.SalesPersonId
from crm_customer           c
left join customer_salesperson cs
    on c.CustomerId = cs.CustomerId
