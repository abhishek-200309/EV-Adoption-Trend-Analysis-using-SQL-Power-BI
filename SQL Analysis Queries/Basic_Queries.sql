-- BASIC SQL Queries
-- Yeh file simple sawaal poochti hai EV registration data se.
-- Isme SELECT, WHERE, ORDER BY, GROUP BY, COUNT, SUM, AVG, aur LIMIT use kiya gaya hai.

-- Sawaal 1: Total EV registrations kitne hain?
-- SUM sab registration_count numbers ko jod deta hai.
SELECT SUM(registration_count) AS Total_Registrations
FROM registration;

-- Sawaal 2: Total manufacturers yani companies kitni hain?
-- COUNT manufacturer_id ki counting karta hai.
SELECT COUNT(manufacturer_id) AS Total_Manufacturers
FROM manufacturer;

-- Sawaal 3: Total vehicle categories kitni hain?
-- COUNT category_id ki counting karta hai.
SELECT COUNT(category_id) AS Total_Categories
FROM category;

-- Sawaal 4: Registration table me jitne vehicle classes hain, sab dikhao.
-- Isme repeat values bhi aa sakti hain.
SELECT vehicle_class
FROM registration;

-- Sawaal 5: Vehicle classes ko sirf ek-ek baar dikhao.
-- DISTINCT duplicate names hata deta hai.
SELECT DISTINCT vehicle_class
FROM registration;

-- Sawaal 6: Har manufacturer_id ke total registrations dikhao.
-- GROUP BY same manufacturer_id wale rows ko ek group bana deta hai.
SELECT manufacturer_id,
       SUM(registration_count) AS Total_Registrations
FROM registration
GROUP BY manufacturer_id;

-- Sawaal 7: Har category_id ke total registrations dikhao.
-- Isse pata chalega kaunsi category me kitni EV registrations hui.
SELECT category_id,
       SUM(registration_count) AS Total_Registrations
FROM registration
GROUP BY category_id;

-- Sawaal 8: Har saal total EV registrations kitni hui?
-- registration_year ke hisaab se data group hota hai.
SELECT registration_year,
       SUM(registration_count) AS Total_Registrations
FROM registration
GROUP BY registration_year;

-- Sawaal 9: Kis year me sabse zyada registrations hui?
-- ORDER BY DESC sabse bade number ko upar laata hai.
-- LIMIT 1 sirf top wala result dikhata hai.
SELECT registration_year,
       SUM(registration_count) AS Total_Registrations
FROM registration
GROUP BY registration_year
ORDER BY Total_Registrations DESC
LIMIT 1;

-- Sawaal 10: Kis year me sabse kam registrations hui?
-- ORDER BY chhote number se bade number tak sort karta hai.
-- LIMIT 1 sabse chhota result dikhata hai.
SELECT registration_year,
       SUM(registration_count) AS Total_Registrations
FROM registration
GROUP BY registration_year
ORDER BY Total_Registrations
LIMIT 1;

-- Sawaal 11: Kaunsa manufacturer_id sabse zyada registrations wala hai?
-- Pehle har manufacturer ka total nikalta hai, phir sabse bada choose karta hai.
SELECT manufacturer_id,
       SUM(registration_count) AS Total_Registrations
FROM registration
GROUP BY manufacturer_id
ORDER BY Total_Registrations DESC
LIMIT 1;

-- Sawaal 12: Kaunsi category_id me sabse zyada registrations hain?
-- DESC se sabse bada total sabse upar aata hai.
SELECT category_id,
       SUM(registration_count) AS Total_Registrations
FROM registration
GROUP BY category_id
ORDER BY Total_Registrations DESC
LIMIT 1;

-- Sawaal 13: Top 5 manufacturer_ids kaun se hain?
-- Top 5 matlab registrations ke hisaab se sabse aage wale 5.
SELECT manufacturer_id,
       SUM(registration_count) AS Total_Registrations
FROM registration
GROUP BY manufacturer_id
ORDER BY Total_Registrations DESC
LIMIT 5;

-- Sawaal 14: Bottom 5 manufacturer_ids kaun se hain?
-- Bottom 5 matlab registrations ke hisaab se sabse kam wale 5.
SELECT manufacturer_id,
       SUM(registration_count) AS Total_Registrations
FROM registration
GROUP BY manufacturer_id
ORDER BY Total_Registrations
LIMIT 5;

-- Sawaal 15: Har year me average registrations kitni hain?
-- AVG average yani normal beech ka number nikalta hai.
SELECT registration_year,
       AVG(registration_count) AS Average_Registrations
FROM registration
GROUP BY registration_year;

-- Sawaal 16: Ek row me sabse zyada registrations kitni record hui?
-- MAX sabse bada registration_count dikhata hai.
SELECT MAX(registration_count) AS Max_Registrations
FROM registration;

-- Sawaal 17: Ek row me sabse kam registrations kitni record hui?
-- MIN sabse chhota registration_count dikhata hai.
SELECT MIN(registration_count) AS Min_Registrations
FROM registration;

-- Sawaal 18: Sirf woh records dikhao jahan registrations 10,000 se zyada hain.
-- WHERE condition lagata hai, jaise filter.
SELECT registration_count
FROM registration
WHERE registration_count > 10000;

-- Sawaal 19: Sirf 2019 se 2022 tak ke records dikhao.
-- BETWEEN start aur end year ke beech ka data laata hai.
SELECT *
FROM registration
WHERE registration_year BETWEEN 2019 AND 2022;

-- Sawaal 20: Har vehicle class ke total registrations dikhao.
-- Isse pata chalega kis type ki vehicle class me kitni registrations hui.
SELECT vehicle_class,
       SUM(registration_count) AS Total_Registrations
FROM registration
GROUP BY vehicle_class;