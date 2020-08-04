DROP TABLE Salaries CASCADE;

--Create and preview tables

CREATE TABLE Departments (
	dept_no VARCHAR PRIMARY KEY,
	dept_name VARCHAR NOT NULL);
	
SELECT * FROM Departments;
	
CREATE TABLE Department_Managers (
	dept_no VARCHAR NOT NULL,
	emp_no INTEGER NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES Departments (dept_no),
	PRIMARY KEY (emp_no));
	
SELECT * FROM Department_Managers;

CREATE TABLE Department_Employees (
	emp_no INTEGER NOT NULL,
	dept_no VARCHAR NOT NULL,
	PRIMARY KEY (emp_no, dept_no));
	
SELECT * FROM Department_Employees;

CREATE TABLE Salaries (
	emp_no INTEGER NOT NULL,
	salary INTEGER NOT NULL,
	PRIMARY KEY (emp_no, salary));
	
SELECT * FROM Salaries;
	
CREATE TABLE Employee_Details (
	emp_no INTEGER NOT NULL,
	emp_title_id VARCHAR NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	sex VARCHAR NOT NULL,
	hire_date DATE NOT NULL,
	PRIMARY KEY (emp_title_id),
	FOREIGN KEY (emp_no) References Department_Managers (emp_no));
	
SELECT * FROM Employee_Details;
	
CREATE TABLE Employee_Titles (
	title_id VARCHAR NOT NULL,
	title VARCHAR NOT NULL,
	PRIMARY KEY (title_id, title));
	
SELECT * FROM Employee_Titles;

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