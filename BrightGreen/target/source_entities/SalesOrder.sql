USE SCHEMA SourceVault;

CREATE TABLE SalesOrder (
    SalesOrderID INTEGER,
    OrderDate DATE,
    CustomerID INTEGER,
    OrderStatus VARCHAR,
        CONSTRAINT pk_SalesOrder PRIMARY KEY (SalesOrderID)
);
