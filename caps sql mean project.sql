create database capstone;
alter table capstone.brands modify brand_name varchar(100);
alter table capstone.categories modify Category_Name varchar(100);
alter table capstone.customers modify First_Name varchar(100),

modify Last_Name varchar(100),
modify Phone varchar(100),
modify Email varchar(100),
modify Street varchar(100),
modify City varchar(100),
modify State varchar(100);

alter table capstone.products modify Product_Name varchar(100);
alter table capstone.staffs modify First_Name varchar(100),
modify Last_Name varchar(100),
modify Email varchar(100),
modify Manager_ID varchar(100);

alter table capstone.stores modify Store_Name varchar(100),
modify Phone varchar(100),
modify Email varchar(100),
modify Email varchar(100),
modify Street varchar(100),
modify City varchar(100),
modify State varchar(100);

create database capstone;
create table capstone.brands (Brand_id int primary key, Brand_name varchar(100));
create table capstone.categories (Category_id int primary key, category_name varchar(100));
create table capstone.customers (customer_id int primary key, First_name varchar(100), Last_name varchar(100),
Email varchar(100), street varchar(100), city varchar(100), state varchar(100), zip_code int);
create table capstone.order_items (order_id int,item_id int, product_id int, quantity int, list_price double, nt double, total_price double);
create table capstone.orders (order_id int Primary key, customer_id int, order_status text, order_date text,
ed_date text, shipped_date text, store_id int, staff_id int);
create table
capstone.products (Product_id int Primary key, Product_name varchar(100), Brand_id int, Category_id int, ear int, List_price double);
create table capstone.staffs (Staff_id int Primary key, first_name varchar(100), last_name varchar(100),
Email varchar(100), Active int, Store_id int, manager_id varchar(100));
create table capstone.stocks (Store_id int, Product_id int, Quantity int);
create table capstone.stores (Store_id int primary key, store_name varchar(100), phone varchar(100),
Email varchar(100), City varchar(100), state varchar(100), Zip_code int);

--- 3.
select*from capstone.orders as o
inner join capstone.order_items as i
on o.order_id=i.order_id
inner join capstone.products as p
on p.Product_ID=i.Product_ID;

--- 4
select sum(i.Total_Price) as total_sales, s.store_id from capstone.order_items as i
 join capstone.orders as o
on o.Order_ID=i.Order_id 
join capstone.stores as s 
on s.store_id=o.store_ID
group by s.store_id;

--- 5

select sum(i.quantity) as quantitiy, p.product_name
from capstone.order_items as i
inner join capstone.products as p
on i.product_id = p.product_id
group by p.product_name
order by quantity desc limit 5;

--- 6
select o. Customer_id,count(i.order_id) as Total_orders, sum(i.Total_Price) as Total_revenue
From capstone.orders as o
join capstone.order_items as i
on i.order_id =o.order_id
group by o.Customer_ID
order by Total_orders, Total_revenue;

--- 7

select o.customer_id,sum(i.Total_Price) as Total_spending,
case
when sum(i.Total_Price) < 10000 then "Low"
when sum(i.Total_Price) between 10000 and 15000 then "Medium"
else "High"
end as spending_segment
from capstone.orders as o
join capstone.order_items as i
on o.order_id =i.order_id
group by o.customer_id;
--- 8

select s.staff_id, round(sum(i.Total_Price), 2) as Total_revenue
from capstone.orders as o
join capstone.staffs as s
on s.staff_id=o.staff_id
join capstone.order_items as i
on i.order_id = o.order_id
group by s.staff_id;

--- 9 

select sr.store_id,p.Product_id,p.Product_Name,s.Quantity
from capstone.stores as sr
join capstone.stocks as s
on s.store_id = sr.store_id
join capstone.products as p
on p.Product_id = s.Product_id
where s.quantity < 10;


alter table capstone.order_items change order_ID order_id INT;

--- 10

create table capstone.customer_segment(customer_id int,recency int,frequancy int,monetary decimal(12,2));

alter table capstone.customer_segment
change monetary_values monetary decimal(12,2);

select*from capstone.customer_segment;