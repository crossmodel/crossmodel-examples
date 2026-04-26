-- ============================================================
-- Dim_Customer — Customer dimension table
-- ============================================================

CREATE TABLE Dim_Customer (
    CustomerKey     INTEGER      NOT NULL,
    CustomerId      NVARCHAR(50)  NOT NULL,
    CustomerName    NVARCHAR(100) NOT NULL,
    CustomerCity    NVARCHAR(100),
    CustomerCountry NVARCHAR(100),
    CONSTRAINT PK_DimCustomer PRIMARY KEY (CustomerKey)
);
