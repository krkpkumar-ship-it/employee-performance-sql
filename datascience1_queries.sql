SQL_projectwork:Datascienc1
Select your database and check your table

USE projectwork12;

SHOW TABLES;

SHOW TABLES FROM projectwork12;

Check column names and data types
DESCRIBE datascience1;

Display your data

DESCRIBE datascience1;

View selected columns:

SELECT EMP_ID, FIRST_NAME, DEPT, EXP
FROM datascience1;

Count all employee records:
SELECT COUNT(*) AS total_employees
FROM datascience1;

Filter records using WHERE
Employees working in India:
SELECT *
FROM datascience1
WHERE COUNTRY = 'INDIA';

Employees with more than five years of experience:
SELECT FIRST_NAME, LAST_NAME, EXP
FROM datascience1
WHERE EXP > 5;

Employees in Retail with more than five years of experience:
SELECT FIRST_NAME, DEPT, EXP
FROM datascience1
WHERE DEPT = 'RETAIL'
  AND EXP > 5;

Employees from India or the USA:

SELECT FIRST_NAME, COUNTRY
FROM datascience1
WHERE COUNTRY IN ('INDIA', 'USA');

Experience between three and six years, including both values:

SELECT FIRST_NAME, EXP
FROM datascience1
WHERE EXP BETWEEN 3 AND 6;


Sort results using ORDER BY
Most experienced employees first:

SELECT EMP_ID, FIRST_NAME, EXP
FROM datascience1
ORDER BY EXP DESC, EMP_ID ASC;

select EMP_ID, first_name, gender, role, dept, exp from datascience1
order by exp DESC, EMP_ID ASC;


Show the top three employees by experience:

SELECT EMP_ID, FIRST_NAME, EXP
FROM datascience1
ORDER BY EXP DESC, EMP_ID ASC
LIMIT 3;


Find unique values using DISTINCT
List departments without repeating them:

SELECT DISTINCT DEPT
FROM datascience1
ORDER BY DEPT;

List countries:
SELECT DISTINCT COUNTRY
FROM datascience1
ORDER BY COUNTRY;

Use aggregate functions
These functions calculate results across multiple rows.

SELECT
    COUNT(*) AS total_employees,
    MIN(EXP) AS minimum_experience,
    MAX(EXP) AS maximum_experience,
    ROUND(AVG(EXP), 2) AS average_experience,
    SUM(EXP) AS total_experience_years
FROM datascience1;

Summarise departments using GROUP BY
Count employees in each department:

SELECT DEPT, COUNT(*) AS employee_count
FROM datascience1
GROUP BY DEPT
ORDER BY employee_count DESC, DEPT ASC;

Calculate average experience for each department:

SELECT
    DEPT,
    COUNT(*) AS employee_count,
    ROUND(AVG(EXP), 2) AS average_experience
FROM datascience1
GROUP BY DEPT
ORDER BY average_experience DESC, DEPT ASC;
note: GROUP BY DEPT combines employees from the same department into one summary row.

Filter groups using HAVING
Show departments with at least three employees:

SELECT DEPT, COUNT(*) AS employee_count
FROM datascience1
GROUP BY DEPT
HAVING COUNT(*) >= 3
ORDER BY employee_count DESC, DEPT ASC;

note:-Remember:
- WHERE filters individual rows before grouping.
- HAVING filters the groups after grouping.

Practise text searches and categories
Find first names starting with D:

SELECT FIRST_NAME, LAST_NAME
FROM datascience1
WHERE FIRST_NAME LIKE 'D%';

select first_name, last_name from datascience1
where first_name like 'C%';


Combine first and last names:

SELECT
    EMP_ID,
    CONCAT_WS(' ', FIRST_NAME, LAST_NAME) AS full_name,
    DEPT
FROM datascience1;

Create experience categories for practice:

SELECT
    EMP_ID,
    FIRST_NAME,
    EXP,
    CASE
        WHEN EXP >= 10 THEN '10 or more years'
        WHEN EXP >= 5 THEN '5 to 9 years'
        ELSE 'Below 5 years or missing'
    END AS experience_category
FROM datascience1
ORDER BY EXP DESC, EMP_ID ASC;

Check for missing and duplicate IDs
Find missing employee IDs:

SELECT *
FROM datascience1
WHERE EMP_ID IS NULL
   OR TRIM(EMP_ID) = '';

Find repeated employee IDs:

SELECT EMP_ID, COUNT(*) AS occurrences
FROM datascience1
GROUP BY EMP_ID
HAVING COUNT(*) > 1;
