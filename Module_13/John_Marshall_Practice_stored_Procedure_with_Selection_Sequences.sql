--John Marshall
--Practice Assignment - Sample Database Tutorial Creating Stored Procedures with Selection Sequences
--summer 2 2023
--8/23/23

DROP PROCEDURE IF EXISTS GetCustomerLevel;

--returns Platinum if a customer has above a 5000 level

DELIMITER $$

CREATE PROCEDURE GetCustomerLevel(
    IN  pCustomerNumber INT, 
    OUT pCustomerLevel  VARCHAR(20))
BEGIN
    DECLARE credit DECIMAL(10,2) DEFAULT 0;

    SELECT creditLimit 
    INTO credit
    FROM customers
    WHERE customerNumber = pCustomerNumber;

    IF credit > 50000 THEN
        SET pCustomerLevel = 'PLATINUM';
    END IF;
END$$

DELIMITER ;

--Find Customer Number
SELECT 
    customerNumber, 
    creditLimit
FROM 
    customers
WHERE 
    creditLimit > 50000
ORDER BY 
    creditLimit DESC;

--Call procedure 
CALL GetCustomerLevel(141, @level);
SELECT @level;



--Same Procedure with a binary choice
DROP PROCEDURE IF EXISTS GetCustomerLevel;


DELIMITER $$

CREATE PROCEDURE GetCustomerLevel(
    IN  pCustomerNumber INT, 
    OUT pCustomerLevel  VARCHAR(20))
BEGIN
    DECLARE credit DECIMAL DEFAULT 0;

    SELECT creditLimit 
    INTO credit
    FROM customers
    WHERE customerNumber = pCustomerNumber;

    IF credit > 50000 THEN
        SET pCustomerLevel = 'PLATINUM';
    ELSE
        SET pCustomerLevel = 'NOT PLATINUM';
    END IF;
END$$

DELIMITER ;


--Find none platinum members
SELECT 
    customerNumber, 
    creditLimit
FROM 
    customers
WHERE 
    creditLimit <= 50000
ORDER BY 
    creditLimit DESC;


	CALL GetCustomerLevel(447, @level);
SELECT @level;

--Same Procedure with a Multiple choices
DROP PROCEDURE IF EXISTS GetCustomerLevel;


DELIMITER $$

CREATE PROCEDURE GetCustomerLevel(
    IN  pCustomerNumber INT, 
    OUT pCustomerLevel  VARCHAR(20))
BEGIN
    DECLARE credit DECIMAL DEFAULT 0;

    SELECT creditLimit 
    INTO credit
    FROM customers
    WHERE customerNumber = pCustomerNumber;

    IF credit > 50000 THEN
        SET pCustomerLevel = 'PLATINUM';
    ELSEIF credit <= 50000 AND credit > 10000 THEN
        SET pCustomerLevel = 'GOLD';
    ELSE
        SET pCustomerLevel = 'SILVER';
    END IF;
END $$

DELIMITER ;


--call procedure
CALL GetCustomerLevel(447, @level); 
SELECT @level;

CALL GetCustomerLevel(141, @level);
SELECT @level;

CALL GetCustomerLevel(206, @level);
SELECT @level;
