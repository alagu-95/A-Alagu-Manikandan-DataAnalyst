use employee;


-- Write a query to retrieve distinct salaries from the Employees table.

select distinct salary from employees;                                                  


-- Provide aliases for the "age" and "salary" columns as "Employee_Age" and "Employee_Salary", respectively.

select Age as Employee_Age, Salary as Employee_Salary
from employees;



/*
Where Clause & Operators (Arithmetic, Comparison, Logical):
		1. Calculate the net salary per employee by adding a 10% bonus.
		2. Retrieve employees with a salary greater than ₹50000 and hired before 2016-01-01.
		3. List employees who are Data Analyst or Data Scientist.
*/

select salary, Salary + 0.1 as net_salary
from employees;

select salary, Hire_Date from employees 
where (salary>50000) and Hire_Date < '2016-01-01';

select * from employees 
where designation = "Data Analyst" or "Data Scientist";



-- 	Other Operators used below:

-- 1. Find the employee whose designation is missing and fill it with "Data Scientist".

update employees
set designation = "Data Scientist"
where designation is null;

SET SQL_safe_updates = 0;
select * from employees;


-- back to original dataset
update employees
set designation = null 
where Employee_ID = "5004";

-- 2. List employees whose department_id is either 1, 3, 4, 9, or 12.

select department_id from employees
where department_id in(1, 3, 4, 9, 12);


-- 3. Identify employees whose salary is not between 50000 and 80000.

select salary from employees
where Salary not between 50000 and 80000;


-- 4. Find employees whose name starts with a vowel.

select *
from Employees
where Employee_name regexp '^[AEIOUaeiou]';



-- 5. Display the employee names that have 'sh' as the second and third characters.

select * from employees 
where Employee_name like ("_sh%");

select * from employees 
where Employee_name like ("__sh%");



/*
 1.	ORDER BY:
	List employees hired after January 1, 2019, ordered by hire date.
	Find employees sorted by department ID in ascending order and salary in descending order
*/

select Hire_Date 
from employees 
where Hire_Date > "2019-01-01"
order by Hire_Date;

select Department_Id, Salary 
from employees 
order by Department_Id , Salary desc;



/*
2.	LIMIT:
    Retrieve the top 10 highest paid employees from the Employees table.
    Display the first 5 employees hired in the year 2018.
*/

select * from employees
order by salary desc
limit 10;

select * from employees
where Hire_Date > "2018-01-01"
limit 5;



/*
3.	Aggregate Functions:
	Calculate the sum of all salaries in the Finance department.
	Find the minimum age among all employees.
*/

select sum(salary) as Total_Salary 
from employees;

select min(Age) 
from employees;



/*
4.	GROUP BY:
    List the maximum salary for each location.
    Calculate the average salary for each designation containing the word 'Analyst'
*/

select Location, max(salary) as Maximum_Salary 
from employees, location
group by Location;

select Designation, avg(Salary) as Average_Salary
from employees
where Designation like '%Analyst' 
group by Designation;



/*
5.	HAVING:
    Find departments with less than 3 employees.
    Find locations with female employees whose average age is below 30.
*/

select department_id, COUNT(Employee_ID) as employee_count
from employees
group by department_id
having employee_count < 3;

select location_id, avg(age) as average_age
from employees
where gender ='f'
group by location_id
having average_age < 30 ;




