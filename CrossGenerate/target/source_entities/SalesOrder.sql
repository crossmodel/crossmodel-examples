CREATE TABLE SourceVault.SalesOrder (
    SalesOrderID INT,
    OrderDate DATE,
    CustomerID INT,
    OrderStatus VARCHAR,
        CONSTRAINT pk_SalesOrder PRIMARY KEY (SalesOrderID)
);
GO