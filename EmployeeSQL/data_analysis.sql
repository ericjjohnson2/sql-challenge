--List the employee number, last name, first name, sex, and salary of each employee
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees e
JOIN salaries s
ON e.emp_no = s.emp_no;

--List the first name, last name, and hire date for the employees who were hired in 1986.
--Referenced code from the following for the BETWEEN function: https://stackoverflow.com/questions/15817871/postgresql-filter-a-date-range
SELECT first_name, last_name, hire_date
FROM employees 
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

 --List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name 
FROM dept_manager dm
JOIN employees e
ON dm.emp_no = e.emp_no
JOIN departments d
ON dm.dept_no = d.dept_no;

 --List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT d.dept_no, e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
JOIN dept_emp de
ON e.emp_no = de.emp_no
JOIN departments d
ON d.dept_no = de.dept_no;

 --List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
 --Referenced for LIKE instead of = https://www.postgresql.org/docs/current/functions-matching.html#FUNCTIONS-LIKE
SELECT first_name, last_name, sex
FROM employees 
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

 --List each employee in the Sales department, including their employee number, last name, and first name.
SELECT d.dept_name, e.emp_no, e.last_name, e.first_name
FROM departments d
JOIN dept_emp de
ON d.dept_no = de.dept_no
JOIN employees e
ON de.emp_no = e.emp_no
WHERE d.dept_name = 'Sales';

 --List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
 --Was unsure from instructions whether this wanted someone in both sales and development but there was no one in both so did or instead. 
 --instructions not entirely clear
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM departments d
JOIN dept_emp de
ON d.dept_no = de.dept_no
JOIN employees e
ON de.emp_no = e.emp_no
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development';

 --List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name, count(emp_no) AS last_name_count
FROM employees
GROUP BY last_name
ORDER BY last_name_count DESC;