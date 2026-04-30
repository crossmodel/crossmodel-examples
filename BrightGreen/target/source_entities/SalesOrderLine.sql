USE DATABASE CrossModel;
USE SCHEMA SourceVault;

CREATE TABLE SalesOrderLine (
    SalesOrderID INT,
    ProductID INT,
    ItemPrice DECIMAL,
    Quantity INT,
    LineAmt DECIMAL,
        CONSTRAINT pk_SalesOrderLine PRIMARY KEY (SalesOrderID)
);
