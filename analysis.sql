/* Sales.*/

#Sales&Profits trend over years
select year(order_date)as years, cast( sum(sales)as dec(10,2))as Total_sales, cast( sum(profit)as dec(10,2))as profits
from orders
group by years
order by years
;

#Months sales trend over years.
SELECT 
    YEAR(order_date) AS years, 
    MONTH(order_date) AS month_number, 
    MONTHNAME(order_date) AS month_name, 
    CAST(SUM(sales) AS DECIMAL(10,2)) AS total_sales, 
    CAST(SUM(profit) AS DECIMAL(10,2)) AS total_profit
FROM orders
GROUP BY years, month_number, month_name
ORDER BY years, month_number;



/* Customer insights. */

#Best 5% customers.
SELECT 
    customer_id,
    COUNT(DISTINCT order_id),
    CAST(SUM(sales) AS DEC (10 , 2 )) sales
FROM
    orders
GROUP BY customer_id
ORDER BY sales DESC
LIMIT 40
;


#Top customers purchases.
select product_id, category, sub_category, sales, profit
from orders
where customer_id in(

		select customer_id 
			from (
						select customer_id, cast(sum(sales) as dec(10,2))sales
						from orders
						group by customer_id
						order by sales desc
						limit 40)as top);
                        


/* Products.*/

#Products performance.
select product_id, category, sub_category, sum(sales) Sales, sum(profit) Profits
from orders
group by product_id, category, sub_category
order by profits desc ;                      
  
  
  
/* Pricing.*/
					
#Find why july 2014 and jan 2015 has negative profit.
	select sales, profit, discount, sub_category, month(order_date)month, year(order_date)yr
     from orders
	where month(order_date) in ( 7, 1)
	;
                        
#Find the relation between discounts and sales. */
    select count(order_id), discount
    from orders
		group by discount;
        

