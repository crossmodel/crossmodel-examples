CREATE TABLE CustomerRevenue (
    CustomerId INTEGER NOT NULL,
    SalesPersonId INTEGER NOT NULL,
    TotalRevenue DECIMAL(15,2) NOT NULL,
    PaidRevenue DECIMAL(15,2) NOT NULL,
    InsertedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT CustomerRevenuePK PRIMARY KEY (CustomerId, SalesPersonId)
);
