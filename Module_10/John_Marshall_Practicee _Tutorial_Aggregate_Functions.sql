--John Marshall
--tutorial_Aggregate_Functions
--Summer 2 2023

--average function
SELECT 
    AVG(buyPrice) average_buy_price
FROM 
    products;

--count
SELECT 
    COUNT(*) AS total
FROM 
    products;

--max
SELECT 
     MAX(buyPrice) highest_price
FROM 
     products;



--minimum
SELECT 
    MIN(buyPrice) lowest_price
FROM 
    products;

    

--sum
    SELECT 
    SUM(buyPrice) total
FROM 
    products;
