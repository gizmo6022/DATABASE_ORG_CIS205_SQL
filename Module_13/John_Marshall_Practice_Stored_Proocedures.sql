--John Marshall
--Extra Credit - Practice Assignment - Sample Database Tutorial Creating Stored Procedures
--summer 2 2023
--8/23/23


--demonstrates what we are trying to do 
SELECT * FROM products;

--Created the stored procedure that selects all
DELIMITER //

CREATE PROCEDURE GetAllProducts()
BEGIN
	SELECT *  FROM products;
END //

DELIMITER ;

CALL etAllProducts();
