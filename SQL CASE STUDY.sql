create database dik;
use dik;

CREATE TABLE restaurants(
restaurant_id  INT Primary Key,
 restaurant_name VARCHAR (60),
cuisine_type VARCHAR (70),
 address VARCHAR(70),
phone INT);

INSERT INTO Restaurants (restaurant_id, restaurant_name, cuisine_type, address, phone)
VALUES
(1, 'Pasta Palace', 'Italian', '123 Main St, City, State',
555-123-4567),
(2, 'Taco Time', 'Mexican', '456 Elm St, City, State',
555-987-6543),
(3, 'Burger Barn', 'American', '789 Oak St, City, State',
555-789-1234);



CREATE TABLE MENUITEMS(
item_id INT Primary Key,
restaurant_id INT,
item_name VARCHAR(60),
description VARCHAR (90),
price FLOAT,
Foreign Key (restaurant_id) references restaurants  (restaurant_id));

INSERT INTO MenuItems (item_id, restaurant_id, item_name, description,
price)
VALUES
(101, 1, 'Spaghetti Carbonara', 'Pasta with eggs, cheese, pancetta,and black pepper', 12.99),
(102, 1, 'Margherita Pizza', 'Classic pizza with tomato,mozzarella, and basil', 14.99),
(103, 2, 'Taco Combo', 'Assorted tacos with sides', 9.99),
(104, 2, 'Quesadilla', 'Cheese-filled tortilla with meat orvegetables', 8.99),
(105, 3, 'Classic Burger', 'Beef patty with lettuce, tomato, onion,and pickles', 10.99);


CREATE TABLE ORDERS(
order_id INT Primary Key,
item_id INT,
customer_name VARCHAR(60),
 delivery_address VARCHAR(80),
 order_date DATE,
 Total_amount FLOAT,
Foreign Key (item_id)references MenuItems(item_id));



INSERT INTO Orders (order_id, item_id, customer_name, delivery_address,
order_date, total_amount)
VALUES
(201, 101, 'John Doe', '123 Main St, City, State', '2024-04-15',12.99),
(202, 103, 'Jane Smith', '456 Elm St, City, State', '2024-04-16',9.99),
(203, 105, 'Alice Johnson', '789 Oak St, City, State',
'2024-04-17', 10.99),
(204, 101, 'John Doe', '123 Main St, City, State', '2024-04-18',
12.99),
(205, 104, 'Jane Smith', '456 Elm St, City, State', '2024-04-19',
8.99);

select *from  Restaurants;
select * from menuitems;
select * from orders;

-- 1. Retrieve all restaurants offering Italian cuisine.
select * from Restaurants    
where cuisine_type ='italian';

-- 2. List all menu items with prices for a specific restaurant.
 select item_name ,price 
 from menuitems
 where restaurant_id=1;
 
-- 3. Calculate the total revenue generated from orders placed in the last month. 
select sum(total_amount) as revenu
from orders
where order_id>=date_sub(curdate(),interval 1 month);
set sql_safe_updates=0;

-- 4. Update the description of a specific menu item. 
update menuitems
set description = ' vada pav	'
where item_id =1;

-- 5.Identify the top-selling menu items based on the number of orders. 
select item_name, count(order_id) as total_re
from orders 
join menuitems on orders.order_id = menuitems.item_id
group by item_name
order by total_re desc limit 3;





-- 6. Retrieve the list of orders delivered to a specific address. 
select * from orders
where delivery_address= 
 '123 Main St, City, State';


-- 7. Find the restaurant with the highest total revenue. 
select Restaurants.restaurant_name ,sum(orders.total_amount) as total_reveun
from orders
join menuitems on orders.item_id= menuitems.item_id
join Restaurants on menuitems.restaurant_id = Restaurants.restaurant_id
group by Restaurants.restaurant_name
order by total_reveun desc
limit 2;

-- 8. List the average order amount for each restaurant. 
select Restaurants.restaurant_name,avg(orders.total_amount) as avg_total
from orders
join menuitems  on orders.item_id= menuitems.item_id
join Restaurants on menuitems.restaurant_id = Restaurants.restaurant_id
group by Restaurants.restaurant_name
;

-- 9.Retrieve the total number of orders placed by each customer 
select customer_name,count(order_id) as total_or
from  orders
group by customer_name;

-- 10. Calculate the average price of menu items for each cuisine type.
select restaurants.cuisine_type,avg(menuitems.price) as avg_price
from menuitems
join Restaurants on menuitems.Restaurant_id = Restaurants.Restaurant_id
group by restaurants.cuisine_type;



select * from  Restaurants;
select * from menuitems;
select * from orders;


