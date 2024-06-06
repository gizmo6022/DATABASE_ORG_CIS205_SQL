--John Marshall
--Summer 2 2023
--Create Database Tables Assignments: Student Majors Database


--CREATE DATABASE IF NOT EXISTS School
--USE School
--SHOW TABLES
--DESCRIBE Student
--DROP TABLE IF EXISTS Student


CREATE TABLE Major
(
    majorID INT,
    majorName VARCHAR(25) NOT NULL,
    CONSTRAINT Major_PK PRIMARY KEY (majorID)
);


CREATE TABLE Student
(
    sid INT,
    firstName VARCHAR(25) NOT NULL,
    lastName VARCHAR(25) NOT NULL,
    login VARCHAR(25) NOt NULL,
    dob DATE,
    majorID_FK INT,
     
    CONSTRAINT Student_PK PRIMARY KEY(sid),
    CONSTRAINT Student_FK1 FOREIGN KEY (majorID_FK)
    REFERENCES Major(majorID),

    CONSTRAINT Student_UNQ1 UNIQUE(login)
);