# JuiceERP

> Source system model for JuiceERP, containing customer, product, and sales order data


| | |
|:--|:--|
| **ID** | `JuiceERP` |
| **Type** | `logical` |
| **Version** | `1.0.0` |


---

## Table of Contents

**Entities**

- [`DigitalProduct`](#DigitalProduct)
- [`Customer`](#Customer)
- [`Product`](#Product)
- [`SalesOrder`](#SalesOrder)
- [`PhysicalProduct`](#PhysicalProduct)
- [`SalesOrderLine`](#SalesOrderLine)


**Relationships**

- [`Customer_SalesOrder`](#Customer_SalesOrder) — Customer → SalesOrder
- [`SalesOrder_SalesOrderLine`](#SalesOrder_SalesOrderLine) — SalesOrder → SalesOrderLine
- [`Product_SalesOrderLine`](#Product_SalesOrderLine) — Product → SalesOrderLine


---

# Entities

<h2 id="DigitalProduct">DigitalProduct</h2>

> A digital product that can be activated online, inheriting base product attributes

> **Inherits from:** [Product](#Product)


| | Attribute | Datatype | PK | Mandatory | Description |
|--:|:----------|:---------|:--:|:---------:|:------------|
| 0 | ProductID | `Integer` |  |  | *Unique identifier for the product* |
| 1 | EANCode | `Text` |  |  | *European Article Number barcode for the product* |
| 2 | Description | `Text` |  |  | *Textual description of the product* |
| 3 | ItemPrice | `Decimal` |  |  | *Unit price of the product* |
| 4 | ActivationURL | `Text` |  |  | *URL used to activate the digital product after purchase* |
| 5 | ExpirationPeriodInDays | `Integer` |  |  | *Number of days after activation before the digital product expires* |



---

<h2 id="Customer">Customer</h2>

> Represents a customer registered in the JuiceERP system


| | Attribute | Datatype | PK | Mandatory | Description |
|--:|:----------|:---------|:--:|:---------:|:------------|
| 0 | **CustomerID** | `Integer` | 🔑 | ✔ | *Unique identifier for the customer* |
| 1 | FirstName | `Text` |  |  | *First name of the customer* |
| 2 | LastName | `Text` |  |  | *Last name of the customer* |
| 3 | DateOfBirth | `Date` |  |  | *Date of birth of the customer* |
| 4 | EmailAddress | `Text` |  |  | *Email address of the customer* |


> 🔑 **Primary Key** — **CustomerID**


---

<h2 id="Product">Product</h2>

> Base entity representing a product available for sale in JuiceERP


| | Attribute | Datatype | PK | Mandatory | Description |
|--:|:----------|:---------|:--:|:---------:|:------------|
| 0 | **ProductID** | `Integer` | 🔑 |  | *Unique identifier for the product* |
| 1 | EANCode | `Text` |  |  | *European Article Number barcode for the product* |
| 2 | Description | `Text` |  |  | *Textual description of the product* |
| 3 | ItemPrice | `Decimal` |  |  | *Unit price of the product* |


> 🔑 **Primary Key** — **ProductID**


---

<h2 id="SalesOrder">SalesOrder</h2>

> Represents a sales order placed by a customer in JuiceERP


| | Attribute | Datatype | PK | Mandatory | Description |
|--:|:----------|:---------|:--:|:---------:|:------------|
| 0 | **SalesOrderID** | `Integer` | 🔑 |  | *Unique identifier for the sales order* |
| 1 | OrderDate | `Date` |  |  | *Date when the sales order was placed* |
| 2 | CustomerID | `Integer` |  |  | *Reference to the customer who placed this order* |
| 3 | OrderStatus | `Text` |  |  | *Current status of the sales order* |


> 🔑 **Primary Key** — **SalesOrderID**


---

<h2 id="PhysicalProduct">PhysicalProduct</h2>

> A physical product with dimensional and weight attributes, inheriting base product attributes

> **Inherits from:** [Product](#Product)


| | Attribute | Datatype | PK | Mandatory | Description |
|--:|:----------|:---------|:--:|:---------:|:------------|
| 0 | **ProductID** | `Integer` | 🔑 |  | *Unique identifier for the product* |
| 1 | EANCode | `Text` |  |  | *European Article Number barcode for the product* |
| 2 | Description | `Text` |  |  | *Textual description of the product* |
| 3 | ItemPrice | `Decimal` |  |  | *Unit price of the product* |
| 4 | WidthInCm | `Integer` |  |  | *Width of the product in centimeters* |
| 5 | LengthInCm | `Integer` |  |  | *Length of the product in centimeters* |
| 6 | HeightInCm | `Integer` |  |  | *Height of the product in centimeters* |
| 7 | WeightInKG | `Decimal` |  |  | *Weight of the product in kilograms* |


> 🔑 **Primary Key** — **ProductID**


---

<h2 id="SalesOrderLine">SalesOrderLine</h2>

> Represents an individual line item within a sales order


| | Attribute | Datatype | PK | Mandatory | Description |
|--:|:----------|:---------|:--:|:---------:|:------------|
| 0 | **SalesOrderID** | `Integer` | 🔑 |  | *Reference to the parent sales order* |
| 1 | ProductID | `Integer` |  |  | *Reference to the product on this order line* |
| 2 | ItemPrice | `Decimal` |  |  | *Price per unit of the product at the time of the order* |
| 3 | Quantity | `Integer` |  |  | *Number of units ordered for this line item* |
| 4 | LineAmt | `Decimal` |  |  | *Total amount for this order line (ItemPrice multiplied by Quantity)* |


> 🔑 **Primary Key** — **SalesOrderID**


---


# Relationships

<h2 id="Customer_SalesOrder">Customer_SalesOrder</h2>

> Links a customer to their sales orders, indicating which customer placed each order

| Role | Entity | Cardinality |
|:-----|:-------|:-----------:|
| **Parent** | [Customer](#Customer) | `0..1` |
| **Child** | [SalesOrder](#SalesOrder) | `0..N` |

| Parent | | Child |
|:-------|:-:|:------|
| `CustomerID` | ↔ | `CustomerID` |

---

<h2 id="SalesOrder_SalesOrderLine">SalesOrder_SalesOrderLine</h2>

> Links a sales order to its individual line items

| Role | Entity | Cardinality |
|:-----|:-------|:-----------:|
| **Parent** | [SalesOrder](#SalesOrder) | `0..1` |
| **Child** | [SalesOrderLine](#SalesOrderLine) | `0..N` |

| Parent | | Child |
|:-------|:-:|:------|
| `SalesOrderID` | ↔ | `SalesOrderID` |

---

<h2 id="Product_SalesOrderLine">Product_SalesOrderLine</h2>

> Links a product to the sales order lines in which it was ordered

| Role | Entity | Cardinality |
|:-----|:-------|:-----------:|
| **Parent** | [Product](#Product) | `0..1` |
| **Child** | [SalesOrderLine](#SalesOrderLine) | `0..N` |

| Parent | | Child |
|:-------|:-:|:------|
| `ProductID` | ↔ | `ProductID` |

---



---

> *Documentation generated from data model `JuiceERP` — version 1.0.0*
