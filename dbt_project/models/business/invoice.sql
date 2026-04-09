{{
    config(
        materialized='table'
    )
}}

/*
  Invoice
  -------
  A billing document issued to a customer, capturing amount and payment status.

  Sources:
    - erp_source.Invoice     (primary)
    - erp_source.SalesOrder  (inner-join to resolve CustomerId and Currency)
    - crm_source.Opportunity (left-join to resolve SalesPersonId via the customer link)

  Join path:
    Invoice -> SalesOrder      on Invoice.SalesOrderId    = SalesOrder.SalesOrderId
    SalesOrder -> Opportunity  on SalesOrder.CustomerNumber = Opportunity.CustomerId
*/

with erp_invoice as (

    select
        InvoiceId,
        SalesOrderId,
        InvoiceDate,
        DueDate,
        TotalAmount,
        Status
    from {{ source('erp_source', 'Invoice') }}

),

erp_sales_order as (

    select
        SalesOrderId,
        CustomerNumber,
        Currency
    from {{ source('erp_source', 'SalesOrder') }}

),

crm_opportunity as (

    select
        CustomerId,
        SalesPersonId
    from {{ source('crm_source', 'Opportunity') }}

),

-- Resolve a single SalesPersonId per customer from CRM opportunities
customer_salesperson as (

    select
        CustomerId,
        MIN(SalesPersonId) as SalesPersonId
    from crm_opportunity
    group by CustomerId

)

select
    i.InvoiceId,
    so.CustomerNumber                  as CustomerId,
    cs.SalesPersonId,
    i.InvoiceDate,
    i.DueDate,
    i.TotalAmount,
    so.Currency,
    i.Status
from erp_invoice              i
inner join erp_sales_order    so
    on i.SalesOrderId = so.SalesOrderId
left join customer_salesperson cs
    on so.CustomerNumber = cs.CustomerId
