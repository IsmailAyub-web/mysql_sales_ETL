create database SALES_WAREHOUSE;

use sales_warehouse;
create table fact_table(Country varchar(50), ItemType varchar(50), sales_channel varchar(10),Order_date date,OrderId int primary Key, Units_cost double, Total_Revenue double, Total_cost double, Total_profit double);
create table dim_region(Country varchar(25) primary key, region varchar(50));
create table tempdata(Country varchar(25),ItemType varchar(50),sales_channel varchar(10), order_priority varchar(10), Order_date date, OrderId int, shipdate date, units_sold int,Unit_price double, Units_cost double, Total_Revenue double, Total_cost double, Total_profit double);
drop table  fact_table;
load data local infile 'C:/Users/DELL/Analysis/sales-data_.csv'
into table tempdata
fields terminated by','
enclosed by '\n'
ignore 1 rows;

call etl_sales;



