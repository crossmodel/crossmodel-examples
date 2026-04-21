CREATE TABLE CustomerRevenue (
    CustomerId      INTEGER        NOT NULL,
    SalesPersonId   INTEGER        NOT NULL,
    TotalRevenue    DECIMAL(15,2)  NOT NULL,
    CONSTRAINT CustomerRevenuePK PRIMARY KEY (CustomerId, SalesPersonId),
    CONSTRAINT FK_CustomerRevenue_Customer FOREIGN KEY (CustomerId) REFERENCES Customer (CustomerId),
    CONSTRAINT FK_CustomerRevenue_SalesPerson FOREIGN KEY (SalesPersonId) REFERENCES SalesPerson (SalesPersonId)
);
