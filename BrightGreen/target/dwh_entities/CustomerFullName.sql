USE DATABASE CrossModel;
USE SCHEMA dwh;

CREATE TABLE CustomerFullName (
    CustomerID VARCHAR,
    FullName VARCHAR NOT NULL,
        CONSTRAINT pk_CustomerFullName PRIMARY KEY (CustomerID)
);
