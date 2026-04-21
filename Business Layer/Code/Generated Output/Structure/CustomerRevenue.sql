
-- Description: Aggregated revenue per customer and managing sales person, from Paid, Sent, and Overdue invoices.
CREATE TABLE CustomerRevenue (
    CustomerId INTEGER NOT NULL,
    SalesPersonId INTEGER NOT NULL,
    TotalRevenue DECIMAL(15,2) NOT NULL,
    PaidRevenue DECIMAL(15,2) NOT NULL,
    CONSTRAINT CustomerRevenuePK PRIMARY KEY (CustomerId, SalesPersonId)
);
