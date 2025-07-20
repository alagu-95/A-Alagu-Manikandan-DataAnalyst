use employee;

 
select * from employees;
select * from departments;
select * from location;

-- query using JOINS
-- 1. Inner Join: List employee names, their designations, and department names where employees are assigned to a department.

select e.Employee_name, e.designation, d.department_name 
from employees as e
inner join departments as d on e.department_id = d.department_id; 


-- 2. Left Join: List all departments along with the total number of employees in each department, including departments with no employees.

select d.department_id, d.Department_name, count(e.employee_id) as total_employees
from departments as d
left join employees as e on d.department_id = e.department_id
group by d.department_id, d.Department_name;

/*
-- sample output
Error Code: In aggregated query without GROUP BY, expression #1 of SELECT list contains nonaggregated column 'employee.d.Department_name'; this is incompatible with sql_mode=only_full_group_by
*/

-- 3. Right Join: 
-- Display all locations along with the names of employees assigned to each location. If no employees are assigned to a location, display NULL for employee name.

select e.employee_name, l.location
from location as l
right join employees as e on l.location_id = e.location_id;



-- Query using Functions

-- Built-in Numeric Functions
-- 1. Find the average age of employees, rounded off to the nearest integer. 

select round(avg(age),0) Average_Age
from employees;

/*
-- sample output
-- Average_Age = 29
*/

-- 2. Retrieve all employee records including a bonus column, calculated as the square root of their salary rounded up to the nearest larger integer.

select*, round(sqrt(salary), 1) Bonus
from employees;



-- Built-in String Functions
-- 1. Extract the first three characters from the location names.

select location, left(location, 3) location_name
from location;

/*
-- sample outout
-- Ban Che Hyd Pun
*/

-- 2. Concatenate employee names with their designations separated by a hyphen.
select Employee_ID, concat(Employee_name, ' - ' ,Designation) as Employee_designation
from employees;


-- Built-in Date Time Functions
-- 1. Extract the year from the hire date of all employees.
select hire_date, year(hire_date) as year from employees;

-- 2. Calculate the number of days between the hire date and the current date for each employee.
select hire_date, curdate() as currentdate, datediff(curdate(), hire_date) as number_of_days from employees;

-- 3. Format the hire date of employees to display in 'DD-MM-YYYY' format.
select hire_date, date_format(hire_date, '%d-%m-%Y') formated_date from employees;

-- 4. Find the 'employment_confirmation' date of each employee which is 3 months from their hire_date.
select employee_id, Employee_name, hire_date, date_sub(hire_date, interval 3 month) employment_confirmation from employees;



-- User-defined Functions

select * from location;
select * from employees;

-- Define a function to retrieve the employee count by location name. Find the employee count for the cities Bangalore and Hyderabad.

delimiter //
create function employeecount(location varchar(30))
returns int
deterministic
begin
	declare current_employee int;
    select count(employee_id) into current_employee from employees
    where location_id = location_id;
    return current_employee;
end //
delimiter ;    
    
select employeecount("Bangalore") as Ban_employee_count;

select employeecount("Hyderabad") as Hyd_emp_count;

/*
-- sample output 
-- Ban_employee_count = 30
-- Hyd_emp_count = 30
*/


















