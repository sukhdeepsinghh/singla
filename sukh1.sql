-- create_table.sql
USE sukhdeep;

SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'sukhdeep'
AND table_name = 'customers';

CREATE TABLE customers (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    age INT
    -- Add more columns and constraints as needed
);

