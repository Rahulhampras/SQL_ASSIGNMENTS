----Question 1----
select first_name from sales.customers order by first_name desc

----Question 2----
select first_name,last_name,city from sales.customers order by city,first_name


----Question 3----
select top(3) product_name,list_price from production.products order by list_price desc 

----Question 4----

select product_name,list_price from production.products where list_price>300 and model_year=2018

----Question 5----

select product_name,list_price from production.products where list_price>3000 or model_year=2018

----Question 6----
select product_name,list_price from production.products where list_price between 1899 and 1999.99

----Question 7 ----
select product_name,list_price from production.products where list_price in(299.99,466.99,489.99)

----Question 8 ----
select first_name from sales.customers where last_name like '[abc]%'

----Question 9 ----
select first_name from sales.customers where first_name not like 'A%'

----Question 10 ----
select city,state, count(customer_id) as 'customer count' from  sales.customers 
group by city,state

----Question 11 ----

select count(order_id) as'number of orders' from sales.orders group by customer_id,year(order_date)

----Question 12 ----

select category_id ,max(list_price) as'Max of list price' ,min(list_price) as 'Min of list price'
from production.products
group by category_id
having max(list_price)>4000 or min(list_price)<500