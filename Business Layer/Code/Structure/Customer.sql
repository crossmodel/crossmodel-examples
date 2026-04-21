CREATE TABLE Customer (
    CustomerId      INTEGER       NOT NULL,
    CompanyName     VARCHAR(200),
    ContactName     VARCHAR(120),
    Email           VARCHAR(240),
    Industry        VARCHAR(50),
    SalesPersonId   INTEGER,
    CONSTRAINT CustomerPK PRIMARY KEY (CustomerId),
    CONSTRAINT FK_Customer_SalesPerson FOREIGN KEY (SalesPersonId) REFERENCES SalesPerson (SalesPersonId)
);
