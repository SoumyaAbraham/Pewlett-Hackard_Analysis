--Creating Tables for PH Employees:

--drop table departments cascade

--CREATE DEPARTMENTS:
CREATE TABLE departments(
	dept_no VARCHAR PRIMARY KEY,
	dept_name VARCHAR UNIQUE);
--SELECT * FROM departments	
	
--DROP TABLE employees

--CREATE EMPLOYEES:
CREATE TABLE employees(
	emp_no SERIAL PRIMARY KEY,
	birth_date DATE,
	first_name VARCHAR,
	last_name VARCHAR,
	gender VARCHAR,
	hire_date DATE);
--select * from employees

--DROP TABLE dept_manager

--CREATE DEPT_MANAGER:
CREATE TABLE dept_manager(
	dept_no VARCHAR,
	emp_no SERIAL PRIMARY KEY,
	from_date DATE, 
	to_date DATE,
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);	
--select * from dept_manager

--DROP TABLE DEPT_EMP

--CREATE DEPT EMPLOYEES TABLE:
CREATE TABLE dept_emp(
	emp_no SERIAL,
	dept_no VARCHAR,
	from_date DATE, 
	to_date DATE,
	PRIMARY KEY (emp_no, dept_no)
	);
--select * from dept_emp

DROP TABLE salaries

--CREATE SALARIES:
CREATE TABLE salaries(
	emp_no SERIAL PRIMARY KEY,
	salary INTEGER,
	from_date DATE,
	to_date DATE,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
	);
select * from salaries	

DROP TABLE titles

--CREATE TITLES:
CREATE TABLE titles(
	emp_no SERIAL,
	title VARCHAR,
	from_date DATE,
	to_date DATE,
	PRIMARY KEY (emp_no, title, from_date),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no));
	
	
select * from titles
	
