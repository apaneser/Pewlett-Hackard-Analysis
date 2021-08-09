SELECT e.emp_no, e.first_name, e.last_name, t.title, t.from_date, t.to_date
INTO emp_title
FROM employees as e
INNER JOIN title as t
ON e.emp_no = t.emp_no

SELECT DISTINCT ON (emp_no) e.emp_no, e.first_name, e.last_name, t.title, t.from_date, t.to_date
INTO unique_titles
FROM employees as e
INNER JOIN title as t
ON e.emp_no = t.emp_no
WHERE e.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY emp_no ASC;

SELECT Count(title), title
INTO retireing_titles
FROM unique_titles as ut
GROUP BY title
ORDER BY Count(title) DESC;

SELECT DISTINCT ON (emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date, 
	de.from_date, de.to_date, t.title
INTO mentorship_eligibility
FROM employees as e
LEFT JOIN title as t
ON e.emp_no = t.emp_no
LEFT JOIN dept_emp as de
ON e.emp_no = de.emp_no
WHERE (de.to_date = '9999-01-01') 
AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY emp_no ASC