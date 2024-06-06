/*
John Marshall
Practice Exercise- Sample Database Tutorial Basic SELECT Statement with OR Operator
Summer II 2023
7/12/2023
*/

SELECT 1 = 1 OR 1 / 0;

SELECT true OR false AND false;

SELECT (true OR false) AND false;


SELECT
customername, country
FROM
customers
WHERE country = 'USA' OR
country = 'France';

SELECT customername, country, creditLimit
FROM
customers
WHERE(country = 'USA'
OR country = 'France')
AND creditlimit > 100000;

SELECT
customername, country, creditLimit
FROM
customers
WHERE country = 'USA'
OR country = 'France'
AND creditlimit > 10000;
