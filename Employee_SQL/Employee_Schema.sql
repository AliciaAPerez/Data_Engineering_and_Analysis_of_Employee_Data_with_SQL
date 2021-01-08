--employee table setup

DROP TABLE IF EXISTS employees;
CREATE TABLE employees (
	employee_number INTEGER NOT NULL,
	employee_title VARCHAR (5) NOT NULL,
	birthdate DATE NOT NULL,
	first_name VARCHAR (30) NOT NULL,
	last_name VARCHAR (30) NOT NULL,
	sex VARCHAR (1) NOT NULL,
	hire_date DATE NOT NULL,	
	PRIMARY KEY (employee_number)
);

SELECT * FROM employees;

