-- RETRIVING LIST OF EMPLOYEES WITH THEIR TITLE 
SELECT  e.emp_no,
        e.first_name,
		e.last_name,
		t.title, 
		t.from_date,
		t.to_date 
--INTO retirement_titles
FROM employees as e 
     INNER JOIN titles as t
ON e.emp_no=t.emp_no
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;


-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
       first_name, 
	   last_name,
	   title 
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no ,
to_date DESC;

---- finding retireing titles 
SELECT COUNT(emp_no) as count ,title
INTO retiring_titles
from unique_titles 
group by (title)
order by count desc;

-- MENTORSHIP ELIGIILITY 
SELECT  distinct on (e.emp_no) e.emp_no,
        e.first_name ,
		e.last_name,
		e.birth_date ,
		de.from_date,
		de.to_date ,
		t.title
INTO mentorship_eligibilty
from employees as e 
    inner join dept_emp as de 
on e.emp_no=de.emp_no
   inner join titles as t 
on e.emp_no=t.emp_no
where (de.to_date =('9999-01-01') ) and (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no 




