-- Deliverable 1: steps 1-7
-- Get retiring employees and their titles
SELECT e.emp_no,
	e.first_name,
	e.last_name,
	ti.title,
	ti.from_date,
	ti.to_date
INTO retirement_titles_2
FROM employees as e
INNER JOIN titles as ti
	ON e.emp_no = ti.emp_no
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (ti.to_date = '9999-01-01')
ORDER BY e.emp_no;

-- Deliverable 1: steps 8-14
-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
	first_name,
	last_name,
	title
INTO unique_titles_2
FROM retirement_titles_2
ORDER BY emp_no, to_date DESC;

-- Deliverable 1: steps 15-21
-- Get count of titles that are retiring
SELECT COUNT(title) emp_no,
	title
INTO retiring_titles_2
FROM unique_titles_2
GROUP BY title
ORDER BY COUNT(title) DESC;

-- Deliverable 2: steps 1-11
-- Get mentoroship eligibility
SELECT DISTINCT ON (emp_no) e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	ti.title
INTO mentorship_eligibilty_2
FROM employees as e
INNER JOIN dept_emp as de
	ON (e.emp_no = de.emp_no)
INNER JOIN titles as ti
	ON (e.emp_no = ti.emp_no)
WHERE (de.to_date = '9999-01-01')
AND (birth_date BETWEEN '1960-01-01' AND '1970-12-31')
ORDER BY emp_no, ti.to_date DESC;
