--John Marshall
--Practice GROUP BY 
--Summer 2 2023


SELECT 
    status
FROM
    orders
GROUP BY status;

--group by on status and count

SELECT 
    status, COUNT(*)
FROM
    orders
GROUP BY status;

-- group by sum for each status
SELECT 
    status, 
    SUM(quantityOrdered * priceEach) AS amount
FROM
    orders
INNER JOIN orderdetails 
    USING (orderNumber)
GROUP BY 
    status;

--group by order number with the sum of each order number
    SELECT 
    orderNumber,
    SUM(quantityOrdered * priceEach) AS total
FROM
    orderdetails
GROUP BY 
    orderNumber;

--group by year with sume of each year
    SELECT 
    YEAR(orderDate) AS year,
    SUM(quantityOrdered * priceEach) AS total
FROM
    orders
INNER JOIN orderdetails 
    USING (orderNumber)
WHERE
    status = 'Shipped'
GROUP BY 
    YEAR(orderDate);