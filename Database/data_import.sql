-- Is database ko use karo jisme EV ka data rakha hai.
use ev_analytics;






-- manufacturer.csv file se company ka data manufacturer table me daalo.
-- Yeh file MySQL ke Uploads folder me rakhi hai.
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/manufacturer.csv'
INTO TABLE manufacturer
-- CSV file me har value comma se alag hoti hai.
FIELDS TERMINATED BY ','
-- Agar koi value double quotes me ho, to MySQL usko sahi se padhega.
ENCLOSED BY '"'
-- Har nayi line ek naya record hota hai.
LINES TERMINATED BY '\n'
-- Pehli row me column names hote hain, isliye usko skip karo.
IGNORE 1 ROWS
-- CSV ke columns ko table ke columns se match karo.
(manufacturer_id, manufacturer, place, state);



-- sales.csv file se sales ka data sales table me daalo.
-- Isme kis company ne kis category ki kitni gaadiyan bechi, yeh data aata hai.
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/sales.csv'
INTO TABLE sales
-- CSV file me har value comma se alag hoti hai.
FIELDS TERMINATED BY ','
-- Agar koi value double quotes me ho, to MySQL usko sahi se padhega.
ENCLOSED BY '"'
-- Har nayi line ek naya record hota hai.
LINES TERMINATED BY '\n'
-- Pehli row me column names hote hain, isliye usko skip karo.
IGNORE 1 ROWS;


-- category.csv file se category ka data category table me daalo.
-- Jaise car, bike, bus type groups ka data.
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/category.csv'
INTO TABLE category
-- CSV file me har value comma se alag hoti hai.
FIELDS TERMINATED BY ','
-- Agar koi value double quotes me ho, to MySQL usko sahi se padhega.
ENCLOSED BY '"'
-- Har nayi line ek naya record hota hai.
LINES TERMINATED BY '\n'
-- Pehli row me column names hote hain, isliye usko skip karo.
IGNORE 1 ROWS;
