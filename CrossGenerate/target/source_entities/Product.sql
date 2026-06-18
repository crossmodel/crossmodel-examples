CREATE TABLE SourceVault.Product (
    ProductID INT,
    EANCode VARCHAR,
    Description VARCHAR,
    ItemPrice DECIMAL,
        CONSTRAINT pk_Product PRIMARY KEY (ProductID)
);
GO