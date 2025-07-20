use employee;
  
select * from employees;
-- 1. Before Insert Trigger:
/*
Create a before insert trigger that automatically sets the salary of an employee to the average of all salaries if it's not provided during insertion. 
Test the trigger by attempting to insert a new employee without providing a salary.
*/

delimiter \\
create trigger new_employee_salary
before insert on employees
for each row
begin
	if new.salary is null then
    set new.salary = (select avg(salary) from employees);
    end if;
end \\
delimiter ;

-- Test
insert into employees(employee_id, employee_name, gender, age, hire_date, designation, department_id, location_id) 
values(5031, 'Alagu', 'M', 29, '2025-08-01', 'Data Analyst', 12, 4);     

/*
 Sample output
 5031	Alagu	M	29	2025-08-01	Data Analyst	12	4	74000.00
*/

select * from employees;



-- 2. After Delete Trigger:
/*
Create an after delete trigger to prevent the deletion of employees who joined in the most recent year. 
Test the trigger by attempting to delete an employee who joined in the latest year.
*/

delimiter \\
create trigger prevent_employees_deletion
after delete on employees
for each row
begin 
	declare latest_year int;
    select max(year(old.Hire_Date)) into latest_year from employees;
	if year(old.Hire_Date) = latest_year then
    signal SQLstate'45000'
    set message_text = 'Cannot delete a employees who joined in the most recent year';
    end if;
end \\
delimiter ;

-- Test 
delete from employees where employee_id = 5031;

/*
 sample output
 Error Code: 1644. Cannot delete a employees who joined in the most recent year
*/

select * from employees;
drop trigger prevent_employees_deletion;
