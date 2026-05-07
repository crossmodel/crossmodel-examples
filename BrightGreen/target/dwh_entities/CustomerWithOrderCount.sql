USE DATABASE CrossModel;
USE SCHEMA dwh;

CREATE TABLE CustomerWithOrderCount (
    Customer_ID VARCHAR,
    OrderCount INT,
        CONSTRAINT pk_CustomerWithOrderCount PRIMARY KEY (Customer_ID)
);
