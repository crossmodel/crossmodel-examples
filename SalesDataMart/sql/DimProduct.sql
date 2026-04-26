-- ============================================================
-- Dim_Product — Product dimension table
-- ============================================================

CREATE TABLE Dim_Product (
    ProductKey      INTEGER      NOT NULL,
    ProductId       NVARCHAR(50)  NOT NULL,
    ProductName     NVARCHAR(100) NOT NULL,
    ProductCategory NVARCHAR(50),
    CONSTRAINT PK_DimProduct PRIMARY KEY (ProductKey)
);
