
--------------------Question 1--------------------
alter view sales_info 
as
select po.product_name,oo.order_status,si.list_price from sales.orders oo inner join sales.order_items si on oo.order_id=si.order_id inner join production.products po on po.product_id=si.product_id;
select * from sales_info

--------------------Question 2--------------------

create view staff_sales

as

select ss.first_name,ss.last_name,sum(quantity*list_price) as 'ORDER VALUE' 
from sales.order_items si inner join   sales.orders oo on si.order_id=oo.order_id inner join sales.staffs ss on oo.staff_id=ss.staff_id
group by ss.first_name,ss.last_name;

select * from staff_sales

--------------------------------Question 3------------------------------------
alter procedure usp_add_store 
@store_count int output,
@store_name varchar(255),
@phone varchar(255),
@email varchar(255),
@street varchar(255),
@city varchar(255),
@state varchar(10),
@zip_code varchar(5)
as 

begin

insert into sales.stores values(@store_name,@phone,@email,@street,@city,@state,@zip_code)
select @store_count=count(*) from sales.stores
end;
declare @count int;
exec usp_add_store 
 @store_name='Zensar',
 @phone='789685',
 @email='zensar@gmai.com',
 @street='kharadi bypass',
 @city='pune',
 @state='maharashtra',
 @zip_code='7486',
 @store_count =@count output
 select @count as 'Store Count'

 select * from sales.stores


 --------------------------------Question 4------------------------------------

alter procedure usp_wise_sales
as
begin 
select ss.store_id,ss.store_name,ss.city,COUNT(so.order_id)as 'count sales'  
from sales.stores ss inner join sales.orders so on so.store_id=ss.store_id
group by ss.store_id,ss.store_name,ss.city
end

usp_wise_sales




--------------------------------Question 5------------------------------------
create function ud_avg_qty(
@year int,
@cust_id int

)
returns decimal(10,2)
as
begin 

DECLARE @sum1 decimal(10,2);  
select @sum1= sum(quantity*list_price) from sales.order_items where order_id in 
 (select order_id from sales.orders where customer_id=@cust_id and year(order_date)=@year)
 return @sum1
 end;

 select dbo.ud_avg_qty(2016,259) as 'Order Sum'