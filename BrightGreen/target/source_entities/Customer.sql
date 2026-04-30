USE DATABASE CrossModel;
USE SCHEMA SourceVault;

CREATE TABLE Customer (
    CustomerID INT,
    FirstName VARCHAR NOT NULL,
    LastName VARCHAR NOT NULL,
    DateOfBirth DATE,
    EmailAddress VARCHAR,
        CONSTRAINT pk_Customer PRIMARY KEY (CustomerID)
);
