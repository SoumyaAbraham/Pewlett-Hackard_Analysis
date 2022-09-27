

--DELIVERABLE 1: 
-- i. retirement_titles w/ emp_no, names, birth_date between 1952 and 1955. 

SELECT e.emp_no,
	   e.first_name,
       e.last_name,
       t.title,
       t.from_date,
       t.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no

SELECT * FROM retirement_titles



-- ii.  unique_titles w/distinct on statement for most recent title.
-- 		Exclude employees who have left the company

SELECT DISTINCT ON (e.emp_no)
	   e.emp_no,
	   e.first_name,
       e.last_name,
       t.title,
       t.from_date,
       t.to_date
-- INTO unique_titles
FROM employees as e
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND to_date='9999-01-01'
order by e.emp_no, from_date DESC;

SELECT emp_no, first_name, last_name, title 
INTO unique_title
FROM unique_titles;

--iii. Retrieve number of titles from unique_titles table:

SELECT count(emp_no), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count(emp_no) DESC
SELECT * FROM retiring_titles;


-- DELIVERABLE 2:

SELECT DISTINCT ON (e.emp_no)
	   e.emp_no,	
	   e.first_name,
       e.last_name,
	   e.birth_date,
       de.from_date,
       de.to_date,
	   t.title
INTO mentorship_eligibility
FROM employees as e
LEFT JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
LEFT JOIN titles as t
ON (e.emp_no=t.emp_no)
WHERE (de.to_date='9999-01-01')
AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no

SELECT * FROM mentorship_eligibility

SELECT emp_no, first_name, last_name, title 
INTO unique_title
FROM unique_titles;

--iii. Retrieve number of titles from unique_titles table:

SELECT count(emp_no), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count(emp_no) DESC
SELECT * FROM retiring_titles;


-- DELIVERABLE 2:

SELECT DISTINCT ON (e.emp_no)
	   e.emp_no,	
	   e.first_name,
       e.last_name,
	   e.birth_date,
       de.from_date,
       de.to_date,
	   t.title
INTO mentorship_eligibility
FROM employees as e
LEFT JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
LEFT JOIN titles as t
ON (e.emp_no=t.emp_no)
WHERE (de.to_date='9999-01-01')
AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no

SELECT * FROM mentorship_eligibility


--BONUS: The count of eligible mentors for each title:

SELECT count(emp_no), title
INTO mentorship_count
FROM mentorship_eligibility
GROUP BY title
ORDER BY count(emp_no) DESC
SELECT * FROM mentorship_count;

ALTER TABLE mentorship_count
RENAME COLUMN count TO mentor_count;

-- Create new table to show trainee count and mentor count
--for each title:

SELECT rt.title,
	rt.count, 
	mc.mentor_count
INTO stat
FROM retiring_titles as rt
INNER JOIN mentorship_count as mc
ON rt.title=mc.title
ORDER BY rt.count

SELECT * FROM stat

ALTER TABLE stat
RENAME COLUMN count TO trainee_count;

SELECT * from stat

