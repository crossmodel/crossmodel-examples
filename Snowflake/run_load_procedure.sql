USE DATABASE CrossModel;
USE SCHEMA dwh;

CALL load_CustomerFullName();

SELECT * FROM CustomerFullName;