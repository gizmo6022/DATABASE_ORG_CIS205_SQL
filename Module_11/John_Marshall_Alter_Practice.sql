--john Marshall
--Alter Practice Assignement
--summer 2023 -23


--Create Table Statements-------------------
CREATE TABLE vehicles (
    vehicleId INT,
    year INT NOT NULL,
    make VARCHAR(100) NOT NULL,
    PRIMARY KEY(vehicleId)
);

--Added a column
ALTER TABLE vehicles
ADD model VARCHAR(100) NOT NULL;

DESCRIBE vehicles;


--add multiple columns
ALTER TABLE vehicles
ADD color VARCHAR(50),
ADD note VARCHAR(255);

DESCRIBE vehicles;

--modify existing Columns
ALTER TABLE vehicles 
MODIFY note VARCHAR(100) NOT NULL;


--midify the definiton of an attribute
ALTER TABLE vehicles 
MODIFY year SMALLINT NOT NULL,
MODIFY color VARCHAR(20) NULL AFTER make;

--change name using change Column
ALTER TABLE vehicles 
CHANGE COLUMN note vehicleCondition VARCHAR(100) NOT NULL;

 --Dropping an Attribute from a table
ALTER TABLE vehicles
DROP COLUMN vehicleCondition;

 -- Renaming a tbale
ALTER TABLE vehicles 
RENAME TO cars; 