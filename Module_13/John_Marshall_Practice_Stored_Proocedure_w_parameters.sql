--John Marshall
--Extra Credit - Practice Assignment - Sample Database Tutorial Introducing Stored Procedures with Parameters
--summer 2 2023
--8/23/23

DROP PROCEDURE IF EXISTS GetOrderCountByStatus;
DROP PROCEDURE IF EXISTS GetOfficeByCountry;


--Created the stored procedure that selects all from offices with a certian CountryName
DELIMITER //

CREATE PROCEDURE GetOfficeByCountry(
	IN countryName VARCHAR(255)
)
BEGIN
	SELECT * 
 	FROM offices
	WHERE country = countryName;
END //

DELIMITER ;

--call get office by country  In USA
CALL GetOfficeByCountry('USA');

--call get office by country In France
CALL GetOfficeByCountry('France');

--Created the stored procedure that returns the count of orders that fall into an catagory 
DELIMITER $$

CREATE PROCEDURE GetOrderCountByStatus(
	IN  orderStatus VARCHAR(25),
	OUT total INT
)
BEGIN
	SELECT COUNT(orderNumber)
	INTO total
	FROM orders
	WHERE status = orderStatus;
END$$

DELIMITER ;

--number of items that have shipped
CALL GetOrderCountByStatus('Shipped',@total);
SELECT @total;

--number of items that are in process
CALL GetOrderCountByStatus('in process',@total);
SELECT @total AS  total_in_process;



