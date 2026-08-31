-- 1. Employees earning below the average salary
select emp_name, new_salary
from employee_table where new_salary <
(select avg(new_salary) from employee_table);
CREATE DATABASE practice_subquery;
USE practice_subquery;

CREATE TABLE practice (
	emp_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(10),
    department VARCHAR(10),
    salary INT
);

INSERT INTO practice (name, department, salary) VALUES
('john', 'IT', 50000),
('mary', 'HR', 45000),
('david', 'IT', 60000),
('sarah', 'finance', 70000),
('james', 'HR', 40000);

select * from practice;

-- Find all employees who earn more than the average salary.
SELECT 
name,
salary
FROM practice
WHERE salary >
(
	SELECT AVG(salary) FROM practice
    );
    
-- Find the employee with the highest salary.
SELECT
name, salary
FROM practice
WHERE salary =
(
	SELECT MAX(salary) FROM practice
    );
    
-- Find employees whose salary is lower than minimum salary in the IT department.
SELECT 
name, department, salary
FROM practice 
WHERE department = 'IT' and salary <
(
	SELECT AVG(salary) FROM practice
    WHERE department = 'IT'
    );
    
-- Find all employees who work in the HR department.
SELECT name, department
FROM practice
WHERE emp_id IN
(
	SELECT emp_id FROM practice WHERE department = 'HR'
    );
    
-- Find all employees who work in either the IT or Finance departments.
SELECT 
name, department
FROM practice
WHERE emp_id IN
( 
	SELECT emp_id FROM practice WHERE department = 'IT' or 'Finance'
    );