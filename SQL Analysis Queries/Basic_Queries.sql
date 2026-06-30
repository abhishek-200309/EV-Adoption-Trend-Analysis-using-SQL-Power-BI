-- BASIC SQL Queries
-- This file asks simple questions from the EV registration data.
-- It uses SELECT, WHERE, ORDER BY, GROUP BY, COUNT, SUM, AVG, and LIMIT.

-- Question 1: What is the total number of EV registrations?
-- SUM adds all registration_count values together.
SELECT
    SUM(registration_count) AS Total_Registrations
FROM registration;

-- Question 2: How many manufacturers are there?
-- COUNT counts the manufacturer_id values.
SELECT
    COUNT(manufacturer_id) AS Total_Manufacturers
FROM manufacturer;

-- Question 3: How many vehicle categories are there?
-- COUNT counts the category_id values.
SELECT
    COUNT(category_id) AS Total_Categories
FROM category;

-- Question 4: Show all vehicle classes from the registration table.
-- Some vehicle class names may repeat.
SELECT
    vehicle_class
FROM registration;

-- Question 5: Show each vehicle class only once.
-- DISTINCT removes duplicate names.
SELECT DISTINCT
    vehicle_class
FROM registration;

-- Question 6: Show total registrations for each manufacturer_id.
-- GROUP BY puts the same manufacturer_id rows together.
SELECT
    manufacturer_id,
    SUM(registration_count) AS Total_Registrations
FROM registration
GROUP BY
    manufacturer_id;

-- Question 7: Show total registrations for each category_id.
-- This shows how many EV registrations each category has.
SELECT
    category_id,
    SUM(registration_count) AS Total_Registrations
FROM registration
GROUP BY
    category_id;

-- Question 8: Show total EV registrations for each year.
-- The data is grouped by registration_year.
SELECT
    registration_year,
    SUM(registration_count) AS Total_Registrations
FROM registration
GROUP BY
    registration_year;

-- Question 9: Which year has the highest registrations?
-- ORDER BY DESC puts the biggest number first.
-- LIMIT 1 shows only the top result.
SELECT
    registration_year,
    SUM(registration_count) AS Total_Registrations
FROM registration
GROUP BY
    registration_year
ORDER BY
    Total_Registrations DESC
LIMIT 1;

-- Question 10: Which year has the lowest registrations?
-- ORDER BY sorts from the smallest number to the biggest number.
-- LIMIT 1 shows only the smallest result.
SELECT
    registration_year,
    SUM(registration_count) AS Total_Registrations
FROM registration
GROUP BY
    registration_year
ORDER BY
    Total_Registrations
LIMIT 1;

-- Question 11: Which manufacturer_id has the highest total registrations?
-- First we find the total for each manufacturer, then choose the biggest one.
SELECT
    manufacturer_id,
    SUM(registration_count) AS Total_Registrations
FROM registration
GROUP BY
    manufacturer_id
ORDER BY
    Total_Registrations DESC
LIMIT 1;

-- Question 12: Which category_id has the highest registrations?
-- DESC puts the biggest total at the top.
SELECT
    category_id,
    SUM(registration_count) AS Total_Registrations
FROM registration
GROUP BY
    category_id
ORDER BY
    Total_Registrations DESC
LIMIT 1;

-- Question 13: Show the top 5 manufacturer_ids by registrations.
-- Top 5 means the 5 manufacturers with the highest registrations.
SELECT
    manufacturer_id,
    SUM(registration_count) AS Total_Registrations
FROM registration
GROUP BY
    manufacturer_id
ORDER BY
    Total_Registrations DESC
LIMIT 5;

-- Question 14: Show the bottom 5 manufacturer_ids by registrations.
-- Bottom 5 means the 5 manufacturers with the lowest registrations.
SELECT
    manufacturer_id,
    SUM(registration_count) AS Total_Registrations
FROM registration
GROUP BY
    manufacturer_id
ORDER BY
    Total_Registrations
LIMIT 5;

-- Question 15: Show average registrations for each year.
-- AVG finds the average value.
SELECT
    registration_year,
    AVG(registration_count) AS Average_Registrations
FROM registration
GROUP BY
    registration_year;

-- Question 16: Show the highest registration count in one row.
-- MAX shows the biggest registration_count value.
SELECT
    MAX(registration_count) AS Max_Registrations
FROM registration;

-- Question 17: Show the lowest registration count in one row.
-- MIN shows the smallest registration_count value.
SELECT
    MIN(registration_count) AS Min_Registrations
FROM registration;

-- Question 18: Show records where registrations are more than 10,000.
-- WHERE works like a filter.
SELECT
    registration_count
FROM registration
WHERE
    registration_count > 10000;

-- Question 19: Show records from 2019 to 2022.
-- BETWEEN gets data between the start and end values.
SELECT
    *
FROM registration
WHERE
    registration_year BETWEEN 2019 AND 2022;

-- Question 20: Show total registrations for each vehicle class.
-- This shows how many registrations each vehicle class has.
SELECT
    vehicle_class,
    SUM(registration_count) AS Total_Registrations
FROM registration
GROUP BY
    vehicle_class;
