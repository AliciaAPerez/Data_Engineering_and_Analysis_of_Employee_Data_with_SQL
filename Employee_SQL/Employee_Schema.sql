--employee database table setup
--setting up six tables for six csv files

--starting with titles table setup
DROP TABLE IF EXISTS titles;
CREATE TABLE titles(	
	title_id VARCHAR(5) NOT NULL,
	title VARCHAR(20) NOT NULL,
	PRIMARY KEY (title_id)
);
SELECT * FROM titles;

--departments table setup
DROP TABLE IF EXISTS departments;
CREATE TABLE departments(
	dept_number VARCHAR(4) NOT NULL,
	dept_name VARCHAR(20) NOT NULL,
	PRIMARY KEY (dept_number)
);
SELECT * FROM departments;

--employees table setup
DROP TABLE IF EXISTS employees;
CREATE TABLE employees(
	employee_number INTEGER NOT NULL,
	employee_title_id VARCHAR (5) NOT NULL,
	birth_date DATE,
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR (30) NOT NULL,
	sex VARCHAR(1),
	hire_date DATE,
	PRIMARY KEY (employee_number),
	FOREIGN KEY (employee_title_id) REFERENCES titles(title_id)	
);
SELECT * FROM employees;

--department manager table setup
DROP TABLE IF EXISTS dept_manager;
CREATE TABLE dept_manager(
	dept_number VARCHAR (5) NOT NULL,
	employee_number INTEGER NOT NULL,
	FOREIGN KEY (dept_number) REFERENCES departments(dept_number),
	FOREIGN KEY (employee_number) REFERENCES employees(employee_number)
);
SELECT * FROM dept_manager;

--department employee table setup
DROP TABLE IF EXISTS dept_employee;
CREATE TABLE dept_employee(
	employee_number INTEGER NOT NULL,
	dept_number VARCHAR(5) NOT NULL,
	FOREIGN KEY (employee_number) REFERENCES employees(employee_number),
	FOREIGN KEY (dept_number) REFERENCES departments(dept_number)
);
SELECT * FROM dept_employee;

--salaraties table setup
DROP TABLE IF EXISTS salaries;
CREATE TABLE salaries(
	employee_number INTEGER NOT NULL,
	salary INTEGER NOT NULL,
	FOREIGN KEY (employee_number) REFERENCES employees(employee_number)
);
SELECT * FROM salaries;

--upload all csv files 