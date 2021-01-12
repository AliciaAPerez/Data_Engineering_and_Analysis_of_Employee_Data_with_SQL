--Data analysis employee query 

-- Quick Reference for databases and columns names:
-- titles(t): title_id, title
-- departments(d): dept_number, dept_name
-- employees(e): employee_number, employee_title_id, birth_date, first_name, last_name, sex, hire_date
-- dept_manager(dm): dept_number, employee_number
-- dept_employee(de): employee_number, dept_number
-- salaries(s): employee_number, salary

-- 1 employee details: employee number, last name, first name, sex, salary
SELECT e.employee_number, e.last_name, e.first_name, e.sex, s.salary
FROM employees AS e
LEFT JOIN salaries AS s
ON e.employee_number = s.employee_number;

-- 2 employee details: first name, last name, hire date for employees hired in 1986
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE '1986-%%-%%';

-- 3 manager details: department number, department name, manager's employee number, last name, first name
SELECT d.dept_number, d.dept_name, dm.employee_number, e.last_name, e.first_name
FROM departments AS d
LEFT JOIN dept_manager AS dm
ON d.dept_number = dm.dept_number
LEFT JOIN employees AS e
ON e.employee_number = dm.employee_number;

-- 4 employee department details: employee number, last name, first name, department name
SELECT e.employee_number, e.last_name, e.first_name, d.dept_name
FROM departments AS d
LEFT JOIN dept_employee AS de
ON d.dept_number = de.dept_number
LEFT JOIN employees AS e
on e.employee_number = de.employee_number;

-- 5 first name, last name, sex employees with first name "Hercules" and last name being with "B"
SELECT first_name, last_name, sex
FROM employees 
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

-- 6 employees in sales department with employee number, last name, first name, department name
-- employees does not include managers
SELECT e.employee_number, e.last_name, e.first_name, d.dept_name
FROM employees AS e
LEFT JOIN dept_employee AS de
ON e.employee_number = de.employee_number
LEFT JOIN departments AS d
ON d.dept_number = de.dept_number
WHERE d.dept_name = 'Sales';

-- 7 all employees in sales and development departments with employee number, last name, first name, department name
-- employees does not include managers
SELECT e.employee_number, e.last_name, e.first_name, d.dept_name
FROM employees AS e
LEFT JOIN dept_employee AS de
ON e.employee_number = de.employee_number
LEFT JOIN departments AS d
ON d.dept_number = de.dept_number
WHERE d.dept_name = 'Sales' 
OR d.dept_name = 'Development';

-- 8 descending order, frequency count of last names
SELECT last_name, COUNT(last_name) AS "Frequency of Last Names"
FROM employees
GROUP BY last_name
ORDER BY "Frequency of Last Names" DESC;