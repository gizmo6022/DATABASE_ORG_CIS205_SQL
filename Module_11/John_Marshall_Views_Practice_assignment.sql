--John Marshall
--Practice Assignment - Sample Database Tutorial using SQL Views
--Summer 2 2023

--Join To be Preformed---------------
SELECT 
    customerName, 
    checkNumber, 
    paymentDate, 
    amount
FROM
    customers
INNER JOIN
    payments USING (customerNumber);


--Creating a view to be queried----------------
CREATE VIEW customerPayments
AS 
SELECT 
    customerName, 
    checkNumber, 
    paymentDate, 
    amount
FROM
    customers
INNER JOIN
    payments USING (customerNumber);

--Quering View--------------------------------------------

SELECT * FROM customerPayments;


--Creating veiw Statement-----------------------------------

CREATE VIEW salePerOrder AS
    SELECT 
        orderNumber, 
        SUM(quantityOrdered * priceEach) total
    FROM
        orderDetails
    GROUP by orderNumber
    ORDER BY total DESC;


SHOW TABLES;

SHOW FULL TABLES;

SELECT * FROM salePerOrder;

-- Creating a mor specific view
CREATE VIEW bigSalesOrder AS
    SELECT 
        orderNumber, 
        ROUND(total,2) as total
    FROM
        salePerOrder
    WHERE
        total > 60000;


SELECT 
    orderNumber, 
    total
FROM
    bigSalesOrder;


--Views with multiple joins

CREATE OR REPLACE VIEW customerOrders AS
SELECT 
    orderNumber,
    customerName,
    SUM(quantityOrdered * priceEach) total
FROM
    orderDetails
INNER JOIN orders o USING (orderNumber)
INNER JOIN customers USING (customerNumber)
GROUP BY orderNumber;

SELECT * FROM customerOrders 
ORDER BY total DESC;

--Create view with subqueries
CREATE VIEW aboveAvgProducts AS
    SELECT 
        productCode, 
        productName, 
        buyPrice
    FROM
        products
    WHERE
        buyPrice > (
            SELECT 
                AVG(buyPrice)
            FROM
                products)
    ORDER BY buyPrice DESC;

--With only Explicit colomuns

CREATE VIEW customerOrderStats (
   customerName , 
   orderCount
) 
AS
    SELECT 
        customerName, 
        COUNT(orderNumber)
    FROM
        customers
            INNER JOIN
        orders USING (customerNumber)
    GROUP BY customerName;

SELECT 
    customerName,
    orderCount
FROM
    customerOrderStats
ORDER BY 
	orderCount, 
    customerName;


