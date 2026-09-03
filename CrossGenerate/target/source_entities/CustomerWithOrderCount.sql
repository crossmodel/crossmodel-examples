CREATE TABLE SourceVault.CustomerWithOrderCount (
    Customer_ID VARCHAR(MAX),
    OrderCount INT,
        CONSTRAINT pk_CustomerWithOrderCount PRIMARY KEY (Customer_ID)
);
GO