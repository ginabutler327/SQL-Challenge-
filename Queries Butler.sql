--check if tables are within the database
SELECT table_name 
FROM information_schema.tables 
WHERE table_schema = 'public'; 

--List the employee number, last name, first name, sex, and salary of each employee.
SELECT e.emp_no,
       e.last_name,
       e.first_name,
       e.sex,
	   de.salary
FROM public."Employees" e
JOIN public."Salaries" de ON e.emp_no = de.emp_no  
WHERE de.salary = "salary"
ORDER BY e.emp_no;
	
--List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT
	first_name,
	last_name,
	hire_date
FROM
	public."Employees"
WHERE
	extract(year from hire_date) = 1986
ORDER BY
	hire_date, last_name, first_name;

--List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT
    e.emp_no,
    e.first_name,
    e.last_name,
    d.dept_name,
    d.dept_no
FROM
    public."Employees" e
JOIN
    public."Dept_manager" de ON e.emp_no::integer = de.emp_no
JOIN
    public."Departments" d ON de.dept_no = d.dept_no
ORDER BY
    e.last_name ASC, e.first_name ASC;
	
--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT
    e.emp_no,
    e.first_name,
    e.last_name,
    d.dept_name,
    d.dept_no
FROM
    public."Employees" e
JOIN
    public."Dept_emp" de ON e.emp_no = de.emp_no
JOIN
    public."Departments" d ON de.dept_no = d.dept_no
ORDER BY
    e.last_name ASC, e.first_name ASC;

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name,
       last_name,
       sex
FROM public."Employees"
WHERE 
    first_name = 'Hercules'
AND
    last_name LIKE 'B%';
--List each employee in the Sales department, including their employee number, last name, and first name.
SELECT
    e.emp_no,
    e.first_name,
    e.last_name,
    d.dept_name
FROM
    public."Employees" e
    JOIN public."Dept_emp" de ON e.emp_no = de.emp_no
    JOIN public."Departments" d ON de.dept_no = d.dept_no
WHERE
    d.dept_name = 'Sales'
ORDER BY
    e.last_name ASC, e.first_name ASC;
	
--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT
    e.emp_no,
    e.first_name,
    e.last_name,
    d.dept_name
FROM
    public."Employees" e
    JOIN public."Dept_emp" de ON e.emp_no = de.emp_no
    JOIN public."Departments" d ON de.dept_no = d.dept_no
WHERE
    d.dept_name IN ('Sales', 'Development')
ORDER BY
    e.last_name ASC, e.first_name ASC;
--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT
    last_name,
    COUNT(*) AS frequency_count
FROM
    public."Employees"
GROUP BY
    last_name
ORDER BY
    frequency_count DESC;