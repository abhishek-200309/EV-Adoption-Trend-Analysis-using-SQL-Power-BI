use ev_analytics;

select count(*) from manufacturer;
select count(*) from category;
select count(*) from sales;


select * from sales limit 5;
select * from manufacturer limit 5;
select * from category limit 5;


SELECT *
FROM sales
WHERE manufacturer_id IS NULL
   OR category_id IS NULL
   OR sales_year IS NULL
   OR sales_count IS NULL;


SELECT sales_id, COUNT(*)
FROM sales
GROUP BY sales_id
HAVING COUNT(*) > 1;