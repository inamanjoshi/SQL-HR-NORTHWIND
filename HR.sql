use hr;

-- Q1. Write a query to display the names (first_name, last_name) using alias name “First Name", "Last Name".

SELECT
	first_name "first name", last_name "last name"
FROM 
	employees;

-- Q2. Write a query to get unique department ID from employee table.

SELECT distinct
	department_id
FROM
	employees;
    
-- Q3. Write a query to get all employee details from the employee table order by first name, descending.

SELECT *
FROM
	employees
ORDER BY
	first_name desc;
    
-- Q4. Write a query to get the names (first_name, last_name), salary, PF of all the employees (PF is calculated as 15% of salary).

SELECT
	first_name, last_name, salary, salary*.15 "Salary PF"
FROM
	employees;
    
-- Q5. Write a query to get the employee ID, names (first_name, last_name), salary in ascending order of salary.

SELECT
	employee_id, first_name, last_name, salary
FROM
	employees
ORDER BY 
	salary;
    
-- Q6. Write a query to get the total salaries payable to employees.

SELECT
	sum(salary)
FROM
	employees;
    
-- Q7. Write a query to get the maximum and minimum salary from employees table.

SELECT
	max(salary) "Maximum Salary", min(salary) "Minimum Salary"
FROM
	employees;
    
-- Q8. Write a query to get the average salary and number of employees in the employees table.

SELECT
	avg(salary) "Average Salary", Count(*)
FROM
	employees;
    
-- Q9. Write a query to get the number of employees working with the company.

SELECT
	Count(*)
FROM
	employees;
    
-- Q10. Write a query to get the number of jobs available in the employees table.

SELECT
	count(distinct job_id) "Jobs Available" 
FROM
	employees;
    
-- Q11. Write a query get all first name from employees table in upper case.

SELECT
	upper(first_name)
FROM
	employees;

-- Q12. Write a query to get the first 3 characters of first name from employees table.

SELECT
	substring(first_name,1,3) "First 3 Characters"
FROM
	employees;
    
-- Q13. Write a query to get first name from employees table after removing white spaces from both side.

SELECT
	trim(first_name)
FROM
	employees;
    
-- Q14. Write a query to get the length of the employee names (first_name, last_name) from employees table.

SELECT
	first_name, Length(first_name), last_name, Length(last_name)
FROM
	employees;
    
-- Q15. Write a query to check if the first_name fields of the employees table contains numbers.

SELECT 
	first_name
FROM 
	employees 
WHERE
	first_name REGEXP'[0-9]';
    
-- Q16. Write a query to display the name (first_name, last_name) and salary for all employees whose salary is not in the range $10,000 through $15,000.

SELECT
	first_name, last_name, salary
FROM
	employees
WHERE 
	salary not between 10000 and 15000;

-- Q17. Write a query to display the name (first_name, last_name) and department ID of all employees in departments 30 or 100 in ascending order.

SELECT
	first_name, last_name, department_id
FROM
	employees
WHERE
	department_id in(30,100)
ORDER BY 
	department_id;
    
-- Q18. Write a query to display the name (first_name, last_name) and salary for all employees whose salary is not in the range $10,000 through $15,000 and are in department 30 or 100.

SELECT
	first_name, last_name, salary, department_id
FROM
	employees
WHERE
	salary not between 10000 and 15000
AND
	department_id in(30,100);

-- Q19. Write a query to display the name (first_name, last_name) and hire date for all employees who were hired in 1987.

SELECT
	first_name, last_name, hire_date
FROM
	employees
WHERE
	hire_date like'%1987%';
    
-- 20. Write a query to display the first_name of all employees who have both "b" and "c" in their first name.

SELECT
	first_name
FROM
	employees
WHERE 
	first_name like '%b%' and first_name like '%c%';
    
-- Q21. Write a query to display the last name, job, and salary for all employees whose job is that of a Programmer or a Shipping Clerk, and whose salary is not equal to $4,500, $10,000, or $15,000.

select * from employees;
SELECT
	last_name, job_id, salary
FROM
	employees
WHERE
	job_id in ('IT_PROG','SH_CLERK')
AND
	salary not in (4000,10000,15000);
    
-- Q22. Write a query to display the last name of employees whose names have exactly 6 characters.

SELECT
	last_name
FROM
	employees
WHERE
	last_name like '______';
    
-- Q23. Write a query to display the last name of employees having 'e' as the third character.

SELECT
	last_name
FROM
	employees
WHERE
	last_name like '__e%';
    
-- Q24. Write a query to get the job_id and related employee's id.

SELECT
	job_id, group_concat(employee_id)
FROM
	employees
GROUP BY
	job_id;
    
-- Q25. Write a query to update the portion of the phone_number in the employees table, within the phone number the substring '124' will be replaced by '999'.

SELECT * FROM employees;
SET SQL_SAFE_UPDATES = 0;
UPDATE
	employees
SET
	phone_number = REPLACE(phone_number,'124','999')
WHERE
	phone_number like '%124%';

-- Q26. Write a query to get the details of the employees where the length of the first name greater than or equal to 8.

SELECT * FROM employees
WHERE
	length(first_name) >= 8;

-- Q27. Write a query to append '@example.com' to email field.
SELECT * FROM employees;
UPDATE
	employees
SET
	email= concat(email,'@example.com');
    
-- Q28. Write a query to extract the last 4 character of phone numbers.

SELECT
	RIGHT(phone_number,4)
FROM
	employees;
    
-- Q29. Write a query to get the last word of the street address.

SELECT * FROM locations;
SELECT
	street_address, 
    SUBSTRING_INDEX(REPLACE(street_address,',',' '),' ',-1) 'LAST WORD'
FROM
	locations;

-- Q30. Write a query to get the locations that have minimum street length.

SELECT * FROM locations
WHERE
	length(street_address) <= (SELECT MIN(length(street_address)) from locations);

-- Q31. Write a query to display the first word from those job titles which contains more than one words.

SELECT * FROM jobs;
SELECT 
	job_title, 
	SUBSTR(job_title,1, INSTR(job_title, ' ')-1) 'FIRST WORD'
FROM jobs;

-- Q32. Write a query to display the length of first name for employees where last name contain character 'c' after 2nd position.

SELECT
	first_name, length(first_name) 'LENGTH OF FIRST NAME', last_name
FROM
	employees
WHERE
	last_name like '__c%';
    
-- Q33. Write a query that displays the first name and the length of the first name for all employees whose name starts with the letters 'A', 'J' or 'M'. Give each column an appropriate label. Sort the results by the employees' first names.

SELECT
	first_name 'FIRST NAME', length(first_name) 'LENGTH'
FROM
	employees
WHERE
	first_name like 'A%'
OR
    first_name like 'J%'
OR
	first_name like 'M%'
ORDER BY
	first_name;
    
-- Q34. Write a query to display the first name and salary for all employees. Format the salary to be 10 characters long, left-padded with the $ symbol. Label the column SALARY.

SELECT
	first_name, lpad(salary,10,'$') salary
FROM
	employees;
    
-- Q35. Write a query to display the first eight characters of the employees' first names and indicates the amounts of their salaries with '$' sign. Each '$' sign signifies a thousand dollars. Sort the data in descending order of salary.

SELECT 
	LEFT(first_name, 8),
	REPEAT('$',(salary/1000)) 'SALARY($)', salary
FROM 
	employees
ORDER BY 
	salary DESC;

-- Q36. Write a query to display the employees with their code, first name, last name and hire date who hired either on seventh day of any month or seventh month in any year.

SELECT
	employee_id, first_name, last_name, hire_date
FROM
	employees
WHERE
	position("07" in date_format(hire_date,'%d %m %y'))>0;