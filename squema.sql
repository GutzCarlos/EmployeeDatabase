DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS titles;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS employees;

--- Create a departments, employees, dept_manager, dept_emp, salaries and titles tables

CREATE TABLE departments (
    dept_no VARCHAR  NOT NULL ,
    dept_name VARCHAR  NOT NULL ,
    PRIMARY KEY (dept_no)
    );

CREATE TABLE employees (
    emp_no int  NOT NULL ,
    birth_date date  NOT NULL ,
    first_name VARCHAR  NOT NULL ,
    last_name VARCHAR  NOT NULL ,
    gender VARCHAR  NOT NULL ,
    hire_date date  NOT NULL ,
	PRIMARY KEY (emp_no)
    );

CREATE TABLE dept_manager (
    dept_no VARCHAR  NOT NULL ,
    emp_no int  NOT NULL ,
    from_date date  NOT NULL ,
    to_date date  NOT NULL ,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE dept_emp (
    emp_no int  NOT NULL ,
    dept_no VARCHAR NOT NULL ,
    from_date date NOT NULL ,
    to_date date NOT NULL ,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
    );

CREATE TABLE salaries (
    emp_no int  NOT NULL ,
    salary int  NOT NULL ,
    from_date date  NOT NULL ,
    to_date date NOT NULL ,
    PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
    );

CREATE TABLE titles (
    emp_no int  NOT NULL ,
    title VARCHAR  NOT NULL ,
    from_date date NOT NULL ,
    to_date date NOT NULL ,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
    );