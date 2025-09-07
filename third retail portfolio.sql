create table Retail_sale(
       transaction_id  int primary key,
       sale_date date,
	   sale_time time,
       customer_id int,
       age int,
       gender varchar(9),
       category varchar(15),
	   quantity int,
	   price int,
       price_per_unit float,
       cogs float,
        retail_saletotal_sale float);
        
              
        select *from retail_sale;
        where 
        transaction_id is null
        or sale_date is null
        or sale_time is null
        or gender is  null; 
-- write query to see all the transcations on 2022-11-05	
select *
from retail_sale
where sale_date = '2022-11-05';

-- write a query to see retrive all the category where transactions is clothing and the quantity sold is more than 10 in nov 2022
select category,sum(quantity)as total_sale
from retail_sale
where category = 'clothing'
and
date_format(sale_date,'%y-%m') = '2022-11'
and
quantity = 3;

-- write a query to calc total_sale(total_sale) for each category
select category,
SUM(total_sale) as total,
count(*) as total_foreach
from retail_sale
group by 1;

-- write a query to find the average age of customers who purchased from the beauty category
select
avg(age)
from retail_sale
where category ='beauty';

-- write a query to find all transactions where total_sale  is > 1000
    select 
    total_sale as total
    from retail_sale
        where total_sale > 1000;

    -- write a query to find the total number of transactions(transaction_id) made by each gender in each category
    
    select category,
    gender,
    count(*) as total_trans
    from retail_sale
    group by category,gender
    order by 1;
    
-- write a query to calc the average sale for each month and find the best selling month in each year
select 
year(sale_date),
month(sale_date),
sum(total_sale) as total_sale
from retail_sale
group by 1,2;

-- write a query to see the number of unique customers who purchased items in each category
    
    select category,
    sum(distinct customer_id) as uniquecustomer
    from retail_sale
    group by category;
    
    -- write query to see top 5 customers based on total_sales
    select customer_id,
    sum(total_sale) as total
    from retail_sale
    group by 1
    order by 2 desc
    limit 5;
    
    -- write a query to create each shift and number of others( example <= morning,afternoon btw 12 and 17,evening >17)
    with hourly
    as(
    select *,
    case
    when hour(sale_time)  < 12 then 'morning'
    when hour(sale_time) between 12 and  17 then 'afternoon'
    else 'evening'
    end as shift
    from retail_sale)
    select shift,
    count(*) as total_orders
    from hourly
    group by shift
    
    -- end of project
    
    
    
    
    
    
    
    
    
    
    

    
    


