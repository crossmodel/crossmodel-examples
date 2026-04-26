-- ============================================================
-- FactSales — Sales fact table
-- ============================================================

CREATE TABLE FactSales (
    SalesKey    INTEGER       NOT NULL,
    ProductKey  INTEGER       NOT NULL,
    CustomerKey INTEGER       NOT NULL,
    TimeKey     INTEGER       NOT NULL,
    Revenue     DECIMAL(15,2) NOT NULL,
    Quantity    INTEGER       NOT NULL,
    CONSTRAINT FactSalesPk PRIMARY KEY (SalesKey)
);

CREATE INDEX IX_FactSales_ProductKey ON FactSales (ProductKey);
CREATE INDEX IX_FactSales_CustomerKey ON FactSales (CustomerKey);
CREATE INDEX IX_FactSales_TimeKey ON FactSales (TimeKey);

