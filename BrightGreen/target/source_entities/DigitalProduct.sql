USE DATABASE CrossModel;
USE SCHEMA SourceVault;

CREATE TABLE DigitalProduct (
    ProductID INT,
    EANCode VARCHAR,
    Description VARCHAR,
    ItemPrice DECIMAL,
    ActivationURL VARCHAR,
    ExpirationPeriodInDays INT,
        CONSTRAINT pk_DigitalProduct PRIMARY KEY (ProductID)
);
