--john marshall 
--Homework Assignment: Stored Trigger Statements for the Homework Database Assignment: for the Publisher -Author - Books - Marketing: Database
--summer 2 2023
--8/23/23

--Create Table
CREATE TABLE messages ( 
    id INT NOT NULL AUTO_INCREMENT, 
    message VARCHAR(100) NOT NULL, 
    PRIMARY KEY (id) 
);


--obtain our connection ID
SELECT CONNECTION_ID();

--populate table
INSERT INTO messages(message) 
VALUES('Hello');

--confirm
SELECT * FROM messages;

--lock table to read mode
LOCK TABLE messages READ;

--expect failure to table
INSERT INTO messages(message) 
VALUES('Hi');


SELECT * FROM messages;

--Change session-----------------------------------------------------
SELECT CONNECTION_ID();

--read table
SELECT * FROM messages;

--Expect wait message

INSERT INTO messages(message) 
VALUES('Bye');

--confirm
SHOW PROCESSLIST;


---------- FIRST SESSION!

UNLOCK TABLES;

-- SECOND SESSION!

--confirm uinsert completed
SHOW PROCESSLIST;
