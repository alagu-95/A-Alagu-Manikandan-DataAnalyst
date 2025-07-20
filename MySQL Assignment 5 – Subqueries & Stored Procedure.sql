use employee;

-- Subqueries:

-- 1. Single-Row Subqueries:
--   Retrieve the details of employees with salaries greater than the average salary of all employees.

		select * from employees
		where salary > (select avg(salary) from employees);

--  List the employee(s) with the highest salary.
		
        select * from employees
        where salary = (select max(salary) from employees);

-- Retrieve the details of employees who are working in the same  department as the employee Arjun Kumar.
		
		select * from employees
        where department_id = (select department_id from employees where Employee_name = 'Arjun Kumar');
        
        
-- 2. Multi-Row Subqueries:  
-- Find the employees who work in departments with 'Development' in their name.

		select*from employees
		where Department_Id in (select Department_Id from Departments where Department_name like '%Development%');

        

-- Stored Procedure:

-- 1. Stored Procedure with IN Parameter:
/*
Define a stored procedure named GetEmployeesByDepartmentName that takes a department name as input and 
retrieves employees belonging to that department. 
Retrieve employee details of the departments 'IT' and 'Human Resources'
*/
select * from departments;

		delimiter \\
        create procedure GetEmployeesByDepartmentName (in dept_name varchar(100))
        begin 
			select * from employees e
            inner join departments d on e.department_id = d.department_id
            where d.department_name = dept_name;
		end \\
        delimiter ;
        
        call GetEmployeesByDepartmentName('IT');
        call GetEmployeesByDepartmentName('Human Resources');
        
        
   -- 2. Stored Procedure with OUT Parameter:
/*
Create a stored procedure named FindEmployeeBirthYearByID that takes an employee ID as input and
returns the employee's birth year.
Retrieve the birth year of employees with the IDs 5004, 5018 and 5029.
*/     
select * from employees;

		delimiter \\ 
        create procedure FindEmployeeBirthYearByID (in emp_id int, out birth_year int )
        begin
			 select year(hire_date) into birth_year from employees
             where employee_id = emp_id;
		end \\
        delimiter ;
       
        call FindEmployeeBirthYearByID ( 5004, @birth_year);
        select @birth_year as employees_birth_year  ;
        
        call FindEmployeeBirthYearByID ( 5018, @birth_year);
        select @birth_year as employees_birth_year  ;
        
        call FindEmployeeBirthYearByID ( 5029, @birth_year);
        select @birth_year as employees_birth_year  ;

/*
sample output
employees_birth_year for 5004 - 2015
employees_birth_year for 5018 - 2017
employees_birth_year for 5029 - 2019
-- Error Code: 1064. You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ') into birth_year from employees              where employee_id = emp_id;   end' at line 3

*/

drop procedure FindEmployeeBirthYearByID;











        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
