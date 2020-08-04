DROP TABLE Employee_Titles CASCADE;

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
	FOREIGN KEY (emp_no) REFERENCES Department_Managers (emp_no),
	FOREIGN KEY (dept_no) REFERENCES Departments (dept_no));
	
SELECT * FROM Department_Employees;

CREATE TABLE Salaries (
	emp_no INTEGER NOT NULL,
	salary INTEGER NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES Department_Managers (emp_no));
	
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
	FOREIGN KEY (title_id) REFERENCES Employee_Details (emp_title_id));
	
SELECT * FROM Employee_Titles;