--John Marshall
--Practice BETWEEN and IN
--Summer 2 2023


--Between Operator
SELECT 
    productCode, 
    productName, 
    buyPrice
FROM
    products
WHERE
    buyPrice BETWEEN 90 AND 100;

--AND Operator (Functional the same)
    SELECT 
    productCode, 
    productName, 
    buyPrice
FROM
    products
WHERE
    buyPrice >= 90 AND buyPrice <= 100;


--BETWEEN Operator with Cast Func
SELECT 
   orderNumber,
   requiredDate,
   status
FROM 
   orders
WHERE 
   requireddate BETWEEN 
     CAST('2003-01-01' AS DATE) AND 
     CAST('2003-01-31' AS DATE);

--IN operator
SELECT 
    officeCode, 
    city, 
    phone, 
    country
FROM
    offices
WHERE
    country IN ('USA' , 'France');

--Same Functionality using an OR clause
    SELECT 
    officeCode, 
    city, 
    phone
FROM
    offices
WHERE
    country = 'USA' OR country = 'France';


--INVERSE IN operator
SELECT 
    officeCode, 
    city, 
    phone, 
    country
FROM
    offices
WHERE
    country NOT IN ('USA' , 'France');


-- IN operator with multiple bins
SELECT
    orderNumber,
    customerNumber,
    status,
    shippedDate
FROM 
    orders
WHERE 
    orderNumber IN (10165, 10287,10310);
