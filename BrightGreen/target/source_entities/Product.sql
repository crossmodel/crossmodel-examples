USE SCHEMA SourceVault;

CREATE TABLE Product (
    ProductID INTEGER,
    EANCode VARCHAR,
    Description VARCHAR,
    ItemPrice DECIMAL,
        CONSTRAINT pk_Product PRIMARY KEY (ProductID)
);
