--employee database table setup
--setting up six tables for six csv files

--Order for tables based on data and primary & foreign keys: 
--(1)titles, (2)departments, (3)employees, (4)dept_managers, (5)dept_employee, (6)salaries

--Setup Table 1 - titles
DROP TABLE IF EXISTS titles;
CREATE TABLE titles(	
	title_id VARCHAR(5) NOT NULL,
	title VARCHAR(20) NOT NULL,
	PRIMARY KEY (title_id)
);
SELECT * FROM titles;

--Setup Table 2 - departments
DROP TABLE IF EXISTS departments;
CREATE TABLE departments(
	dept_number VARCHAR(4) NOT NULL,
	dept_name VARCHAR(20) NOT NULL,
	PRIMARY KEY (dept_number)
);
SELECT * FROM departments;

--Setup Table 3 - employees
DROP TABLE IF EXISTS employees;
CREATE TABLE employees(
	employee_number INTEGER NOT NULL,
	title_id VARCHAR (5) NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR (30) NOT NULL,
	sex VARCHAR(1) NOT NULL,
	hire_date DATE NOT NULL,
	PRIMARY KEY (employee_number),
	FOREIGN KEY (title_id) REFERENCES titles(title_id)	
);
SELECT * FROM employees;

--Setup Table 4 - department_manager
DROP TABLE IF EXISTS dept_manager;
CREATE TABLE dept_manager(
	dept_number VARCHAR (5) NOT NULL,
	employee_number INTEGER NOT NULL,
	FOREIGN KEY (dept_number) REFERENCES departments(dept_number),
	FOREIGN KEY (employee_number) REFERENCES employees(employee_number),
	PRIMARY KEY (dept_number, employee_number)
);
SELECT * FROM dept_manager;

--Setup Table 5 - department_employee
DROP TABLE IF EXISTS dept_employee;
CREATE TABLE dept_employee(
	employee_number INTEGER NOT NULL,
	dept_number VARCHAR(5) NOT NULL,
	FOREIGN KEY (employee_number) REFERENCES employees(employee_number),
	FOREIGN KEY (dept_number) REFERENCES departments(dept_number),
	PRIMARY KEY (employee_number, dept_number)
);
SELECT * FROM dept_employee;

--Setup Table 6 - salaraties
DROP TABLE IF EXISTS salaries;
CREATE TABLE salaries(
	employee_number INTEGER NOT NULL,
	salary INTEGER NOT NULL,
	FOREIGN KEY (employee_number) REFERENCES employees(employee_number),
	PRIMARY KEY (employee_number, salary)
);
SELECT * FROM salaries;

--upload all csv files 