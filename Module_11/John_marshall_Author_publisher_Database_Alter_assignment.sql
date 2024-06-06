--john marshall 
--Homework Assignment: ALTER Statements for the Homework Assignment: Publisher -Author - Books - Marketing: Database
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

DESCRIBE Author;
DESCRIBE Publisher;
DESCRIBE Books;
DESCRIBE Contracts;


---Start Alter statements for Normalization
--Author
ALTER TABLE Author
DROP COLUMN aname;

ALTER TABLE Author
ADD streetAddress VARCHAR(100) NOT NULL,
ADD city VARCHAR(50) NOT NULL,
ADD state VARCHAR(50),
ADD Country VARCHAR(50)NOT NULL,
ADD postalCode CHAR(10)NOT NULL,
ADD firstName VARCHAR(30),
ADD lastName VARCHAR(30);

DESCRIBE Author;

ALTER TABLE Publisher
CHANGE COLUMN pAddress streetAddress VARCHAR(100) NOT NULL;

ALTER TABLE Publisher
ADD city VARCHAR(50) NOT NULL,
ADD state VARCHAR(50),
ADD Country VARCHAR(50)NOT NULL,
ADD postalCode CHAR(10)NOT NULL;

ALTER TABLE Publisher
ADD POBox CHAR(10);

DESCRIBE Publisher;

