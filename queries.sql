--- QUERIES ---

--All employees born between 1952 and 1955:
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31';
	

SELECT count(first_name)
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31';
--90398


--All employees born in 1952:
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1952-12-31';
	

SELECT count(first_name)
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1952-12-31';
-- 21209

---SKILL DRILL---

--All employees born in 1953:
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1953-01-01' AND '1953-12-31';
	

SELECT count(first_name)
FROM employees
WHERE birth_date BETWEEN '1953-01-01' AND '1953-12-31';
-- 22857

--All employees born in 1954:
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1954-01-01' AND '1954-12-31';
	

SELECT count(first_name)
FROM employees
WHERE birth_date BETWEEN '1954-01-01' AND '1954-12-31';
-- 23228

--All employees born in 1955:
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1955-01-01' AND '1955-12-31';
	

SELECT count(first_name)
FROM employees
WHERE birth_date BETWEEN '1955-01-01' AND '1955-12-31';
-- 23104
---------

--Retirement Eligibility:
--All employees born between 1952 and 1955 also retiring in:
SELECT first_name, last_name
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31') 
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');
	
SELECT COUNT(first_name)
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31') 
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');
--41380

---

--EXPORTING OUT:
SELECT first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31') 
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

select * from retirement_info

------------

DROP TABLE retirement_info

--- Create a new table for retiring employees:
SELECT emp_no, first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');
-- Check the table
SELECT * FROM retirement_info;
---

-- Join dept and dept_manager table:
SELECT departments.dept_name,
     dept_manager.emp_no,
     dept_manager.from_date,
     dept_manager.to_date
FROM departments
INNER JOIN dept_manager
ON departments.dept_no = dept_manager.dept_no;
---

-- Joining retirement_info and dept_emp tables
SELECT retirement_info.emp_no,
    retirement_info.first_name,
    retirement_info.last_name,
    dept_emp.to_date
    FROM retirement_info
    LEFT JOIN dept_emp
    ON retirement_info.emp_no = dept_emp.emp_no;
----
-- Joining retirement_info and dept_emp tables
SELECT ri.emp_no,
    ri.first_name,
    ri.last_name,
    de.to_date
FROM retirement_info as ri
LEFT JOIN dept_emp as de
ON ri.emp_no = de.emp_no;
------
-- Joining departments and dept_manager tables
SELECT d.dept_name,
     dm.emp_no,
     dm.from_date,
     dm.to_date
FROM departments as d
INNER JOIN dept_manager as dm
ON d.dept_no = dm.dept_no;
----
SELECT ri.emp_no,
    ri.first_name,
    ri.last_name,
    de.to_date
INTO current_emp
FROM retirement_info as ri
LEFT JOIN dept_emp as de
ON ri.emp_no = de.emp_no
WHERE de.to_date = ('9999-01-01');
----
-- Employee count by department number
SELECT COUNT(ce.emp_no), de.dept_no
FROM current_emp as ce
LEFT JOIN dept_emp as de
ON ce.emp_no = de.emp_no
GROUP BY de.dept_no;
--
-- Employee count by department number
SELECT COUNT(ce.emp_no), de.dept_no
FROM current_emp as ce
LEFT JOIN dept_emp as de
ON ce.emp_no = de.emp_no
GROUP BY de.dept_no
ORDER BY de.dept_no;
--
-------------------------------------------------
--- LIST 1: emp_info list w/unique emp_id, name, gender, salary

SELECT emp_no, first_name, last_name, gender
INTO emp_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31') 
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

select * from emp_info
drop emp_info
--- JOIN emp_info w/salaries table:

SELECT e.emp_no, 
	e.first_name, 
	e.last_name, 
	e.gender, 
	s.salary, 
	de.to_date
INTO emp_info
FROM employees as e
INNER JOIN salaries as s
ON e.emp_no=s.emp_no
INNER JOIN dept_emp as de
ON e.emp_no=de.emp_no
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
	AND(e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
	AND (de.to_date='9999-01-01')

SELECT * FROM temp_emp_info

drop table temp_emp_info


--- List 2: managers leaving w/ dept no, dept name, emp_no, name, from_date, to_date

SELECT dm.dept_no, 
	d.dept_name, 
	dm.emp_no,
	ce.first_name, 
	ce.last_name, 
	dm.from_date, 
	dm.to_date
INTO manager_info
FROM dept_manager AS dm
INNER JOIN departments as d
ON dm.dept_no=d.dept_no
INNER JOIN current_emp as CE
ON (dm.emp_no=ce,emp_no);


----DROP TABLE emp_info
----DROP TABLE temp_emp_info
----RE-RUN NEW EMP_INFO
----RUN MANAGER_INFO


---LIST 3: dept retirees 

SELECT ce.emp_no,
	ce.first_name,
	ce.last_name,
	d.dept_name, 
INTO dept_info
FROM current_emp as ce
INNER JOIN dept_emp as de
ON ce.emp_no=de.emp_no
INNER JOIN departments AS d
ON de.dept_no=d.dept_no
---
select * from retirement_info


--- List 4: retirement info for sales w/ emp_no, emp names, dept_name

SELECT ri.emp_no,
	ri.first_name, 
	ri.last_name, 
	d.dept_name
INTO retirement_info_sales
FROM retirement_info as ri
INNER JOIN dept_emp as de
ON ri.emp_no=de.emp_no
INNER JOIN departments as d
ON de.dept_no=d.dept_no
WHERE dept_name= 'Sales'

-----
--- List 5: retirement info for sales and development w/ emp_no, emp names, dept_name

SELECT ri.emp_no,
	ri.first_name, 
	ri.last_name, 
	d.dept_name
INTO retirement_info_sales_dev
FROM retirement_info as ri
INNER JOIN dept_emp as de
ON ri.emp_no=de.emp_no
INNER JOIN departments as d
ON de.dept_no=d.dept_no
WHERE dept_name IN ('Sales', 'Development')



