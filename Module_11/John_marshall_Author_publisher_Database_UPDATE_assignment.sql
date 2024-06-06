--john marshall 
--Homework Assignment: UPDATE Statements for the Homework Assignment: Publisher -Author - Books - Marketing: Database
--summer 2 2023

DROP DATABASE IF EXISTS AuthorPublisher_DB;
CREATE DATABASE IF NOT EXISTS AuthorPublisher_DB;
USE AuthorPublisher_DB;

--TABLE: Publisher PK: pEmail ATTRIBUTES:  4 FK: 0
CREATE TABLE IF NOT EXISTS Publisher
(
    pEmail VARCHAR(50),
    pName VARCHAR(50) NOT NULL,
    pAddress VARCHAR(50) NOT NULL,
    phone CHAR(10) NOT NULL,

    CONSTRAINT Publisher_PK PRIMARY KEY (pEmail)
);

--TABLE: Author PK: aEmail ATTRIBUTES: 5 FK: 0

CREATE TABLE IF NOT EXISTS Author
(
    aEmail VARCHAR(50),
    aName VARCHAR(50) NOT NULL,
    aAddress VARCHAR(50) NOT NULL,
    phone CHAR(10) NOT NULL,
    SSN CHAR(10) NOT NULL,


    CONSTRAINT Author_PK PRIMARY KEY (aEmail)
);

--TABLE: Contracts PK: contractNum ATTRIBUTES: 5 FK: 2

CREATE TABLE IF NOT EXISTS Contracts
(
    contractNum CHAR(20),
    dollarSum DOUBLE NOT NULL,
    signDate DATE NOT NULL,
    aEmail_FK VARCHAR(50) NOT NULL,
    pEmail_FK VARCHAR(50) NOT NULL,

    CONSTRAINT Contracts_PK PRIMARY KEY (contractNum),
    CONSTRAINT Contracts_FK1 FOREIGN KEY (aEmail_FK) REFERENCES Author(aEmail)  ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT Contracts_FK2 FOREIGN KEY (pEmail_FK) REFERENCES Publisher(pEmail)  ON DELETE CASCADE ON UPDATE CASCADE
);

--TABLE: Books PK: ISBN ATTRIBUTES: 6 FK: 2

CREATE TABLE IF NOT EXISTS Books
(
    ISBN CHAR(13),
    title VARCHAR(50) NOT NULL,
    pYear CHAR(4) NOT NULL,
    aEmail_FK VARCHAR(50) NOT NULL,
    pEmail_FK VARCHAR(50) NOT NULL,

    CONSTRAINT Books_PK PRIMARY KEY (ISBN),
    CONSTRAINT Books_FK1 FOREIGN KEY (aEmail_FK) REFERENCES Author(aEmail)  ON DELETE CASCADE  ON UPDATE CASCADE,
    CONSTRAINT Books_FK2 FOREIGN KEY (pEmail_FK) REFERENCES Publisher(pEmail)  ON DELETE CASCADE  ON UPDATE CASCADE
);

--TABLE: Books PK: mEmail ATTRIBUTES: 4 FK: 0

CREATE TABLE IF NOT EXISTS Marketing_Company
(
    mEmail VARCHAR(50),
    mName VARCHAR(50) NOT NULL,
    mAddress VARCHAR(50) NOT NULL,
    phone CHAR(10) NOT NULL,

    CONSTRAINT Marketing_Company_PK PRIMARY KEY (mEmail)
); 

--TABLE: Markets_For PK: autoGenID ATTRABUTES: 3 FK: 2


CREATE TABLE IF NOT EXISTS Markets_For
(
    autoGenID INT auto_increment,
    mEmail_FK VARCHAR(50) NOT NULL,
    pEmail_FK VARCHAR(50) NOT NULL,
    
    CONSTRAINT Markets_For_PK PRIMARY KEY (autoGenID),
    CONSTRAINT Markets_For_FK1 FOREIGN KEY (mEmail_FK) REFERENCES Marketing_Company(mEmail) ON DELETE CASCADE  ON UPDATE CASCADE,
    CONSTRAINT Markets_For_FK2 FOREIGN KEY (pEmail_FK) REFERENCES Publisher(pEmail)  ON DELETE CASCADE  ON UPDATE CASCADE
);


---Start INSERT INTO DATA------------------------------------------------------------------------------------------------------

--Publisher

INSERT INTO Publisher(pEmail,pName,pAddress,phone)
VALUES ("penguin@penguin.com","Penguin","11289 E 23rd Street, NY","2155551234"),
("Accounts@RandomHouse.com","Random House","3455 Publishers Stree, London, UK","2155559876"),
("en@HoughtonMifflin.com","Houghton Mifflin","1985 W 52nd Street NY, NY","2155553456"),
("books@tinypress.com","Tiny Press","187 N Broad Street, Philadelphia, PA","2155558765")
;

--Author

INSERT INTO Author(aEmail,aName,aAddress,phone,SSN)
VALUES ("Andy@aol.com","Andy Weir","156 Sunset Blvd, LA, CA","3025551234","0173943294"),
("Rowling@WizzardingWorld.com","J.K. Rolling","3455 CharingCross road, ED, UK","3025554567","1029334287"),
("George@gmail.com","Goerge R Martin","877 Main Street, Colarado City, CO","3025554567","104574642"),
("Micheal@gmail.com","Micheal Crichton","567 Street Road, San Won, CR","3025559876","5989120354")
;

--Books
INSERT INTO Books (ISBN,title,pYear,aEmail_FK,pEmail_Fk)
VALUES("9780553418026","The Martian","2012","Andy@aol.com","penguin@penguin.com"),
("9780590353403","Harry Potter","2001","Rowling@WizzardingWorld.com","Accounts@RandomHouse.com"),
("9781405072960","Jurrasic Park","2006","George@gmail.com","en@HoughtonMifflin.com"),
('9780553593716',"Game Of Thrones","1998","Micheal@gmail.com","books@tinypress.com")
;


--Contacts
INSERT INTO Contracts(contractNum,dollarSum,signDate,aEmail_FK,pEmail_Fk)
VALUES("192746372817",700000,"2011/08/15","Andy@aol.com","penguin@penguin.com"),
("234712553478",120000000,"1999/09/26","Rowling@WizzardingWorld.com","Accounts@RandomHouse.com"),
("762137123658",232000,"2005/09/17","George@gmail.com","en@HoughtonMifflin.com"),
("342321345652",308000,"1988/10/02","Micheal@gmail.com","books@tinypress.com")
;


--Marketing Company
INSERT INTO Marketing_Company (mEmail,mName,mAddress,phone)
VALUES("Accounts@CDP.com","Cooper Drapper Price","1010 Flourence Circle","6105559876"),
("Accounts@martinsquared.com","Martin And Martin","100 Erving Lane","6105556789"),
("Accounts@wm4u.com","We Market 4 U","101 Broad Streat","6105556754")
;

--Markets For

INSERT INTO Markets_For(mEmail_FK,pEmail_Fk)
VALUES("Accounts@CDP.com","penguin@penguin.com"),
("Accounts@martinsquared.com","Accounts@RandomHouse.com"),
("Accounts@wm4u.com","en@HoughtonMifflin.com")
;

--UPDATE STATEMENTS
SELECT * FROM Author;

--UPDATE JK Rowling Email

UPDATE Author 
SET 
    aEmail = 'JK@hogwarts.edu'
WHERE
     SSN = "1029334287";


SELECT * FROM Author;

--UPDATE George RR  Martin


UPDATE Author 
SET 
    aName = 'Forge Cartin'
WHERE
    aEmail = "George@gmail.com";


SELECT * FROM Author;

--UPDATE Random house publishers

SELECT * FROM Publisher;


UPDATE Publisher 
SET 
    pName = 'Random Home'
WHERE 
    pEmail= "Accounts@RandomHouse.com";


SELECT * FROM Publisher;

--Update Tiny Press publishers

UPDATE Publisher 
SET 
    pName = 'Small Press'
WHERE 
    pName= "Tiny Press";

SELECT * FROM Publisher;

--Update MArtin and MArtin

SELECT * FROM Marketing_Company;

UPDATE Marketing_Company 
SET 
    mName = 'Martin Squared'
WHERE 
    mEmail = "Accounts@martinsquared.com";


SELECT * FROM Marketing_Company;