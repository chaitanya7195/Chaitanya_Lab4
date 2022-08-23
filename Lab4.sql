-- Q.1 Creating a database and inserting tables into it

drop database if exists company_db;
create database company_db;

use company_db;

# supplier table
-- drop table if exists supplier; 
create table supplier (
	supp_id int primary key,
    supp_name varchar(50) not null,
    supp_city varchar(50) not null,
    supp_phone varchar(50) not null
);

# customer table
-- drop table if exists customer;
create table customer (
	cus_id int primary key,
    cus_name varchar(20) not null,
    cus_phone varchar(10) not null,
    cus_city varchar(30) not null,
    cus_gender char
);

# category table
-- drop table if exists category;
create table category (
	cat_id int primary key,
    cat_name varchar(20) not null
);

# product table
-- drop table if exists product;
create table product (
	pro_id int primary key,
    pro_name varchar(20) not null default "Dummy",
    pro_desc varchar(60),
    cat_id int,
    foreign key (cat_id) references category(cat_id)
);

# supplier_pricing table
-- drop table if exists supplier_pricing;
create table supplier_pricing(
	pricing_id int primary key,
    pro_id int,
    supp_id int,
    supp_price int default 0,
    foreign key (pro_id) references product(pro_id),
    foreign key (supp_id) references supplier(supp_id)
);

# order table
-- drop table if exists `order`;
create table `order`(
	ord_id int primary key,
    ord_amount int not null,
    ord_date date not null,
    cus_id int,
    pricing_id int,
    foreign key (cus_id) references customer(cus_id),
    foreign key (pricing_id) references supplier_pricing(pricing_id)
);

# rating table
-- drop table if exists rating;
create table rating(
	rat_id int primary key,
    ord_id int,
    rat_ratstars int not null,
    foreign key (ord_id) references `order`(ord_id)
);

-- -----------------------------------

-- Q. 2. Inserting Data into Tables

insert into supplier values (1, 'Rajesh Retails', 'Delhi',    '1234567890');
insert into supplier values (2, 'Appario Ltd.',   'Mumbai',   '2589631470');
insert into supplier values (3, 'Knome products', 'Banglore', '9785462315');
insert into supplier values (4, 'Bansal Retails', 'Kochi',    '8975463285');
insert into supplier values (5, 'Mittal Ltd.',    'Lucknow',  '7898456532');

select * from supplier;

-- ----------------------------------

insert into customer values(1, 'AAKASH', '9999999999', 'DELHI',   'M');
insert into customer values(2, 'AMAN',   '9785463215', 'NOIDA',   'M');
insert into customer values(3, 'NEHA',   '9999999999', 'MUMBAI',  'F');
insert into customer values(4, 'MEGHA',  '9994562399', 'KOLKATA', 'F');
insert into customer values(5, 'PULKIT', '7895999999', 'LUCKNOW', 'M');

select * from customer;

-- ----------------------------------

insert into category values(1, 'BOOKS');
insert into category values(2, 'GAMES');
insert into category values(3, 'GROCERIES');
insert into category values(4, 'ELECTRONICS');
insert into category values(5, 'CLOTHES');

select * from category;

-- ----------------------------------

insert into product values(1, 'GTA V', 'Windows 7 and above with i5 processor and 8GB RAM', 2);
insert into product values(2, 'TSHIRT', 'SIZE-L with Black, Blue and White variations', 5);
insert into product values(3, 'ROG LAPTOP', 'Windows 10 with 15inch screen, i7 processor, 1TB SSD', 4);
insert into product values(4, 'OATS', 'Highly Nutritious from Nestle', 3);
insert into product values(5, 'HARRY POTTER', 'Best Collection of all time by J.K Rowling', 1);
insert into product values(6, 'Milk', '1L Toned MIlk', 3);
insert into product values(7, 'Boat Earphones', '1.5Meter long Dolby Atmos', 4);
insert into product values(8, 'Jeans', 'Stretchable Denim Jeans with various sizes and color', 5);
insert into product values(9, 'Project IGI', 'compatible with windows 7 and above', 2);
insert into product values(10, 'Hoodie', 'Black GUCCI for 13 yrs and above', 5);
insert into product values(11, 'Rich Dad Poor Dad', 'Written by RObert Kiyosaki', 1);
insert into product values(12, 'Train Your Brain', 'By Shireen Stephen', 1);

select * from product;

-- ----------------------------------

insert into supplier_pricing values(1, 1, 2, 1500);
insert into supplier_pricing values(2, 3, 5, 30000);
insert into supplier_pricing values(3, 5, 1, 3000);
insert into supplier_pricing values(4, 2, 3, 2500);
insert into supplier_pricing values(5, 4, 1, 1000);

INSERT INTO SUPPLIER_PRICING VALUES(6,12,2,780);
INSERT INTO SUPPLIER_PRICING VALUES(7,12,4,789);
INSERT INTO SUPPLIER_PRICING VALUES(8,3,1,31000);
INSERT INTO SUPPLIER_PRICING VALUES(9,1,5,1450);
INSERT INTO SUPPLIER_PRICING VALUES(10,4,2,999); 
INSERT INTO SUPPLIER_PRICING VALUES(11,7,3,549);
INSERT INTO SUPPLIER_PRICING VALUES(12,7,4,529);
INSERT INTO SUPPLIER_PRICING VALUES(13,6,2,105);
INSERT INTO SUPPLIER_PRICING VALUES(14,6,1,99);
INSERT INTO SUPPLIER_PRICING VALUES(15,2,5,2999);
INSERT INTO SUPPLIER_PRICING VALUES(16,5,2,2999);

select * from supplier_pricing;

-- ----------------------------------

insert into `order` values(101, 1500,  '2021-10-06', 2, 1);
insert into `order` values(102, 1000,  '2021-10-12', 3, 5);
insert into `order` values(103, 30000, '2021-09-16', 5, 2);
insert into `order` values(104, 1500,  '2021-10-05', 1, 1);
insert into `order` values(105, 3000,  '2021-08-16', 4, 3);
insert into `order` values(106, 1450,  '2021-08-18', 1, 9);
insert into `order` values(107, 789,   '2021-09-01', 3, 7);
insert into `order` values(108, 780,   '2021-09-07', 5, 6);
insert into `order` values(109, 3000,  '2021-09-10', 5, 3);
insert into `order` values(110, 2500,  '2021-09-10', 2, 4);
insert into `order` values(111, 1000,  '2021-09-15', 4, 5);
insert into `order` values(112, 789,   '2021-09-16', 4, 7);
insert into `order` values(113, 31000, '2021-09-16', 1, 8);
insert into `order` values(114, 1000,  '2021-09-16', 3, 5);
insert into `order` values(115, 3000,  '2021-09-16', 5, 3);
insert into `order` values(116, 99,    '2021-09-17', 2, 14);

select * from `order`;

-- ----------------------------------

insert into rating values(1, 101, 4);
insert into rating values(2, 102, 3);
insert into rating values(3, 103, 1);
insert into rating values(4, 104, 2);
insert into rating values(5, 105, 4);
insert into rating values(6, 106, 3);
insert into rating values(7, 107, 4);
insert into rating values(8, 108, 4);
insert into rating values(9, 109, 3);
insert into rating values(10, 110, 5);
insert into rating values(11, 111, 3);
insert into rating values(12, 112, 4);
insert into rating values(13, 113, 2);
insert into rating values(14, 114, 1);
insert into rating values(15, 115, 1);
insert into rating values(16, 116, 0);

select * from rating;



-- --------------------------------------
-- Queries


/* Q. 3. 
 * Display the total number of customers based on gender 
 * who have placed orders of worth at least Rs.3000.
*/

select cus_gender, count(cus_gender)
from customer
where cus_id in (select distinct cus_id from `order` where ord_amount >= 3000)
group by cus_gender;

-- ----------------------------

/* Q.4. 
 * Display all the orders along with product name 
 * ordered by a customer having Customer_Id=2
*/

select ord_id, pro_name
from product as p inner join (select  ord_id, pro_id
							  from supplier_pricing as sp inner join `order` as o
							  on sp.pricing_id = o.pricing_id 
                              where cus_id = 2) as tt
on p.pro_id = tt.pro_id;

-- ----------------------------

/* Q. 5. 
 * Display the Supplier details who can supply more than one product.
*/

select * from supplier 
where supp_id in (select supp_id
				  from supplier_pricing
				  group by supp_id
				  having count(supp_id) > 0
				 );

-- ----------------------------

/* Q. 6. 
 * Find the least expensive product from each category and 
 * print the table with category id, name, product name and price of the product
*/

select c.cat_id, cat_name, pro_name, MIN(supp_price) as min_supp_price
from supplier_pricing as sp
join product p
on sp.pro_id = p.pro_id
join category as c
on p.cat_id = c.cat_id
group by cat_id;

-- ----------------------------

/* Q. 7. 
 * Display the Id and Name of the Product ordered after “2021-10-05”.
*/

select distinct p.pro_id, p.pro_name
from `order` as o
join supplier_pricing as sp
on sp.pricing_id = o.pricing_id 
join product as p
on sp.pro_id = p.pro_id
where o.ord_date > '2021-10-05';

-- ----------------------------

/* Q. 8.
 * Display customer name and gender 
 * whose names start or end with character 'A'.
*/

select cus_name, cus_gender
from customer
where cus_name like "A%" or cus_name like  "%A";

-- ----------------------------


/* Q.9.
 * Create a stored procedure to display supplier id, name, rating and Type_of_Service. 
 * For Type_of_Service, If rating =5, print “Excellent Service”,
 * If rating >4 print “Good Service”,
 * If rating >2 print “Average Service” 
 * else print “Poor Service”.
*/

delimiter $
create procedure new_proc()
begin
select supp_id, supp_name, avg(rat_ratstars) as max_rat, 
case 
	when avg(rat_ratstars) = 5 then "Excellent Service"
    when avg(rat_ratstars) >= 4 then "Good Service"
    when avg(rat_ratstars) >=2 then "Average Service"
    else "Poor"
    end as type_of_service
		from   (select sp.supp_id, s.supp_name, r.rat_ratstars
				from rating as r
				join `order` as o
				on r.ord_id = o.ord_id
				join supplier_pricing as sp
				on o.pricing_id = sp.pricing_id
				join supplier as s
				on sp.supp_id = s.supp_id) as tbl
	group by supp_id;
end $

delimiter ;
