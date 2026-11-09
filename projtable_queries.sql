

**Confirm your database, table, and row count**



USE projectwork12;



SHOW TABLES;



DESCRIBE projtable1;



SELECT COUNT(\*) AS total\_projects

FROM projtable1;



**See all projects and sort by name**

SELECT \*

FROM projtable1

ORDER BY PROJ\_NAME ASC;



note: SELECT \* shows every column. ORDER BY ... ASC sorts from A to Z. Drug Discovery should appear first.



**Use WHERE to filter completed projects:**

SELECT PROJECT\_ID, PROJ\_NAME, DOMAIN, STATUS

FROM projtable1

WHERE STATUS = 'DONE'

ORDER BY PROJECT\_ID;



note:-Expected result. Two rows, P103 Drug Discovery and P105 Fraud Detection. To practice a second filter, change 'DONE' to 'WIP' and run the query again. You should see P204 and P406.



**Use GROUP BY to count projects by status**

SELECT STATUS, COUNT(\*) AS project\_count

FROM projtable1

GROUP BY STATUS

ORDER BY project\_count DESC, STATUS ASC;



**Use HAVING to find domains with at least two projects**



SELECT DOMAIN, COUNT(\*) AS project\_count

FROM projtable1

GROUP BY DOMAIN

HAVING COUNT(\*) >= 2

ORDER BY DOMAIN;



**Convert the date text and calculate the days between dates**



**slashes, so this query replaces hyphens with slashes before converting the text to dates. It interprets the values as month/day/year, consistent with entries such as 07/15/2021 and 6/20/2021.**



SELECT \*

FROM projectwork12.projtable1

LIMIT 2;



SHOW COLUMNS FROM projectwork12.projtable1;



SELECT

&#x20;   PROJECT\_ID,

&#x20;   PROJ\_NAME,

&#x20;   `START \_DATE` AS start\_date\_text,

&#x20;   CLOSURE\_DATE,

&#x20;   DATEDIFF(

&#x20;       STR\_TO\_DATE(TRIM(CLOSURE\_DATE), '%m/%d/%Y'),

&#x20;       STR\_TO\_DATE(REPLACE(TRIM(`START \_DATE`), '-', '/'), '%m/%d/%Y')

&#x20;   ) AS days\_between\_dates

FROM projectwork12.projtable1

ORDER BY PROJECT\_ID;



**Check which table you can join next**



SHOW TABLES FROM projectwork12;







**select \* from projtable1**

**order by proj\_name ASC;**



**Your screenshot confirms that projectwork12.projtable1 has six rows and includes PROJECT\_ID, PROJ\_NAME, and DOMAIN. You can run your first JOIN with this table alone by finding pairs of projects in the same domain.**



**Run this JOIN in MySQL Workbench**



SELECT

&#x20;   p1.DOMAIN,

&#x20;   p1.PROJECT\_ID AS first\_project\_id,

&#x20;   p1.PROJ\_NAME AS first\_project,

&#x20;   p2.PROJECT\_ID AS second\_project\_id,

&#x20;   p2.PROJ\_NAME AS second\_project

FROM projectwork12.projtable1 AS p1

INNER JOIN projectwork12.projtable1 AS p2

&#x20;   ON p1.DOMAIN = p2.DOMAIN

&#x20;  AND p1.PROJECT\_ID < p2.PROJECT\_ID

ORDER BY p1.DOMAIN, p1.PROJECT\_ID;





