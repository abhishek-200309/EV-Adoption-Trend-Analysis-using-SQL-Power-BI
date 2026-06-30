-- Use the database that stores EV data.
use ev_analytics;

-- This table stores the list of EV manufacturers.
-- manufacturer_id is a unique number for each company.
-- manufacturer stores the company name.
-- place and state tell where the company is located.
create table manufacturer(manufacturer_id int,manufacturer varchar(40),place varchar(50),
state varchar(50));


-- This table stores vehicle categories.
-- Examples: scooter, car, bus, or bike groups.
-- category_id is a unique number for each category.
create table category(category_id int, category VARCHAR (50));

-- This table stores EV sales data.
-- sales_id is a unique number for each sales record.
-- manufacturer_id tells which company the sale belongs to.
-- category_id tells which category the vehicle belongs to.
-- vehicle_class tells the type or class of the vehicle.
-- sales_year tells the year of the sale.
-- sales_count tells how many vehicles were sold.
-- created_at tells when this record was created.
create table sales(
    sales_id int,manufacturer_id int,
    category_id int,vehicle_class varchar(50),
    sales_year date,sales_count decimal(10,2),
    created_at datetime
    );


-- Make manufacturer_id the main unique key in the manufacturer table.
-- This means two companies cannot have the same id.
alter table manufacturer add CONSTRAINT pk_manufacturer primary key(manufacturer_id);

-- Make category_id the main unique key in the category table.
-- This means two categories cannot have the same id.
alter table category add constraint pk_category primary key(category_id);

-- Make sales_id the main unique key in the sales table.
-- This helps identify each sales record separately.
alter table sales add constraint pk_sales PRIMARY KEY (sales_id);

-- Connect the sales table with the manufacturer table.
-- The manufacturer_id in sales must exist in the manufacturer table.
ALTER TABLE sales
ADD CONSTRAINT fk_sales_manufacturer
FOREIGN KEY (manufacturer_id)
REFERENCES manufacturer(manufacturer_id);

-- Connect the sales table with the category table.
-- The category_id in sales must exist in the category table.
alter table sales 
add constraint fk_sales_category
Foreign Key (category_id) REFERENCES category (category_id);

-- Change sales_year to a number type because we only store the year.
-- Example: 2020, 2021, 2022.
ALTER TABLE sales
modify sales_year SMALLINT;

-- Change sales_count to an integer because vehicle count is a whole number.
-- Example: 10 vehicles or 25 vehicles, not 10.5 vehicles.
ALTER TABLE sales
modify sales_count int;




