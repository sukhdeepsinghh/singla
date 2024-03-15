SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'sukhdeep'
AND table_name = 'shopkeeper';

CREATE TABLE IF NOT EXISTS shopkeeper (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    age INT
);

