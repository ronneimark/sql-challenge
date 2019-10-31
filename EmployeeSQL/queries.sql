--List the following details of each employee: employee number, last name, first name, gender, and salary.

SELECT e.emp_no, e.last_name, e.first_name, e.gender, s.salary
FROM employees e
LEFT JOIN salaries s
ON s.emp_no = e.emp_no;

--List employees who were hired in 1986.

SELECT emp_no, last_name, first_name, hire_date 
FROM employees
WHERE hire_date BETWEEN '1986-01-01' and '1986-12-31'
ORDER BY hire_date ASC;

--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.

SELECT m.emp_no, e.last_name, e.first_name, m.from_date, m.to_date, m.dept_no, d.dept_name
FROM dept_manager m
LEFT JOIN departments d
ON m.dept_no = d.dept_no
LEFT JOIN employees e
ON m.emp_no = e.emp_no;

--List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
LEFT JOIN dept_emp j
ON e.emp_no = j.emp_no
LEFT JOIN departments d
ON j.dept_no = d.dept_no;

--List all employees whose first name is "Hercules" and last names begin with "B."

SELECT first_name, last_name
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%'
ORDER BY last_name ASC;

--List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
LEFT JOIN dept_emp j
ON e.emp_no = j.emp_no
LEFT JOIN departments d
ON j.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
LEFT JOIN dept_emp j
ON e.emp_no = j.emp_no
LEFT JOIN departments d
ON j.dept_no = d.dept_no
WHERE d.dept_name IN  ('Sales', 'Development');

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT last_name, count(last_name)
FROM employees
GROUP BY last_name
ORDER BY count(last_name) ASC;

--Create a query of average salary by title to import to pandas to create barchart in matplotlib.

SELECT t.title, avg(s.salary)
FROM salaries s
JOIN titles t
ON s.emp_no = t.emp_no
GROUP BY t.title;