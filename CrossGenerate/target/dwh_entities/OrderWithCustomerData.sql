CREATE TABLE dwh.OrderWithCustomerData (
    SalesOrderID INT,
    Orderdate DATE,
    CustomerName VARCHAR,
        CONSTRAINT pk_OrderWithCustomerData PRIMARY KEY (SalesOrderID)
);
GO