-- Is database ko use karo jisme EV ka data rakha hai.
use ev_analytics;

-- Yeh table EV banane wali companies ki list rakhti hai.
-- manufacturer_id har company ka unique roll number jaisa hai.
-- manufacturer me company ka naam aata hai.
-- place aur state batate hain company kahan se hai.
create table manufacturer(manufacturer_id int,manufacturer varchar(40),place varchar(50),
state varchar(50));


-- Yeh table gaadi ki category rakhti hai.
-- Jaise scooter, car, bus, ya bike type groups.
-- category_id har category ka unique number hai.
create table category(category_id int, category VARCHAR (50));

-- Yeh table batati hai kis company ne kis type ki kitni EV bechi.
-- sales_id har sales record ka unique number hai.
-- manufacturer_id batata hai sale kis company ki hai.
-- category_id batata hai gaadi kis category ki hai.
-- vehicle_class gaadi ka class/type batata hai.
-- sales_year batata hai sale kis saal ki hai.
-- sales_count batata hai kitni gaadiyan bechi gayi.
-- created_at batata hai yeh record kab banaya gaya.
create table sales(
    sales_id int,manufacturer_id int,
    category_id int,vehicle_class varchar(50),
    sales_year date,sales_count decimal(10,2),
    created_at datetime
    );


-- Manufacturer table me manufacturer_id ko main unique key banao.
-- Isse do companies ka same id nahi ho sakta.
alter table manufacturer add CONSTRAINT pk_manufacturer primary key(manufacturer_id);

-- Category table me category_id ko main unique key banao.
-- Isse do categories ka same id nahi ho sakta.
alter table category add constraint pk_category primary key(category_id);

-- Sales table me sales_id ko main unique key banao.
-- Isse har sales record alag pehchana ja sakta hai.
alter table sales add constraint pk_sales PRIMARY KEY (sales_id);

-- Sales table ko manufacturer table se jodo.
-- Matlab sales me jo manufacturer_id hai, woh manufacturer table me hona chahiye.
ALTER TABLE sales
ADD CONSTRAINT fk_sales_manufacturer
FOREIGN KEY (manufacturer_id)
REFERENCES manufacturer(manufacturer_id);

-- Sales table ko category table se jodo.
-- Matlab sales me jo category_id hai, woh category table me hona chahiye.
alter table sales 
add constraint fk_sales_category
Foreign Key (category_id) REFERENCES category (category_id);

-- sales_year ko number type bana do, kyunki sirf year store karna hai.
-- Example: 2020, 2021, 2022.
ALTER TABLE sales
modify sales_year SMALLINT;

-- sales_count ko integer bana do, kyunki gaadiyon ki count whole number hoti hai.
-- Example: 10 gaadiyan, 25 gaadiyan; 10.5 gaadi nahi hoti.
ALTER TABLE sales
modify sales_count int;




