--Deliverable 1
-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title

INTO unique_titles 
FROM retirement_titles as rt
ORDER BY rt.emp_no, rt.to_date DESC

--Retiring Titles 
SELECT COUNT(emp_no), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count;

--Deliverable 2
--The Employees Eligible for the Mentorship Program 
SELECT DISTINCT ON (e.emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date, 
					de.from_date, de.to_date,
					t.title
INTO mentorship_eligibility
FROM employees as e
INNER JOIN dept_emp as de 
	ON e.emp_no = de.emp_no
INNER JOIN titles as t 
	on e.emp_no = t.emp_no
WHERE e.birth_date BETWEEN '1/1/1965' AND '12/31/1965'
	AND de.to_date = '1/1/9999'
ORDER BY e.emp_no;
