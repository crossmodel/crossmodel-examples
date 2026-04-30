USE DATABASE CrossModel;
USE SCHEMA SourceVault;

CREATE TABLE DigitalProduct (
    ProductID INT,
    EANCode VARCHAR,
    Description VARCHAR,
    ItemPrice DECIMAL,
    ActivationURL VARCHAR,
    ExpirationPeriodInDays INT
);
