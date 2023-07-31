--List the employee number, last name, first name, sex, and salary of each employee.
SELECT
    e.emp_no,
    e.last_name,
    e.first_name,
    e.sex,
    s.salary
FROM
    employee AS e
INNER JOIN
    salary AS s ON e.emp_no = s.emp_no;
	
--List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT 
	first_name,
	last_name,
	hire_date
FROM 
	employee
WHERE 
	hire_date >= '1986-01-01'
	AND hire_date < '1987-01-01';

--List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT
    dm.dept_no,
    d.dept_name,
    dm.emp_no AS manager_emp_no,
    e.last_name AS manager_last_name,
    e.first_name AS manager_first_name
FROM
    dept_manager AS dm
INNER JOIN
    employee AS e ON dm.emp_no = e.emp_no
INNER JOIN
    department AS d ON dm.dept_no = d.dept_no;

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.	
SELECT 
	de.dept_no,
	de.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
FROM 
	department_employee AS de
INNER JOIN 	
	employee AS e ON de.emp_no = e.emp_no
INNER JOIN
	department AS d ON de.dept_no = d.dept_no;

--List the first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT
	e.first_name,
	e.last_name,
	e.sex
FROM employee AS e
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

--List each employee in the Sales department, including their employee number, last name, and first name.
SELECT 
    e.emp_no,
    e.last_name,
    e.first_name,
FROM 
    department_employee AS de
INNER JOIN
    employee AS e ON de.emp_no = e.emp_no
INNER JOIN
    department AS d ON de.dept_no = d.dept_no
WHERE
    d.dept_name = 'Sales';

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT
	e.emp_no,
	e.last_name,
    e.first_name,
	d.dept_name
FROM 
    department_employee AS de
INNER JOIN
    employee AS e ON de.emp_no = e.emp_no
INNER JOIN
    department AS d ON de.dept_no = d.dept_no
WHERE
    d.dept_name = 'Sales' OR d.dept_name = 'Development';

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT
    last_name,
    COUNT(*) AS frequency_count
FROM
    employee
GROUP BY
    last_name
ORDER BY
    frequency_count DESC;