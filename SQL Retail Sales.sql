create database retail_sales;

-- data cleaning --
select*
from retail_sales_data;

alter table retail_sales_data
change column ï»¿transactions_id transaction_id int null;

alter table retail_sales_data
change column quantiy quantity int null;

alter table retail_sales_data
modify column sale_date date;

alter table retail_sales_data
modify column sale_time time;

describe retail_sales_data;

select*
from retail_sales_data;

select*
from retail_sales_data
where transaction_id is null;

select*
from retail_sales_data
where transaction_id is null or
sale_date is null or
sale_time is null or
customer_id is null or
gender is null or
age is null or
category is null or
quantity is null or
price_per_unit is null or
cogs is null or
total_sale is null;

select*
from retail_sales_data;

-- how many sales were there? -- 
select count(*)
from retail_sales_data;

-- how many unique customers were there? --
select count(distinct customer_id)
from retail_sales_data;

-- how many sales were made on 2022-11-05? -- 
select count(sale_date)
from retail_sales_data
where sale_date = '2022-11-05';

select *
from retail_sales_data
where sale_date = '2022-11-05';

-- retrieve all transaction where category is "Clothing" and the quantity sold is more than 3 in the month of nov-2022 --
select*
from retail_sales_data
where category = 'Clothing' and
quantity >= 3 and
sale_date between '2022-11-01' and '2022-11-30';

-- what is the net sale for each category --
select sum(total_sale) as net_sales, category, count(category) as total_orders
from retail_sales_data
group by category;

-- What is the average age of customers who purchased Beauty products
select round(avg(age),2) as Avg_Age_Order_Beauty, count(age)
from retail_sales_data
where category = 'Beauty';

-- Transaction where total_sale is greater than 1000 --
select*
from retail_sales_data
where total_sale > 1000;

-- total number of transaction made by each gender in each category --
select category, gender, count(*) as total_transactions
from retail_sales_data
group by category, gender
order by category;

-- average sale for each month and find the best selling month -- 
select
    date_format(sale_date, '%Y-%m') as month,
    round(avg(quantity),2) as average_sale
from
    retail_sales_data
group by
    DATE_FORMAT(sale_date, '%Y-%m')
order by
    month;

select
    date_format(sale_date, '%Y-%m') as month,
    sum(quantity) as total_sales
from
    retail_sales_data
group by
    date_format(sale_date, '%Y-%m')
order by
    total_sales desc;

select
    date_format(sale_date, '%Y-%m') as month,
    round(avg(quantity),2) as average_sale,
     sum(quantity) as total_sales
from
    retail_sales_data
group by
    DATE_FORMAT(sale_date, '%Y-%m')
order by
    total_sales desc;
    
-- find the top 5 customers based on the highest total sales --
select customer_id, sum(total_sale) as total_sales
from retail_sales_data
group by customer_id
order by customer_id desc
limit 5;

-- find the number of unique customers who purchased items from each category --
select category, count(distinct customer_id) as count_unique_customer
from retail_sales_data
group by category;

-- find the number of orders by shift --
SELECT
    CASE
        WHEN HOUR(sale_time) < 12 THEN 'Morning'
        WHEN HOUR(sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END AS shift,
    COUNT(*) AS number_of_orders
FROM
    retail_sales_data
GROUP BY
    shift;
    
select*
from retail_sales_data;


