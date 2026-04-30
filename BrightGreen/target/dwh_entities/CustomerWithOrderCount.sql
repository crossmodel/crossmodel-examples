USE SCHEMA dwh;

CREATE TABLE CustomerWithOrderCount (
    Customer_ID VARCHAR,
    OrderCount INTEGER,
        CONSTRAINT pk_CustomerWithOrderCount PRIMARY KEY (Customer_ID)
);
