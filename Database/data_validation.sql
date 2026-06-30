-- Use the database that stores EV data.
USE ev_analytics;

-- Count total rows in the manufacturer table.
-- This shows how many companies were loaded.
SELECT
    COUNT(*)
FROM manufacturer;

-- Count total rows in the category table.
-- This shows how many vehicle categories were loaded.
SELECT
    COUNT(*)
FROM category;

-- Count total rows in the sales table.
-- This shows how many sales records were loaded.
SELECT
    COUNT(*)
FROM sales;

-- Show the first 5 records from the sales table.
-- This helps quickly check if the data looks correct.
SELECT
    *
FROM sales
LIMIT 5;

-- Show the first 5 records from the manufacturer table.
-- This helps check a small sample of company data.
SELECT
    *
FROM manufacturer
LIMIT 5;

-- Show the first 5 records from the category table.
-- This helps check a small sample of category data.
SELECT
    *
FROM category
LIMIT 5;

-- Check missing values in the sales table.
-- If an important column is NULL, the data may be incomplete.
SELECT
    *
FROM sales
WHERE
    manufacturer_id IS NULL
    OR category_id IS NULL
    OR sales_year IS NULL
    OR sales_count IS NULL;

-- Check duplicate sales_id values.
-- If the same sales_id appears more than once, it may be a duplicate record.
SELECT
    sales_id,
    COUNT(*) AS Duplicate_Count
FROM sales
GROUP BY
    sales_id
HAVING
    COUNT(*) > 1;
