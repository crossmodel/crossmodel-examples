USE DATABASE CrossModel;
USE SCHEMA SourceVault;

CREATE TABLE SalesOrder (
    SalesOrderID INT,
    OrderDate DATE,
    CustomerID INT,
    OrderStatus VARCHAR,
        CONSTRAINT pk_SalesOrder PRIMARY KEY (SalesOrderID)
);
