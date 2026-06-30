-- Intermediate SQL (Project-Specific)
-- This file solves slightly advanced questions.
-- Here we join tables and use grouped data to find answers.

USE ev_analytics;

-- Question 1: Show total registrations for each manufacturer.
-- The manufacturer table gives the company name.
-- The registration table gives the registration counts for that company.
SELECT
    m.manufacturer,
    SUM(r.registration_count) AS Total_Registrations
FROM manufacturer AS m
JOIN registration AS r
    ON m.manufacturer_id = r.manufacturer_id
GROUP BY
    m.manufacturer
ORDER BY
    Total_Registrations;

-- Question 2: Show total registrations for each category.
-- The category table gives the category name.
-- The registration table gives the registration counts for that category.
SELECT
    c.category,
    SUM(r.registration_count) AS Total_Registrations
FROM category AS c
JOIN registration AS r
    ON c.category_id = r.category_id
GROUP BY
    c.category
ORDER BY
    Total_Registrations;

-- Question 3: Show total registrations by manufacturer and category.
-- This shows how many registrations each company has in each category.
SELECT
    m.manufacturer,
    c.category,
    SUM(r.registration_count) AS Total_Registrations
FROM manufacturer AS m
JOIN registration AS r
    ON m.manufacturer_id = r.manufacturer_id
JOIN category AS c
    ON c.category_id = r.category_id
GROUP BY
    m.manufacturer,
    c.category
ORDER BY
    Total_Registrations;

-- Question 4: Show manufacturers whose total registrations are above the overall average.
-- First, find the total registrations for each manufacturer.
-- Then, find the average of those totals.
-- Finally, show only manufacturers whose total is above that average.
SELECT
    m.manufacturer,
    SUM(r.registration_count) AS Total_Registrations
FROM manufacturer AS m
JOIN registration AS r
    ON m.manufacturer_id = r.manufacturer_id
GROUP BY
    m.manufacturer
HAVING
    SUM(r.registration_count) > (
        SELECT
            AVG(manufacturer_total)
        FROM (
            SELECT
                manufacturer_id,
                SUM(registration_count) AS manufacturer_total
            FROM registration
            GROUP BY
                manufacturer_id
        ) AS avg_table
    )
ORDER BY
    Total_Registrations DESC;

-- Question 5: Show year-wise registrations for each manufacturer.
-- This shows how many EV registrations each company has in each year.
SELECT
    m.manufacturer,
    r.registration_year,
    SUM(r.registration_count) AS Total_Registrations
FROM manufacturer AS m
JOIN registration AS r
    ON m.manufacturer_id = r.manufacturer_id
GROUP BY
    r.registration_year,
    m.manufacturer
ORDER BY
    m.manufacturer,
    r.registration_year;

-- Question 6: Show category-wise registrations for each year.
-- This shows how many registrations each category has in each year.
SELECT
    c.category,
    r.registration_year,
    SUM(r.registration_count) AS Total_Registrations
FROM category AS c
JOIN registration AS r
    ON c.category_id = r.category_id
GROUP BY
    c.category,
    r.registration_year;

-- Question 7: Show the top vehicle class by registrations.
-- First, find the total registrations for each vehicle class.
-- Then, sort from highest to lowest and show only the top one.
SELECT
    vehicle_class,
    SUM(registration_count) AS Total_Registrations
FROM registration
GROUP BY
    vehicle_class
ORDER BY
    Total_Registrations DESC
LIMIT 1;

-- Question 8: Show manufacturers that have registrations in every year.
-- COUNT DISTINCT years tells how many different years the company appears in.
-- If this count equals the total number of years, the company appears every year.
SELECT
    m.manufacturer
FROM manufacturer AS m
JOIN registration AS r
    ON m.manufacturer_id = r.manufacturer_id
GROUP BY
    m.manufacturer
HAVING
    COUNT(DISTINCT r.registration_year) = (
        SELECT
            COUNT(DISTINCT registration_year)
        FROM registration
    );

-- Question 9: Show manufacturers that have only one vehicle class.
-- If the distinct vehicle class count is 1, the company has only one class.
SELECT
    m.manufacturer
FROM manufacturer AS m
JOIN registration AS r
    ON m.manufacturer_id = r.manufacturer_id
GROUP BY
    m.manufacturer
HAVING
    COUNT(DISTINCT r.vehicle_class) = 1;

-- Question 10: Divide registrations into adoption level groups.
-- CASE creates a label based on the registration count.
SELECT
    CASE
        WHEN registration_count = 0 THEN 'NO Adoption'
        WHEN registration_count BETWEEN 1 AND 100 THEN 'Low Adoption'
        WHEN registration_count BETWEEN 101 AND 1000 THEN 'Moderate Adoption'
        ELSE 'High Adoption'
    END AS Adoption_Levels,
    COUNT(*) AS Total_Records
FROM registration
GROUP BY
    Adoption_Levels;

-- Question 11: Show manufacturers that have more than one category.
-- COUNT DISTINCT category_id tells how many categories a company has.
SELECT
    m.manufacturer,
    COUNT(DISTINCT r.category_id) AS Category_Count
FROM manufacturer AS m
JOIN registration AS r
    ON m.manufacturer_id = r.manufacturer_id
GROUP BY
    m.manufacturer
HAVING
    COUNT(DISTINCT r.category_id) > 1;

-- Question 12: Show average registrations for each manufacturer.
-- AVG finds the average value.
SELECT
    m.manufacturer,
    AVG(r.registration_count) AS Average_Count
FROM manufacturer AS m
JOIN registration AS r
    ON m.manufacturer_id = r.manufacturer_id
GROUP BY
    m.manufacturer;

-- Question 13: Show total registrations for each state.
-- The manufacturer table gives the state, and the registration table gives the count.
SELECT
    m.state,
    SUM(r.registration_count) AS Total_Registrations
FROM manufacturer AS m
JOIN registration AS r
    ON m.manufacturer_id = r.manufacturer_id
GROUP BY
    m.state;

-- Question 14: Show total registrations for each place.
-- This groups registrations by place and finds the total.
SELECT
    m.place,
    SUM(r.registration_count) AS Total_Registrations
FROM manufacturer AS m
JOIN registration AS r
    ON m.manufacturer_id = r.manufacturer_id
GROUP BY
    m.place;

-- Question 15: Show manufacturers with total registrations greater than 50,000.
-- HAVING filters the grouped total.
SELECT
    m.manufacturer,
    SUM(r.registration_count) AS Total_Registrations
FROM manufacturer AS m
JOIN registration AS r
    ON m.manufacturer_id = r.manufacturer_id
GROUP BY
    m.manufacturer
HAVING
    SUM(r.registration_count) > 50000;

-- Question 16: Show categories with average registrations above 10,000.
-- AVG checks the average registration count for each category.
SELECT
    c.category,
    AVG(r.registration_count) AS Average_Registrations
FROM category AS c
JOIN registration AS r
    ON c.category_id = r.category_id
GROUP BY
    c.category
HAVING
    AVG(r.registration_count) > 10000;

-- Question 17: Show the year with the highest average registrations.
-- DESC puts the biggest average first.
-- LIMIT 1 shows only the highest year.
SELECT
    registration_year,
    AVG(registration_count) AS Average_Registrations
FROM registration
GROUP BY
    registration_year
ORDER BY
    Average_Registrations DESC
LIMIT 1;

-- Question 18: Show manufacturers whose name starts with T.
-- LIKE 'T%' means the name starts with T and can have anything after it.
SELECT
    manufacturer
FROM manufacturer
WHERE
    manufacturer LIKE 'T%';

-- Question 19: Show manufacturers sorted by total registrations.
-- First the total is calculated, then ORDER BY sorts the result.
SELECT
    m.manufacturer,
    SUM(r.registration_count) AS Total_Registrations
FROM manufacturer AS m
JOIN registration AS r
    ON m.manufacturer_id = r.manufacturer_id
GROUP BY
    m.manufacturer
ORDER BY
    Total_Registrations;

-- Question 20: Show the top 3 states by total registrations.
-- DESC puts the highest registrations first.
-- LIMIT 3 shows only the top 3 states.
SELECT
    m.state,
    SUM(r.registration_count) AS Total_Registrations
FROM manufacturer AS m
JOIN registration AS r
    ON m.manufacturer_id = r.manufacturer_id
GROUP BY
    m.state
ORDER BY
    Total_Registrations DESC
LIMIT 3;
