Database: projectwork12
Table: emprecord1
Columns including EMP_ID, FIRST_NAME, LAST_NAME,
 GENDER, ROLE, DEPT, EXP, COUNTRY, CONTINENT,
SALARY, EMP_RATING, MANAGER_ID, and PROJ_ID.

Select your database
USE projectwork12;

Confirm your table name
SHOW TABLES;

Check column names and data types
DESCRIBE emprecord1;

Note: For calculations, SALARY, EXP, and EMP_RATING should have numeric types such as INT, DECIMAL, or DOUBLE. If they show TEXT or VARCHAR, share the result before relying on numeric sorting or calculations.

Display your imported records
SELECT *FROM emprecord1;
Note:-* means all columns.

Count how many employees were imported:
SELECT COUNT(*) AS total_employees
FROM emprecord1;

Display only the columns you need
SELECT EMP_ID, FIRST_NAME, LAST_NAME, DEPT, SALARY
FROM emprecord1;

Filter records using WHERE
Employees in the Finance department:
SELECT EMP_ID, FIRST_NAME, DEPT, SALARY
FROM emprecord1
WHERE DEPT = 'FINANCE';

Employees earning more than 8,000:

SELECT EMP_ID, FIRST_NAME, SALARY
FROM emprecord1
WHERE SALARY > 8000;

select EMP_ID, first_name, salary from emprecord1
where salary < 8000;

Employees with 5 to 10 years of experience, including both limits:
SELECT EMP_ID, FIRST_NAME, EXP
FROM emprecord1
WHERE EXP BETWEEN 5 AND 10;

Combine conditions using AND and IN
Finance employees earning more than 8,000:
SELECT EMP_ID, FIRST_NAME, DEPT, SALARY
FROM emprecord1
WHERE DEPT = 'FINANCE'
  AND SALARY > 8000;

Employees in either Finance or Healthcare:
SELECT EMP_ID, FIRST_NAME, DEPT
FROM emprecord1
WHERE DEPT IN ('FINANCE', 'HEALTHCARE');

Sort results using ORDER BY
Show the highest salaries first:

SELECT EMP_ID, FIRST_NAME, SALARY
FROM emprecord1
ORDER BY SALARY DESC;

Show the three highest-paid employee records:
SELECT EMP_ID, FIRST_NAME, SALARY
FROM emprecord1
ORDER BY SALARY DESC, EMP_ID ASC
LIMIT 3;

note:-DESC means descending. ASC means ascending. This returns three employees; employees tied on salary are ordered by employee ID.

Use group functions
Calculate salary totals and averages:

SELECT
    COUNT(*) AS total_employees,
    MIN(SALARY) AS lowest_salary,
    MAX(SALARY) AS highest_salary,
    ROUND(AVG(SALARY), 2) AS average_salary,
    SUM(SALARY) AS total_salary
FROM emprecord1;

Use GROUP BY
Count employees in each department:
SELECT DEPT, COUNT(*) AS employee_count
FROM emprecord1
GROUP BY DEPT
ORDER BY employee_count DESC, DEPT ASC;

Calculate the average salary for each department:
SELECT
    DEPT,
    COUNT(*) AS employee_count,
    ROUND(AVG(SALARY), 2) AS average_salary
FROM emprecord1
GROUP BY DEPT
ORDER BY average_salary DESC;

note:- GROUP BY DEPT puts employees from the same department into a group before calculating the results.

Filter groups using HAVING
Show departments with more than two employees:

SELECT DEPT, COUNT(*) AS employee_count
FROM emprecord1
GROUP BY DEPT
HAVING COUNT(*) > 2
ORDER BY employee_count DESC;

note:-WHERE filters individual rows.
HAVING filters calculated groups.

Create salary categories using CASE

SELECT
    EMP_ID,
    FIRST_NAME,
    SALARY,
    CASE
        WHEN SALARY >= 10000 THEN 'High'
        WHEN SALARY >= 7000 THEN 'Medium'
        ELSE 'Low'
    END AS salary_level
FROM emprecord1
ORDER BY SALARY DESC;

note: These thresholds are practice rules: High is 10,000 or above; Medium is 7,000 to below 10,000; Low is below 7,000.


Use a JOIN to display employee and manager names
Your table has both EMP_ID and MANAGER_ID, so we can join the table to itself:

SELECT
    e.EMP_ID,
    CONCAT_WS(' ', e.FIRST_NAME, e.LAST_NAME) AS employee_name,
    e.MANAGER_ID,
    CONCAT_WS(' ', m.FIRST_NAME, m.LAST_NAME) AS manager_name
FROM emprecord1 AS e
LEFT JOIN emprecord1 AS m
    ON e.MANAGER_ID = m.EMP_ID
ORDER BY e.EMP_ID;

note:- Here, e represents employees and m represents managers. LEFT JOIN keeps every employee, including employees without a matching manager.

Check your imported data

SELECT EMP_ID, FIRST_NAME, SALARY, EMP_RATING
FROM emprecord1
WHERE EMP_RATING NOT BETWEEN 1 AND 5
   OR EMP_RATING IS NULL;

Check for repeated employee IDs:
SELECT EMP_ID, COUNT(*) AS occurrences
FROM emprecord1
GROUP BY EMP_ID
HAVING COUNT(*) > 1;
