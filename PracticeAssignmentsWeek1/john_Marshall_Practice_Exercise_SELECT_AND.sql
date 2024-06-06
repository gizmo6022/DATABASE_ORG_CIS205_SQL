/*
John Marshall
Practice Exercise- Sample Database Tutorial Basic SELECT Statement with AND Operator
Summer II 2023
7/12/2023
*/

SELECT 1 = 0 AND 1 / 0 ;


SELECT customername, country, state
FROM
customers
WHERE
country = 'USA' AND state = 'CA';


SELECT
customername, country, state, creditlimit
FROM
customers
WHERE country = 'USA'
AND state = 'CA'
AND creditlimit > 100000;