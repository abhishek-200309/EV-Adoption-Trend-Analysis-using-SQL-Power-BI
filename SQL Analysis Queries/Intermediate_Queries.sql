-- Intermediate SQL (Project-Specific)
-- Is file me thode advanced sawaal solve kiye gaye hain.
-- Yahan hum tables ko JOIN karte hain aur grouped data se answers nikalte hain.

USE ev_analytics;

-- Sawaal 1: Har manufacturer ka total registration dikhao.
-- Manufacturer table se company ka naam aata hai.
-- Registration table se us company ki registrations add hoti hain.
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

-- Sawaal 2: Har category ka total registration dikhao.
-- Category table se category name aata hai.
-- Registration table se us category ki registrations add hoti hain.
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

-- Sawaal 3: Manufacturer aur category dono ke hisaab se total registrations dikhao.
-- Isse pata chalta hai kis company ne kis category me kitni registrations ki.
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

-- Sawaal 4: Un manufacturers ko dikhao jinka total registration overall average se zyada hai.
-- Pehle har manufacturer ka total registration nikalte hain.
-- Phir un totals ka average nikalte hain.
-- Sirf wahi manufacturers dikhate hain jinka total average se zyada hai.
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

-- Sawaal 5: Har manufacturer ke year-wise registrations dikhao.
-- Matlab har company ne har saal kitni EV registrations ki.
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

-- Sawaal 6: Har category ke year-wise registrations dikhao.
-- Matlab har saal me har category ki kitni registrations hui.
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

-- Sawaal 7: Har vehicle class ka total registration dikhao.
-- Isse top vehicle class identify karne me help milti hai.
SELECT
    vehicle_class,
    SUM(registration_count) AS Total_Registrations
FROM registration
GROUP BY
    vehicle_class;

-- Sawaal 8: Aise manufacturers dikhao jinke registrations har year me hain.
-- COUNT DISTINCT years batata hai company kitne alag years me present hai.
-- Agar yeh total years ke barabar hai, matlab company har year me hai.
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

-- Sawaal 9: Aise manufacturers dikhao jinke paas sirf ek vehicle class hai.
-- DISTINCT vehicle_class count 1 hai to matlab sirf ek type ki vehicle class hai.
SELECT
    m.manufacturer
FROM manufacturer AS m
JOIN registration AS r
    ON m.manufacturer_id = r.manufacturer_id
GROUP BY
    m.manufacturer
HAVING
    COUNT(DISTINCT r.vehicle_class) = 1;

-- Sawaal 10: Registrations ko Low, Medium, High jaise groups me divide karo.
-- CASE condition ke hisaab se label banata hai.
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

-- Sawaal 11: Aise manufacturers dikhao jinke paas ek se zyada categories hain.
-- COUNT DISTINCT category_id batata hai company kitni categories me hai.
SELECT
    m.manufacturer,
    COUNT(DISTINCT r.category_id) AS Category_Count
FROM manufacturer AS m
JOIN registration AS r
    ON m.manufacturer_id = r.manufacturer_id
GROUP BY
    m.manufacturer
HAVING
    COUNT(r.category_id) > 1;

-- Sawaal 12: Har manufacturer ka average registration dikhao.
-- AVG average value nikalta hai.
SELECT
    m.manufacturer,
    AVG(r.registration_count) AS Average_Count
FROM manufacturer AS m
JOIN registration AS r
    ON m.manufacturer_id = r.manufacturer_id
GROUP BY
    m.manufacturer;

-- Sawaal 13: Har state ka total registration dikhao.
-- Manufacturer table se state milti hai, registration table se count milta hai.
SELECT
    m.state,
    SUM(r.registration_count) AS Total_Registrations
FROM manufacturer AS m
JOIN registration AS r
    ON m.manufacturer_id = r.manufacturer_id
GROUP BY
    m.state;

-- Sawaal 14: Har place ka total registration dikhao.
-- Place ke hisaab se registrations ko group karke total nikalte hain.
SELECT
    m.place,
    SUM(r.registration_count) AS Total_Registrations
FROM manufacturer AS m
JOIN registration AS r
    ON m.manufacturer_id = r.manufacturer_id
GROUP BY
    m.place;

-- Sawaal 15: Aise manufacturers dikhao jinke total registrations 50,000 se zyada hain.
-- HAVING grouped total par condition lagata hai.
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

-- Sawaal 16: Aisi categories dikhao jinka total registration 10,000 se zyada hai.
-- Note: Query AVG dikhati hai, lekin HAVING me total SUM check ho raha hai.
SELECT
    c.category,
    AVG(r.registration_count) AS Average_Registrations
FROM category AS c
JOIN registration AS r
    ON c.category_id = r.category_id
GROUP BY
    c.category
HAVING
    SUM(r.registration_count) > 10000;

-- Sawaal 17: Kis year me average registrations sabse zyada hain?
-- DESC sabse bade average ko upar laata hai.
-- LIMIT 1 sirf highest year dikhata hai.
SELECT
    registration_year,
    AVG(registration_count) AS Average_Registrations
FROM registration
GROUP BY
    registration_year
ORDER BY
    Average_Registrations DESC
LIMIT 1;

-- Sawaal 18: Aise manufacturers dikhao jinka naam T se start hota hai.
-- LIKE 'T%' ka matlab naam T se shuru ho aur aage kuch bhi ho sakta hai.
SELECT
    manufacturer
FROM manufacturer
WHERE
    manufacturer LIKE 'T%';

-- Sawaal 19: Manufacturers ko total registrations ke hisaab se sort karke dikhao.
-- Pehle total niklega, phir ORDER BY se sorting hogi.
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

-- Sawaal 20: Top 3 states dikhao jahan registrations sabse zyada hain.
-- DESC highest registrations ko upar laata hai.
-- LIMIT 3 sirf top 3 states dikhata hai.
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
