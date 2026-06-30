-- Use the database that stores EV data.
use ev_analytics;






-- Load company data from manufacturer.csv into the manufacturer table.
-- This file is stored in the MySQL Uploads folder.
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/manufacturer.csv'
INTO TABLE manufacturer
-- In a CSV file, each value is separated by a comma.
FIELDS TERMINATED BY ','
-- If a value is inside double quotes, MySQL will read it correctly.
ENCLOSED BY '"'
-- Each new line is one new record.
LINES TERMINATED BY '\n'
-- Skip the first row because it contains column names.
IGNORE 1 ROWS
-- Match the CSV columns with the table columns.
(manufacturer_id, manufacturer, place, state);



-- Load sales data from sales.csv into the sales table.
-- This data tells which company sold how many vehicles in each category.
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/sales.csv'
INTO TABLE sales
-- In a CSV file, each value is separated by a comma.
FIELDS TERMINATED BY ','
-- If a value is inside double quotes, MySQL will read it correctly.
ENCLOSED BY '"'
-- Each new line is one new record.
LINES TERMINATED BY '\n'
-- Skip the first row because it contains column names.
IGNORE 1 ROWS;


-- Load category data from category.csv into the category table.
-- This file has groups like car, bike, and bus.
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/category.csv'
INTO TABLE category
-- In a CSV file, each value is separated by a comma.
FIELDS TERMINATED BY ','
-- If a value is inside double quotes, MySQL will read it correctly.
ENCLOSED BY '"'
-- Each new line is one new record.
LINES TERMINATED BY '\n'
-- Skip the first row because it contains column names.
IGNORE 1 ROWS;
