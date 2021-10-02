-- Number of employees retiring
SELECT COUNT(first_name)
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');


-- Retirement eligibility
SELECT first_name, last_name
into retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Number of employees retiring
SELECT COUNT(first_name)
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');


-- Retirement eligibility
SELECT first_name, last_name
into retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT * FROM retirement_info;

drop table retirement_info;


SELECT emp_no, first_name, last_name
into retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');


--joining departments and dept_manager tables 

select dept_name, emp_no,from_date , to_date
from departments as d
inner join dept_manager as dm
on d.dept_no =dm.dept_no;


--joining retirment_info with dept_emp
select ri.emp_no , first_name , last_name ,to_date
into current_emp
from retirement_info as ri
left join dept_emp as de
on ri.emp_no=de.emp_no 
where to_date=('9999-01-01');

-- employee count by department 
SELECT  de.dept_no,d.dept_name,COUNT(ce.emp_no)
--into retirementlst_bydept
FROM current_emp as ce
LEFT JOIN dept_emp as de
ON ce.emp_no = de.emp_no
left join departments as d 
on de.dept_no=d.dept_no

GROUP BY de.dept_no,d.dept_name
order by de.dept_no;



-- Employee information 
-- find list of employees from retirement list 

select emp_no,first_name , last_name ,gender
into emp_info
from employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');


-- connect it with salary to add salary to the list  and dept_emp to find out if still working 
select e.emp_no ,first_name , last_name ,gender , salary
from emp_info as e
inner join salaries as s
on e.emp_no = s.emp_no
inner join dept_emp as de 
on e.emp_no=de.emp_no
where (de.to_date='9999-01-01')



-- List of managers per department
SELECT  dm.dept_no,
        d.dept_name,
        dm.emp_no,
        ce.last_name,
        ce.first_name,
        dm.from_date,
        dm.to_date
INTO manager_info
FROM dept_manager AS dm
    INNER JOIN departments AS d
        ON (dm.dept_no = d.dept_no)
    INNER JOIN current_emp AS ce
        ON (dm.emp_no = ce.emp_no);



SELECT ce.emp_no,
       ce.first_name,
       ce.last_name,
       d.dept_name
INTO dept_info
FROM current_emp as ce
INNER JOIN dept_emp AS de
ON (ce.emp_no = de.emp_no)
INNER JOIN departments AS d
ON (de.dept_no = d.dept_no);

-- list of retireing persos in sales department
select ri.emp_no , ri.first_name,ri.last_name , d.dept_name
from retirement_info as ri 
inner join dept_emp as de
on ri.emp_no =de.emp_no 
inner join departments as d 
on de.dept_no =d.dept_no
where d.dept_name='Sales'
order by emp_no

-- list of retiring persons in sales and development departements 
select ri.emp_no , ri.first_name,ri.last_name , d.dept_name
from retirement_info as ri 
inner join dept_emp as de
on ri.emp_no =de.emp_no 
inner join departments as d 
on de.dept_no =d.dept_no
where d.dept_name in ('Sales','Development')
order by emp_no
