-- Employee Database

create database Employee;
Use Employee

-- Table Creation

Create table departments(
department_id int,
department_name varchar(100)
);

Create table location(
location_id int,
location varchar(30)
);

Create table employee(
employee_id int,
employee_name varchar(50),
gender enum('M', 'F'),
hire_date date,
designation varchar(100),
department_id int,
location_id int,
salary decimal(10,2)
);



/*rename table employee to empolyees
add age column to employees table
*/
alter table employee
rename to employees;

alter table employees
add column age int;



-- Table Alteration

alter table employees
add column email varchar(100);

alter table employees
modify column designation varchar(200);

alter table employees
drop column age ;

alter table employees
rename column hire_date to date_of_joining;



-- Table Renaming

rename table departments to departments_info;

rename table location to locations;


-- Table Truncation

truncate table employees;


-- Table Employees Dropping

drop table employees;


-- Employee Database Dropping

Drop database employee;

















 

