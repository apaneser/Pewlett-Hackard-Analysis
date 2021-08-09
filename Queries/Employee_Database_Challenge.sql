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