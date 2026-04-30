USE DATABASE CrossModel;
USE SCHEMA SourceVault;

CREATE TABLE Product (
    ProductID INT,
    EANCode VARCHAR,
    Description VARCHAR,
    ItemPrice DECIMAL,
        CONSTRAINT pk_Product PRIMARY KEY (ProductID)
);
