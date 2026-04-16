# Example DWH

> Data warehouse model that consolidates customer and order data from JuiceERP and PreciseFinance source systems


| | |
|:--|:--|
| **ID** | `example-dwh` |
| **Type** | `logical` |
| **Version** | `1.0.0` |

#### Dependencies

| Data Model | Version |
|:-----------|:-------:|
| [JuiceERP](./JuiceERP.md) | `1.0.0` |
| [PreciseFinance](./PreciseFinance.md) | `1.0.0` |

---

## Table of Contents

**Entities**

- [`CustomerWithOrderCount`](#CustomerWithOrderCount)
- [`OrderWithCustomerData`](#OrderWithCustomerData)



**Mappings**

- [`JuiceERP_CustomerWithOrderCount`](#mapping-JuiceERP_CustomerWithOrderCount)
- [`OrderWithCustomerDataMapping`](#mapping-OrderWithCustomerDataMapping)

---

# Entities

<h2 id="CustomerWithOrderCount">CustomerWithOrderCount</h2>

> Denormalized view of a customer enriched with the total number of orders placed


| | Attribute | Datatype | PK | Mandatory | Description |
|--:|:----------|:---------|:--:|:---------:|:------------|
| 0 | **Customer ID** | `Text` | 🔑 |  | *Unique identifier for the customer* |
| 1 | OrderCount | `Integer` |  |  | *Total number of orders placed by the customer* |


> 🔑 **Primary Key** — **Customer ID**


---

<h2 id="OrderWithCustomerData">OrderWithCustomerData</h2>

> Denormalized view of a sales order enriched with customer information


| | Attribute | Datatype | PK | Mandatory | Description |
|--:|:----------|:---------|:--:|:---------:|:------------|
| 0 | **SalesOrderID** | `Integer` | 🔑 |  | *Unique identifier for the sales order* |
| 1 | Orderdate | `Date` |  |  | *Date when the order was placed* |
| 2 | CustomerName | `Text`(250) |  |  | *Full name of the customer who placed the order* |


> 🔑 **Primary Key** — **SalesOrderID**


---



# Mappings

<h2 id="mapping-JuiceERP_CustomerWithOrderCount">Mapping: JuiceERP_CustomerWithOrderCount</h2>

### Sources

| Alias | Entity | Join | Conditions |
|:------|:-------|:-----|:-----------|
| **Customer** | `JuiceERP.Customer` | `from` |  |
| **SalesOrder** | `JuiceERP.SalesOrder` | `left-join` | CustomerID &#x3D; CustomerID |

### Target → [CustomerWithOrderCount](#CustomerWithOrderCount)

| Target Attribute | Source(s) | Expression |
|:-----------------|:----------|:-----------|
| **Customer ID** | CustomerID |  |
| **OrderCount** | SalesOrderID | `COUNT({{SalesOrder.SalesOrderID}})` *(SQL)* |

---

<h2 id="mapping-OrderWithCustomerDataMapping">Mapping: OrderWithCustomerDataMapping</h2>

### Sources

| Alias | Entity | Join | Conditions |
|:------|:-------|:-----|:-----------|
| **SalesOrder** | `JuiceERP.SalesOrder` | `from` |  |
| **Customer** | `JuiceERP.Customer` | `left-join` | CustomerID &#x3D; CustomerID |

### Target → [OrderWithCustomerData](#OrderWithCustomerData)

| Target Attribute | Source(s) | Expression |
|:-----------------|:----------|:-----------|
| **SalesOrderID** | SalesOrderID |  |
| **Orderdate** | OrderDate |  |
| **CustomerName** | FirstName, LastName | `CONCAT_WS(' ', Customer.FirstName, Customer.LastName)` *(SQL)* |

---


---

> *Documentation generated from data model `example-dwh` — version 1.0.0*
