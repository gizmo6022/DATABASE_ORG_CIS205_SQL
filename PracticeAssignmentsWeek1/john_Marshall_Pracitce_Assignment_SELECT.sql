/*
John Marshall
Practice Exercise- Sample Database Tutorial Basic SELECT Statement
Summer II 2023
7/12/2023
*/


SELECT lastName
FROM employees;

SELECT
lastname, firstname, jobtitle
FROM
employees;

SELECT *
FROM employees;

SELECT
lastname, firstname, jobtitle
FROM
employees
WHERE
jobtitle = 'Sales Rep';

SELECT
lastname, firstname, jobtitle, officeCode
FROM
employees
WHERE
jobtitle = 'Sales Rep' AND officeCode = 1;

SELECT
lastName, firstName, reportsTo
FROM
employees
WHERE
reportsTo IS NULL;

SELECT
lastname, firstname, jobtitle
FROM
employees
WHERE
jobtitle <> 'Sales Rep';

SELECT
lastname, firstname, officeCode
FROM
employees
WHERE
officecode > 5;

SELECT
lastname, firstname, officeCode
FROM
employees
WHERE
officecode <= 4;
