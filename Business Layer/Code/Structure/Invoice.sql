CREATE TABLE Invoice (
    InvoiceId       INTEGER        NOT NULL,
    CustomerId      INTEGER        NOT NULL,
    SalesPersonId   INTEGER,
    InvoiceDate     DATE           NOT NULL,
    DueDate         DATE,
    TotalAmount     DECIMAL(12,2),
    Currency        VARCHAR(3),
    Status          VARCHAR(20),
    CONSTRAINT InvoicePK PRIMARY KEY (InvoiceId),
    CONSTRAINT FK_Invoice_Customer FOREIGN KEY (CustomerId) REFERENCES Customer (CustomerId),
    CONSTRAINT FK_Invoice_SalesPerson FOREIGN KEY (SalesPersonId) REFERENCES SalesPerson (SalesPersonId)
);
