# 1.WAQ to find the highest salary from the employees table.
SELECT MAX(salary) AS Highest_Salary
FROM employees;

# 2. WAQ to find lowest salary from the employees table.
SELECT MIN(salary) AS Lowest_Salary
FROM employees;

# 3. WAQ to find the employee(s) with the highest salary.
SELECT *
FROM employees
WHERE salary = (SELECT MAX(salary) FROM employees);

# 4. WAQ to find the employee(s) with the lowest salary.
SELECT * 
FROM employees
WHERE salary = (SELECT MIN(salary) FROM employees);

# 5. WAQ to find the average salary of all employees.
SELECT AVG(salary) AS Average_Salary
FROM employees;

# 6. WAQ to find the total salary expenditure of all employees.
SELECT SUM(salary) AS Total_Salary_Expenditure
FROM employees;

# 7. WAQ to find the number of employees earning above  20000 Salary.
SELECT COUNT(*) AS Employees_Above_50000
FROM employees
WHERE salary > 20000;

# 8. WQA to find second highest salary from the employees table.
SELECT  MAX(salary) AS Second_Highest_Salary
FROM employees
WHERE salary < (SELECT MAX(salary) from employees);

# 9. WQA to find second lowest salary from the employees table.
SELECT MIN(salary) AS Second_Lowest_Salary
FROM employees
WHERE salary > (SELECT MIN(salary) from employees);

# 10. WQA to find the third highest salary from the employees table.
SELECT DISTINCT salary AS Third_Highest_Salary
FROM employees e1
WHERE 3 = (SELECT COUNT(DISTINCT salary) 
            FROM employees e2 
            WHERE e1.salary < e2.salary);

# 11. WAQ to find Nth highest salary from the employees table.
SELECT DISTINCT salary AS Nth_Highest_Salary
FROM employees e1
WHERE :N = (SELECT COUNT(DISTINCT salary) 
            FROM employees e2 
            WHERE e1.salary < e2.salary);

# 12. WAQ to find department-wise highest salary from the employees table.
SELECT emp.department_id, MAX(emp.salary) AS HighestSalary, dept.department_name
FROM employees emp
JOIN departments dept ON emp.department_id = dept.department_id
GROUP BY emp.department_id, dept.department_name
ORDER BY emp.department_id;

# 13. WAQ to find department-wise avg salary from the employees table.
select emp.department_id, AVG(emp.salary) AS avg_salary, dept.department_name
from employees emp
join departments dept on emp.department_id = dept.department_id
group by emp.department_id,dept.department_name
order by emp.department_id;

# 14. WAQ to find department-wise employee count from the employees table.
select emp.department_id, COUNT(*) AS employee_count, dept.department_name
from employees emp
join departments dept on emp.department_id = dept.department_id
group by emp.department_id,dept.department_name
order by emp.department_id;

# 15. WAQ to find job-wise highest salary from the employees table.
SELECT emp.job_id, MAX(emp.salary) AS HighestSalary, job.job_title
FROM employees emp
JOIN jobs job ON emp.job_id = job.job_id
GROUP BY emp.job_id, job.job_title
ORDER BY emp.job_id;