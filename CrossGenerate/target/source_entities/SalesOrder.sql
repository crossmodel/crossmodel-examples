CREATE TABLE SourceVault.SalesOrder (
    SalesOrderID INT,
    OrderDate DATE,
    CustomerID INT,
    OrderStatus VARCHAR(MAX),
        CONSTRAINT pk_SalesOrder PRIMARY KEY (SalesOrderID)
);
GO