CREATE TABLE SalesPerson (
    SalesPersonId   INTEGER       NOT NULL,
    FullName        VARCHAR(160),
    Email           VARCHAR(240),
    Region          VARCHAR(30),
    CONSTRAINT SalesPersonPK PRIMARY KEY (SalesPersonId)
);
