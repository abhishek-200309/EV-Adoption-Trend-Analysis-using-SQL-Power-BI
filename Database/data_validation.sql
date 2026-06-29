-- Is database ko use karo jisme EV ka data rakha hai.
USE ev_analytics;

-- Manufacturer table me total rows count karo.
-- Isse pata chalega kitni companies ka data load hua hai.
SELECT
    COUNT(*)
FROM manufacturer;

-- Category table me total rows count karo.
-- Isse pata chalega kitni vehicle categories ka data load hua hai.
SELECT
    COUNT(*)
FROM category;

-- Sales table me total rows count karo.
-- Isse pata chalega kitne sales records load hue hain.
SELECT
    COUNT(*)
FROM sales;

-- Sales table ke first 5 records dikhao.
-- Isse quickly check hota hai data sahi dikh raha hai ya nahi.
SELECT
    *
FROM sales
LIMIT 5;

-- Manufacturer table ke first 5 records dikhao.
-- Isse company data ka sample check hota hai.
SELECT
    *
FROM manufacturer
LIMIT 5;

-- Category table ke first 5 records dikhao.
-- Isse category data ka sample check hota hai.
SELECT
    *
FROM category
LIMIT 5;

-- Sales table me missing values check karo.
-- Agar koi important column NULL hai, to data incomplete ho sakta hai.
SELECT
    *
FROM sales
WHERE
    manufacturer_id IS NULL
    OR category_id IS NULL
    OR sales_year IS NULL
    OR sales_count IS NULL;

-- Duplicate sales_id check karo.
-- Agar same sales_id ek se zyada baar hai, to duplicate record ho sakta hai.
SELECT
    sales_id,
    COUNT(*) AS Duplicate_Count
FROM sales
GROUP BY
    sales_id
HAVING
    COUNT(*) > 1;
