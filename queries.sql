---- Queries
--- 1.-List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT em.emp_no, em.first_name, em.last_name, em.gender, sl.salary
FROM salaries as sl
LEFT JOIN employees as em 
ON em.emp_no=sl.emp_no;

--- 2.-List employees that were hired in 1986
SELECT em.emp_no, em.first_name, em.last_name, em.gender, em.hire_date
FROM employees as em
Where extract(year from  hire_date)=1986;

--- 3.-List the manager of each department with the following information: 
--- department number, department name, the manager's employee number, last name,
--- first name, and start and end employment dates.

SELECT dp.dept_no, dp.dept_name, mg.emp_no, em.last_name, em.first_name, mg.from_date, mg.to_date
From departments as dp
LEFT JOIN  dept_manager as mg
on dp.dept_no=mg.dept_no
LEFT JOIN employees as em
on mg.emp_no=em.emp_no;

---- 4.-List the department of each employee with the following information:
---- employee number, last name, first name, and department name.

SELECT em.emp_no, em.last_name, em.first_name, dp.dept_name
From employees as em
LEFT JOIN dept_emp as dpe
on em.emp_no=dpe.emp_no
LEFT JOIN departments as dp
on dpe.dept_no=dp.dept_no;

---- 5.-List all employees whose first name is "Hercules" and last names begin with "B."
SELECT * 
FROM employees
Where first_name='Hercules' and last_name like 'B%';

--- 6.-List all employees in the Sales department, including their employee number,
--- last name, first name, and department name.
SELECT dpe.emp_no, em.last_name, em.first_name, dp.dept_name
FROM dept_emp as dpe
INNER JOIN employees as em
ON dpe.emp_no=em.emp_no
INNER JOIN departments as dp
on dp.dept_no=dpe.dept_no
Where dept_name='Sales';

--- 7.-List all employees in the Sales and Development departments, 
---- including their employee number, last name, first name, and department name.
SELECT dpe.emp_no, em.last_name, em.first_name, dp.dept_name
FROM dept_emp as dpe
INNER JOIN employees as em
ON dpe.emp_no=em.emp_no
INNER JOIN departments as dp
on dp.dept_no=dpe.dept_no
Where dept_name='Sales' OR dept_name='Development';

---- 8.-In descending order, list the frequency count of employee last names, i.e., 
---- how many employees share each last name
Select last_name, count(last_name) as "Count Employees"
FROM employees
GROUP BY last_name
ORDER BY "Count Employees" DESC;

