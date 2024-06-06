--john Marshall
--Create Users Practice Assignment
--Summer 2 2023


--Create Additional User
CREATE USER bob
IDENTIFIED BY "Secure1pass!" ;



--See All users
SELECT User
FROM mysql.user;

--login as bob

mysql -u bob -p
--password
Secure1pass!

--Create Database from them to gain access too
mysql> create database bobdb;
mysql> use bobdb;

mysql> create table lists(
-> id int auto_increment primary key,
-> todo varchar(100) not null,
-> completed bool default false);
--Grant Acess to bob
grant all privileges on bobdb.* to bob@localhost;

--Exit
EXIT;

--Users need to login to gain acess to new previlages

mysql -u bob -p
--password
Secure1pass!

--see new databases
show Database;


--Exit
EXIT;


