CREATE TABLE SourceVault.Customer (
    CustomerID INT NOT NULL,
    FirstName VARCHAR(MAX),
    LastName VARCHAR(MAX),
    DateOfBirth DATE,
    EmailAddress VARCHAR(MAX),
        CONSTRAINT pk_Customer PRIMARY KEY (CustomerID)
);
GO