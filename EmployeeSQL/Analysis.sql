--Join tables employees and salaries to return employee salaries
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM salaries AS s
JOIN employees AS e ON (s.emp_no = e.emp_no);

--Create a view to save this new merged table
CREATE VIEW employee_salaries AS
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM salaries s
JOIN employees e ON (s.emp_no = e.emp_no);

--Check data in employee_salaries view
SELECT * 
FROM employee_salaries;

--List the first name, last name, and hire date
--for the employees who were hired in 1986.
SELECT first_name, last_name, CAST(hire_date as DATE)
FROM employees
WHERE hire_date >= CAST('1986-01-01' AS DATE) AND hire_date<= CAST('1986-12-31' AS DATE);

--List the manager of each department incluing their department number,
--department name, employee number, last name, and first name.
SELECT 
    dm.emp_no AS manager_emp_no,
    d.dept_no,
    d.dept_name,
    e.emp_no,
    e.last_name,
    e.first_name
FROM 
    dept_manager dm
JOIN employees e ON dm.emp_no = e.emp_no
JOIN departments d ON dm.dept_no = d.dept_no;

-- List the department number for each employee including employee’s employee number, 
-- last name, first name, and department name.
SELECT dept_emp.dept_no, 
       dept_emp.emp_no,
       employees.last_name, 
       employees.first_name,
       departments.dept_name
FROM dept_emp 
JOIN employees ON employees.emp_no = dept_emp.emp_no 
LEFT JOIN departments ON dept_emp.dept_no = departments.dept_no;


--List first name, last name, and sex of each employee whose first name is 
--Hercules and whose last name begins with the letter B.

SELECT first_name, last_name, sex
FROM employees
WHERE first_name = CAST('Hercules' AS VARCHAR) AND last_name LIKE 'B%';

--List each employee in the Sales department, including their employee number, last name, and first name.
SELECT e.emp_no, e.last_name, e.first_name
FROM dept_emp de
RIGHT JOIN employees e ON e.emp_no = de.emp_no AND de.dept_no = 'd007';

--List each employee in the Sales and Development departments, including
--their employee number, last name, first name, and department name.
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp de
JOIN employees e ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no
WHERE de.dept_no IN ('d007', 'd005');

--List the frequency counts, in descending order, of all the employee last names 
--(that is, how many employees share each last name).
SELECT last_name, COUNT(*) as frequency
FROM employees
GROUP BY last_name 
ORDER BY frequency DESC;


