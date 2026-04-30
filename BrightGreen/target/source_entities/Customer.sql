USE SCHEMA SourceVault;

CREATE TABLE Customer (
    CustomerID INTEGER,
    FirstName VARCHAR,
    LastName VARCHAR,
    DateOfBirth DATE,
    EmailAddress VARCHAR,
        CONSTRAINT pk_Customer PRIMARY KEY (CustomerID)
);
