USE SCHEMA SourceVault;

CREATE TABLE PhysicalProduct (
    ProductID INTEGER,
    EANCode VARCHAR,
    Description VARCHAR,
    ItemPrice DECIMAL,
    WidthInCm INTEGER,
    LengthInCm INTEGER,
    HeightInCm INTEGER,
    WeightInKG DECIMAL,
        CONSTRAINT pk_PhysicalProduct PRIMARY KEY (ProductID)
);
