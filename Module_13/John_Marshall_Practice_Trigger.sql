--John Marshall
--Practice Assignment - Sample Database Tutorial Creating Stored Procedures with Selection Sequences
--summer 2 2023
--8/23/23
DROP TABLE IF EXISTS employees_audit;
DROP TRIGGER IF EXISTS before_employee_update;

--Create Emplyee_Audit_Table
CREATE TABLE employees_audit (
    id INT AUTO_INCREMENT PRIMARY KEY,
    employeeNumber INT NOT NULL,
    lastname VARCHAR(50) NOT NULL,
    changedat DATETIME DEFAULT NULL,
    action VARCHAR(50) DEFAULT NULL
);

--Create Trigger before_employee_update
--inserts the information about the change into the audit table 
CREATE TRIGGER before_employee_update 
    BEFORE UPDATE ON employees
    FOR EACH ROW 
 INSERT INTO employees_audit
 SET action = 'update',
     employeeNumber = OLD.employeeNumber,
     lastname = OLD.lastname,
     changedat = NOW();

SHOW TRIGGERS;

---Trigger our new trigger
UPDATE employees 
SET 
    lastName = 'Phan'
WHERE
    employeeNumber = 1056;

SELECT * FROM employees_audit;
