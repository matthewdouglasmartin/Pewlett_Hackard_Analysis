-- Joining Employees and Titles table on emp_no
SELECT employees.emp_no,
    employees.first_name,
    employees.last_name,
    titles.titles,
    titles.from_date,
    titles.to_date
INTO Retirement_Titles
FROM employees
INNER JOIN titles
ON (employees.emp_no = titles.emp_no)
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY employees.emp_no;

-- Use Distinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
titles

INTO Unique_Titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;

-- Number of employees retiring by job title
SELECT COUNT (unique_titles.emp_no), unique_titles.titles
INTO Retiring_Titles
FROM unique_titles
GROUP BY unique_titles.titles
ORDER BY count DESC;

-- Joining Employees, Department Employee and Titles tables
SELECT Distinct ON (employees.emp_no) employees.emp_no,
    employees.first_name,
    employees.last_name,
    employees.birth_date,
    dept_emp.from_date,
    dept_emp.to_date,
    titles.titles
INTO Mentorship_Eligibility
FROM employees
INNER JOIN dept_emp
    ON employees.emp_no = dept_emp.emp_no
INNER JOIN titles
    ON employees.emp_no = titles.emp_no
WHERE (birth_date BETWEEN '1965-01-01' AND '1965-12-31')
    AND dept_emp.to_date = ('9999-01-01')
ORDER BY emp_no;