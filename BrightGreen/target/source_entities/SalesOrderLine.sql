USE SCHEMA SourceVault;

CREATE TABLE SalesOrderLine (
    SalesOrderID INTEGER,
    ProductID INTEGER,
    ItemPrice DECIMAL,
    Quantity INTEGER,
    LineAmt DECIMAL,
        CONSTRAINT pk_SalesOrderLine PRIMARY KEY (SalesOrderID)
);
