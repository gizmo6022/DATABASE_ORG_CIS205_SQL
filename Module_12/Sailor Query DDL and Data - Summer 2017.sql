--  Instructor: Craig Nelson
--  E-mail: cnelson@ccp.edu
--  Class: CIS 205
--  
-- 
--  Overview: This file will create the tables and load the data
--      that will be used in the class exercises.
--  

/*  NOTE: It is good practice to use the "drop table" statement
        before the "create table" statement in case the table
        already exists.
*/

DROP DATABASE sr;
CREATE DATABASE sr;
USE sr;

CREATE TABLE sailor(
  sid  int(5),
  sname  VARCHAR(30) NOT NULL,
  rating  int,
  age  double,
  CONSTRAINT sailor_pk PRIMARY KEY(sid)
  )ENGINE = INNODB;


CREATE TABLE boat(
  bid  INT NOT NULL auto_increment,
  bname  VARCHAR(30),
  color  VARCHAR(10),
  CONSTRAINT boat_pk PRIMARY KEY(bid)
  )ENGINE = INNODB;

CREATE TABLE reservation(
  reservation_num INT NOT NULL auto_increment,
  sid  int(5),
  bid  int(3),
  day  DATE,
  price double,
  CONSTRAINT reservation_pk PRIMARY KEY(reservation_num),
  CONSTRAINT reservation_fk1 FOREIGN KEY (sid) REFERENCES sailor(sid),
  CONSTRAINT reservation_fk2 FOREIGN KEY (bid) REFERENCES boat(bid)
  
  ) ENGINE = INNODB; 

  
-- The following SQL statements populate the sailor table

INSERT INTO sailor(sid, sname, rating, age)
VALUES (22, 'DUSTIN', 7, 45.0);

INSERT INTO sailor(sid, sname, rating, age)
VALUES (29, 'BRUTUS', 1, 33.0);

INSERT INTO sailor(sid, sname, rating, age)
VALUES (31, 'LUBBER', 8, 55.5);

INSERT INTO sailor(sid, sname, rating, age)
VALUES (32, 'ANDY', 8, 25.5);

INSERT INTO sailor(sid, sname, rating, age)
VALUES (58, 'RUSTY', 10, 35.0);

INSERT INTO sailor(sid, sname, rating, age)
VALUES (64, 'HORATIO', 7, 35.0);

INSERT INTO sailor(sid, sname, rating, age)
VALUES (71, 'ZORBA', 10, 16.0);

INSERT INTO sailor(sid, sname, rating, age)
VALUES (74, 'HORATIO', 9, 35.0);

INSERT INTO sailor(sid, sname, rating, age)
VALUES (85, 'ART', 3, 25.5);

INSERT INTO sailor(sid, sname, rating, age)
VALUES (95, 'BOB', 3, 63.5);



-- The following SQL statements populate the boat table

INSERT INTO boat (bname, color)
VALUES ( 'INTERLAKE', 'BLUE');

INSERT INTO boat ( bname, color)
VALUES ( 'INTERLAKE', 'RED');

INSERT INTO boat ( bname, color)
VALUES ( 'CLIPPER', 'GREEN');

INSERT INTO boat ( bname, color)
VALUES ( 'MARINE', 'RED');



-- The following SQL statements populate the reservation table

INSERT INTO reservation (sid, bid, day)
VALUES (22, 1, '1998-10-10');

INSERT INTO reservation (sid, bid, day)
VALUES (22, 2, '1998-10-10');

INSERT INTO reservation (sid, bid, day)
VALUES (22, 3, '1998-10-08');

INSERT INTO reservation (sid, bid, day)
VALUES (22, 4, '1998-10-07');

INSERT INTO reservation (sid, bid, day)
VALUES (31, 2, '1998-11-10');

INSERT INTO reservation (sid, bid, day)
VALUES (31, 3, '1998-11-06');

INSERT INTO reservation (sid, bid, day)
VALUES (31, 4, '1998-11-12');

INSERT INTO reservation (sid, bid, day)
VALUES (64, 1, '1998-09-05');

INSERT INTO reservation (sid, bid, day)
VALUES (64, 2, '1998-09-08');

INSERT INTO reservation (sid, bid, day)
VALUES (74, 3, '1998-09-08');

