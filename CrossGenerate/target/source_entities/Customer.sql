CREATE TABLE SourceVault.Customer (
    CustomerID INT NOT NULL,
    FirstName VARCHAR,
    LastName VARCHAR,
    DateOfBirth DATE,
    EmailAddress VARCHAR,
        CONSTRAINT pk_Customer PRIMARY KEY (CustomerID)
);
GO