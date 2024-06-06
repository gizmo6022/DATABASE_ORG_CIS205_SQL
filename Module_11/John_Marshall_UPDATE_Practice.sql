--John Marshall
--Practice Exercise- Sample Database Tutorial using the UPDATE Statement
--Summer 2 2023



--BEGINING SELECT QUERY-------------------------------------------
SELECT 
    firstname, 
    lastname, 
    email
FROM
    employees
WHERE
    employeeNumber = 1056;


--UPDATE STATEMENT----------------------------------------------

UPDATE employees 
SET 
    email = 'mary.patterson@classicmodelcars.com'
WHERE
    employeeNumber = 1056;


--RESELECT  QUERY TO VIEW CHANGES-----------------------------
SELECT 
    firstname, 
    lastname, 
    email
FROM
    employees
WHERE
    employeeNumber = 1056;

--UPDATE STATEMENT with Multiple aattributes----------------------------------------------
UPDATE employees 
SET 
    lastname = 'Hill',
    email = 'mary.hill@classicmodelcars.com'
WHERE
    employeeNumber = 1056;

--RESELECT  QUERY TO VIEW CHANGES-----------------------------
SELECT 
    firstname, 
    lastname, 
    email
FROM
    employees
WHERE
    employeeNumber = 1056;