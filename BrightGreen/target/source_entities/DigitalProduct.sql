USE SCHEMA SourceVault;

CREATE TABLE DigitalProduct (
    ProductID INTEGER,
    EANCode VARCHAR,
    Description VARCHAR,
    ItemPrice DECIMAL,
    ActivationURL VARCHAR,
    ExpirationPeriodInDays INTEGER
);
