use testbook;
# Select
select * from car_sales;
select Manufacturer from car_sales;

# Distinct
select distinct Manufacturer from car_sales;

# Where

select * from car_sales
where Manufacturer = "BMW" and model = "328i";

# Order by

select * from car_sales
order by Sales_in_thousands desc, __year_resale_value asc;

# And 

select * from car_sales
where model = "TL" and Vehicle_type ="Car" and Engine_size = 1.8;

# or

select * from car_sales
where model = "TL" or Vehicle_type ="Car" and Engine_size = 1.8;

# Not in include ?

select * from car_sales
where not model  = "A4";


# Null 

select * from car_sales
where Manufacturer is null;


# Aggregate Function

select max(Horsepower) from car_sales;
select min(horsepower) from car_sales;
select count(horsepower) from car_sales;
select sum(horsepower) from car_sales;
select avg(horsepower) from car_sales;
------------------------------------------------------------------------------
# Like 

select model from car_sales
where model like "%I";

# wildcards

select vehicle_type from car_sales
where Vehicle_type like "%p%";

# IN

select * from car_sales
where Manufacturer in ("Acura","Audi","BMW");

select * from car_sales
where Manufacturer not in ("Acura","Audi","BMW");

# Between

select * from car_sales
where Sales_in_thousands between 50 and 90;

select * from car_sales
where Sales_in_thousands not between 50 and 90;

# create table and insert into 

create table A(name varchar(150),
               number int);
insert into A(Name, number)
values ("Shubham",5);

select * from a;


# join
create table C(name varchar(20), Num int, id int);

select * from c;

insert into c (name, Num, id)
values ("Shubham", 1, 52 ),("Abhay",2, 58), ("A",2, 20);

create table d (salary char(20), id int, loction varchar(80));

insert into d (salary, id, loction)
values (45000, 52, "Mumbai"), (50000, 58, "Delhi"), (80000, 20,"idore"), (40000, 50,"Hydrabad");

select * from d;

select * from c
inner join d
on c.id = d.id;

select * from c
left join d
on c.id = d.id;

select * from c
right join d
on c.id = d.id;

# Union
select * from c
union 
select * from d;

# union all

select * from c
union all
select * from d;

# union in order

select  id from c
union
select  id from d
order by id;

# order by in union all

select id from c
union all
select id from d
order by id;

# where in union 

select id from c
where id between 20 and 50
union 
select id from c
where id between 20 and 50
order by id
limit 5;

# group by

select count(distinct Manufacturer), model , engine_size from car_sales
where Engine_size between 1.8 and 3.5 and
model in ("Integra","TL","CL")
group by model, Engine_size
order by engine_size asc
limit 1;

# having 

select distinct(model), manufacturer, count(vehicle_type), sum(horsepower), fuel_capacity
from car_sales
where Fuel_capacity between 13.2 and 18 and model in ("Integra","TL","CL","RL")
group by model, Manufacturer, Fuel_capacity
having Manufacturer = "Acura" 
or count(vehicle_type) = "Passenger"
order by sum(horsepower) desc;

# Exist 

select * from c;
select * from d;
select *  from c
where exists(select 1 from d where d.id = c.id and salary > 45000);

# Any All

select id from c
where id = any
(select salary from d where Loction = "Mumbai");

select name from c
where name = all
(select id from d where id > 20);

---------------------------------------------------------------------------

# case

select engine_size, horsepower,
case 
    when engine_size > 3.5 then "This greater than 3.5"
    when engine_size = 3.5 then "this is equal"
    else "this engine_size is under 3.5"
end as new_c
from car_sales;

# Partion by

select distinct(model), Sales_in_thousands, __year_resale_value, sum(Wheelbase) 
over(partition by Model order by Sales_in_thousands desc) as  n_c
from car_sales;

# Row_number

select distinct(model), Sales_in_thousands, __year_resale_value, sum(Wheelbase) over(),
row_number() over(partition by Model order by Sales_in_thousands desc) as  n_c
from car_sales;


# Update 

update A
set Name  = "Shubham"
where number = 5;

drop database if exists j;
create database if not exists a;

show databases;
show tables;

