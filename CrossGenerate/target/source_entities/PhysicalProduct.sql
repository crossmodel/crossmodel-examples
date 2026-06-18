CREATE TABLE SourceVault.PhysicalProduct (
    ProductID INT,
    EANCode VARCHAR,
    Description VARCHAR,
    ItemPrice DECIMAL,
    WidthInCm INT,
    LengthInCm INT,
    HeightInCm INT,
    WeightInKG DECIMAL,
        CONSTRAINT pk_PhysicalProduct PRIMARY KEY (ProductID)
);
GO