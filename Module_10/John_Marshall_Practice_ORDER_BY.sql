--John Marshall
--Practice ORDER BY
--Summer 2 2023

--ORDER BY Clause
SELECT
	contactLastname,
	contactFirstname
FROM
	customers
ORDER BY
	contactLastname;


--ORDER BY CLAUSE with DESC Operatror
SELECT
	contactLastname,
	contactFirstname
FROM
	customers
ORDER BY
	contactLastname DESC;

--ORDER BY clause with DESC and ASC Operator 
    SELECT 
    contactLastname, 
    contactFirstname
FROM
    customers
ORDER BY 
	contactLastname DESC , 
	contactFirstname ASC;


--ORDER BY clause with DESC Operatror and Mulitplcation
    SELECT 
    orderNumber, 
    orderlinenumber, 
    quantityOrdered * priceEach
FROM
    orderdetails
ORDER BY 
   quantityOrdered * priceEach DESC;


--ORDER BY clause with alias
SELECT 
    orderNumber,
    orderLineNumber,
    quantityOrdered * priceEach AS subtotal
FROM
    orderdetails
ORDER BY subtotal DESC;