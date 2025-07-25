Create database Employee;
use Employee;


-- Tables Creation of DDL-Constraints

Create table departments(
Department_ID int primary key,
Department_name varchar(100) not null unique
);

Create table location(
Location_ID int primary key auto_increment,
Location varchar(30) not null unique
);


Create table Employees(
Employee_ID INT Primary key unique,
Employee_name varchar(50) not null,
Gender enum('M', 'F'),
Age int check (age>=18),
Hire_Date date default(current_date),
Designation varchar(100),
Department_Id int,
Location_Id int,
Salary decimal(10,2),
Foreign Key (Department_Id) references departments(Department_ID),
Foreign Key (Location_Id) references location(Location_ID)
);


-- using DML Commands in created tables


insert into location
values (1, "Chennai"), (2, "Bangalore"), (3, "Hyderabad"), (4, "Pune");

insert into Departments
values 
(1, "Software Development"), (2, "Marketing"), (3, "Data Science"), (4, "Human Resources"), (5, "Product Management"), (6, "Content Creation"), 
(7, "Finance"), (8, "Design"), (9, "Research and Development"), (10, "Customer Support"), (11, "Business Development"), (12, "IT"), (13, "Operations");


insert into employees(employee_id, employee_name, gender, age, hire_date, designation, department_id, location_id, salary) 
VALUES (5001, 'Vihaan Singh', 'M', 27, '2015-01-20', 'Data Analyst', 3, 4, 60000),
       (5002, 'Reyansh Singh', 'M', 31, '2015-03-10', 'Network Engineer', 12, 1, 80000),
       (5003, 'Aaradhya Iyer', 'F', 26, '2015-05-20', 'Customer Support Executive', 10, 2, 45000),
       (5004, 'Kiara Malhotra', 'F', 29, '2015-07-05', NULL, 8, 3, 70000),
       (5005, 'Anvi Chaudhary', 'F', 25, '2015-09-11', 'Business Development Executive', 11, 1, 55000),
       (5006, 'Dhruv Shetty', 'M', 28, '2015-11-20', 'UI Developer', 8, 2, 65000),
       (5007, 'Anushka Singh', 'F', 32, '2016-01-15', 'Marketing Manager', 2, 3, 90000),
       (5008, 'Diya Jha', 'F', 27, '2016-03-05', 'Graphic Designer', 8, 4, 70000),
       (5009, 'Kiaan Desai', 'M', 30, '2016-05-20', 'Sales Executive', 11, 3, 55000),
       (5010, 'Atharv Yadav', 'M', 29, '2016-07-10', 'Systems Administrator', 12, 4, 80000),
       (5011, 'Saanvi Patel', 'F', 28, '2016-09-20', 'Marketing Analyst', 2, 1, 60000),
       (5012, 'Myra Verma', 'F', 26, '2016-11-05', 'Operations Manager', 13, 2, 95000),
       (5013, 'Arnav Rao', 'M', 33, '2017-01-20', 'Customer Success Manager', 10, 3, 75000),
	   (5014, 'Vihaan Mohan', 'M', 30, '2017-03-10', 'Supply Chain Analyst', 10, 2, 60000),
	   (5015, 'Ishaan Kumar', 'M', 27, '2017-05-20', 'Financial Analyst', 7, 1, 85000),
       (5016, 'Zoya Khan', 'F', 31, '2017-07-05', 'Legal Counsel', 4, 4, 100000),
       (5017, 'Kabir Nair', 'M', 28, '2017-09-11', 'IT Support Specialist', 12, 2, 80000),
       (5018, 'Ishan Mishra', 'M', 25, '2017-11-20', 'Research Scientist', 9, 3, 75000),
       (5019, 'Ishika Patel', 'F', 29, '2018-01-15', 'Talent Acquisition Specialist', 4, 4, 55000),
       (5020, 'Aarav Nair', 'M', 32, '2018-03-05', 'Software Engineer', 1, 1, 90000),
       (5021, 'Advik Kapoor', 'M', 26, '2018-05-20', 'Finance Analyst', 7, 3, 85000),
       (5022, 'Aadhya Iyengar', 'F', 28, '2018-07-10', 'HR Specialist', 4, 4, 60000),
       (5023, 'Anika Paul', 'F', 30, '2018-09-20', 'Public Relations Specialist', 2, 2, 70000),
       (5024, 'Aryan Shetty', 'M', 27, '2018-11-05', 'Product Manager', 5, 1, 95000),
       (5025, 'Avni Iyengar', 'F', 31, '2019-01-20', 'Data Scientist', 3, 4, 100000),
       (5026, 'Vivaan Singh', 'M', 29, '2019-03-10', 'Business Analyst', 3, 2, 75000),
       (5027, 'Ananya Paul', 'F', 32, '2019-05-20', 'Content Writer', 6, 3, 60000),
       (5028, 'Anaya Kapoor', 'F', 26, '2019-07-05', 'Event Coordinator', 6, 1, 60000),
       (5029, 'Arjun Kumar', 'M', 33, '2019-09-11', 'Quality Assurance Analyst', 12, 2, 80000),
       (5030, 'Sara Iyer', 'F', 28, '2019-11-20', 'Project Manager', 5, 1, 90000);


-- By using SELECT Command to retrieve data

select * from Departments;
select Location from location;
select Employee_name, Designation from Employees;


--  By using UPDATE Command to Update the records in the Employees table

update employees
set designation = 'Senior Data Analyst'
where employee_id = 5001;

update employees
set Salary= Salary*0.1;

set SQL_safe_updates = 0;


--  By using DELETE Command to delete before Dated from Hire_Date Column 

delete from employees
where Hire_Date < '2017-01-01';


delete from employees
where employee_id = 5025;


-- SELECT Command used to Display the current Employee Database 

select * from Departments;
select * from Location;
select * from Employees;




-- inserting the values in employees table


insert into employees(employee_id, employee_name, gender, age, hire_date, designation, department_id, location_id, salary) 
VALUES
(5001, 'Vihaan Singh', 'M', 27, '2015-01-20', 'Data Analyst', 3, 4, 60000),
       (5002, 'Reyansh Singh', 'M', 31, '2015-03-10', 'Network Engineer', 12, 1, 80000),
       (5003, 'Aaradhya Iyer', 'F', 26, '2015-05-20', 'Customer Support Executive', 10, 2, 45000),
       (5004, 'Kiara Malhotra', 'F', 29, '2015-07-05', NULL, 8, 3, 70000),
       (5005, 'Anvi Chaudhary', 'F', 25, '2015-09-11', 'Business Development Executive', 11, 1, 55000),
       (5006, 'Dhruv Shetty', 'M', 28, '2015-11-20', 'UI Developer', 8, 2, 65000);
       
       
















 