CREATE TABLE SourceVault.OrderWithCustomerData (
    SalesOrderID INT,
    Orderdate DATE,
    CustomerName VARCHAR(250),
        CONSTRAINT pk_OrderWithCustomerData PRIMARY KEY (SalesOrderID)
);
GO