-- Challenge code

-- For this analysis, create a table containing the number of employees 
-- who are about to retire (those born 1952-1955), grouped by job title. 
-- Using your ERD as a reference, create this table with an inner join. 
-- Your table will contain the following information: 
-- Employee number, First and last name, Title, from_date, Salary

CREATE TABLE retire (
	emp_no INT NOT NULL,
    first_name VARCHAR NOT NULL,
    last_name VARCHAR NOT NULL,
    title VARCHAR NOT NULL,
    from_date DATE NOT NULL,
	salary INT NOT NULL,
    PRIMARY KEY (emp_no)
)

SELECT * FROM retire

SELECT re.emp_no,
	re.first_name,
	re.last_name,
	ti.title,
	ti.from_date,
	ti.to_date,
	s.salary, re.birth_date	
-- INTO retired1
FROM emp_info as re
	INNER JOIN titles as ti
		ON (re.emp_no = ti.emp_no)
	INNER JOIN salaries as s
		ON (re.emp_no = s.emp_no)
;
-- Retirement eligibility
SELECT emp_no, first_name, last_name, gender
INTO emp_info2
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
;
select * from emp_info2
-- De-duplicate retiree eligble list
SELECT emp_no,
	first_name,
	last_name,
	title,
	from_date, salary
-- INTO retire_deduped2
FROM
	(SELECT emp_no,
	first_name,
	last_name,
	title,
 	from_date, salary, ROW_NUMBER() OVER
	(PARTITION BY (emp_no)
	ORDER BY from_date DESC) rn
 	FROM retire
 ) tmp WHERE rn = 1
ORDER BY emp_no;

--count total titles
SELECT COUNT(DISTINCT title)
INTO count_titles
FROM retire_deduped;

select * from count_titles;

--count of employees set for retirement by title
SELECT title,
    COUNT(emp_no)
INTO emp_count_by_title
FROM retire_deduped2
GROUP BY title;

select * from emp_count_by_title;

SELECT * FROM retire_deduped2;

SELECT e.emp_no, e.first_name, e.last_name, t.title, t.from_date, t.to_date
INTO mentorship
FROM employees as e
	INNER JOIN titles as t ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
	AND (t.to_date = '9999-01-01');
	
-- Check the table for dupes
SELECT emp_no, count(*)
FROM mentorship
GROUP BY emp_no
HAVING count(*) > 1;
-- 0 dupes found; change HAVING equal to 1 also verified same # of rows as mentorship table

SELECT * FROM retire_deduped2;