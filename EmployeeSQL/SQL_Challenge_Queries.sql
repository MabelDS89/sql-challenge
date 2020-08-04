--Joining Tables
--1. List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT Salaries.emp_no, Salaries.salary, Employee_Details.first_name, Employee_Details.last_name, Employee_Details.sex
FROM Salaries
JOIN Employee_Details
	ON Salaries.emp_no = Employee_Details.emp_no;
	
--2. List first name, last name, and hire date for employees who were hired in 1986.

SELECT first_name, last_name, hire_date
FROM Employee_Details
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

--3. List the manager of each department with the following information: department number, department name, the manager's employee
--number, last name, first name.

SELECT Departments.dept_no, Departments.dept_name, Department_Managers.emp_no, Employee_Details.last_name, Employee_Details.first_name
FROM Departments
JOIN Department_Managers
	ON Departments.dept_no = Department_Managers.dept_no
JOIN Employee_Details
	ON Department_Managers.emp_no = Employee_Details.emp_no;
	
--4. List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT Employee_Details.emp_no, Employee_Details.last_name, Employee_Details.first_name, Departments.dept_name
FROM Employee_Details
JOIN Department_Employees
	ON Employee_Details.emp_no = Department_Employees.emp_no
JOIN Departments
	ON Departments.dept_no = Department_Employees.dept_no;
	
--5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

SELECT first_name, last_name, sex
FROM Employee_Details
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT Employee_Details.emp_no, Employee_Details.last_name, Employee_Details.first_name, Departments.dept_name
FROM Employee_Details
JOIN Department_Employees
	ON Employee_Details.emp_no = Department_Employees.emp_no
JOIN Departments
	ON Departments.dept_no = Department_Employees.dept_no
WHERE dept_name = 'Sales';

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and
--department name.

SELECT Employee_Details.emp_no, Employee_Details.last_name, Employee_Details.first_name, Departments.dept_name
FROM Employee_Details
JOIN Department_Employees
	ON Employee_Details.emp_no = Department_Employees.emp_no
JOIN Departments
	ON Departments.dept_no = Department_Employees.dept_no
WHERE dept_name = 'Sales' OR dept_name = 'Development';

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT Employee_Details.last_name, COUNT(last_name) AS "last_name count"
FROM Employee_Details
GROUP BY last_name
ORDER BY "last_name count" DESC;