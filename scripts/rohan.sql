USE sukhdeep;

SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'sukhdeep'
AND table_name = 'employees';

CREATE TABLE IF NOT EXISTS employees (
CREATE TABLE customers (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    age INT
    -- Add more columns and constraints as needed
);
