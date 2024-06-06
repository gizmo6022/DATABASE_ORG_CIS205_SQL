--     Instructor: Craig Nelson
--     E-mail: cnelson@ccp.edu
--     Class: CIS 205
--     
-- 
--     Overview: This file will create the tables and load the data
--            that will be used in the class exercises.
--     

/*     NOTE: It is good practice to use the "drop table" statement
           before the "create table" statement in case the table
           already exists.
*/

     
DROP DATABASE RSYSTEM;
CREATE DATABASE RSYSTEM;
USE RSYSTEM;


DROP TABLE if exists registration;
DROP TABLE if exists course;
DROP TABLE if exists student;

CREATE TABLE student(
     sid     varchar(10),
     fName     VARCHAR(30) NOT NULL,
     lName     VARCHAR(30) NOT NULL,
     gpa     double,
     dob  date,
     CONSTRAINT sailor_pk PRIMARY KEY(sid)
     )ENGINE = INNODB;

-- NOT NULL auto_increment
CREATE TABLE course(
     crn     INT ,
     cname     VARCHAR(30),
     cDiscription     VARCHAR(10),
     dept varchar(5),
     cNumber int,
     cSection int,
     credits int,
     cyear   char(4),
     CONSTRAINT course_pk PRIMARY KEY(crn)
     )ENGINE = INNODB;

CREATE TABLE  registration(
     registration_num INT NOT NULL auto_increment,
     sid     varchar(10),
     crn     int,
     csection int,
     rdate     TIMESTAMP,
     
     CONSTRAINT registration_pk PRIMARY KEY(registration_num),
     CONSTRAINT registration_fk1 FOREIGN KEY (sid) REFERENCES student(sid),
     CONSTRAINT registration_fk2 FOREIGN KEY (crn) REFERENCES course(crn)
     
     ) ENGINE = INNODB; 


INSERT INTO student(sid, fName, lName, gpa, dob) VALUES ('J0901', 'John','Burke', 4.0, '1988-09-12');

INSERT INTO student(sid, fName, lName, gpa, dob) VALUES ('J1902', 'Terrence', 'Williams', 1.69, '1987-12-10');

INSERT INTO student(sid, fName, lName, gpa, dob) VALUES ('J2903', 'Jennifer', 'Thompson', 3.8, '1998-06-30');

INSERT INTO student(sid, fName, lName, gpa, dob) VALUES ('J3904', 'Jasmine',  'Sloane', 3.8, '1979-03-9');

INSERT INTO student(sid, fName, lName, gpa, dob) VALUES ('J4905', 'Joseph', 'Nilan', 2.0, '1982-01-14');

INSERT INTO student(sid, fName, lName, gpa, dob) VALUES ('J59906', 'Gregory','Moody', 2.7, '1990-02-17');

INSERT INTO student(sid, fName, lName, gpa, dob) VALUES ('J6907', 'Harper', 'Dennis', 3.0, '1991-10-10');

INSERT INTO student(sid, fName, lName, gpa, dob) VALUES ('J7908', 'Camella','Poindexter', 3.9, '1994-10-10');

INSERT INTO student(sid, fName, lName, gpa, dob) VALUES ('J8909', 'Harper','Dennis', 3.2, '1988-09-19');

INSERT INTO student(sid, fName, lName, gpa, dob) VALUES ('J9910', 'Porsha', 'Maner', 3.9, '1988-05-11');



-- The following SQL statements populate the boat table

INSERT INTO course (crn     , cName, dept, cNumber, csection, credits, cYear) 
VALUES ( 50343,'Data Base Management', 'CIS', 205, 001, 4, '2010' );

INSERT INTO course (crn     , cName, dept, cNumber, csection, credits, cYear)
VALUES ( 50344,'Data Base Management', 'CIS', 205, 002, 4, '2010' );

INSERT INTO course (crn     , cName, dept, cNumber, csection, credits, cYear)
VALUES ( 50345,'Data Base Management', 'CIS', 205, 003, 4, '2010' );

INSERT INTO course (crn     , cName, dept, cNumber, csection, credits, cYear)
VALUES ( 50347,'Operating Systems', 'CIS', 105, 002, 4, '2010' );

INSERT INTO course (crn     , cName, dept, cNumber, csection, credits, cYear)
VALUES ( 50445,' American History', 'HIS', 101, 001, 3, '2010' );

INSERT INTO course (crn     , cName, dept, cNumber, csection, credits, cYear)
VALUES ( 50645,'English', 'ENG', 105, 001, 3, '2010' );

INSERT INTO course (crn     , cName, dept, cNumber, csection, credits, cYear)
VALUES ( 50745,'Calculus I', 'MATH', 105, 001, 3, '2010' );




-- The following SQL statements populate the reservation table

INSERT INTO  registration (sid, crn, csection) VALUES ('J0901', 50745, 001);

INSERT INTO  registration (sid, crn, csection) VALUES ('J0901', 50645, 001);

INSERT INTO  registration (sid, crn, csection) VALUES ('J0901',  50445,001);

INSERT INTO  registration (sid, crn, csection) VALUES ('J0901', 50344, 002);

INSERT INTO  registration (sid, crn, csection) VALUES ('J1902', 50344, 002);

INSERT INTO  registration (sid, crn, csection) VALUES ('J1902', 50745, 001);

INSERT INTO  registration (sid, crn, csection) VALUES ('J1902', 50344, 002);

INSERT INTO  registration (sid, crn, csection) VALUES ('J2903', 50347, 001);

INSERT INTO  registration (sid, crn, csection) VALUES ('J2903', 50343,001);

INSERT INTO  registration (sid, crn, csection) VALUES ('J9910', 50343,001);


