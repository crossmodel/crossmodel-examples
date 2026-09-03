CREATE TABLE SourceVault.Product (
    ProductID INT,
    EANCode VARCHAR(13),
    Description VARCHAR(255),
    ItemPrice DECIMAL(8, 2),
        CONSTRAINT pk_Product PRIMARY KEY (ProductID)
);
GO