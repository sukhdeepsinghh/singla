-- create_table.sql


SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'sukhdeep'
AND table_name = 'customers';

CREATE TABLE IF NOT EXISTS customers (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    age INT
);

