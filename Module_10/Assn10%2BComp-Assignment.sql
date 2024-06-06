/* 1.) Primary Keys for each table:  Salesperson PK- ssn, Trip PK- tripId, Expense PK - tripId and accountNumber */
/* 2.)Foreign key for each table: Salesperson FK - deptNo (when Department table created) 
      Trip FK - ssn (from Salesperson) Expense FK - tripID (Used to make Composite Primary Key)  */
/* 3.) To create as is Salesperson, Trip, and than Expense (When Department table is add that will need to be first. */


drop database Flight;
create database Flight;
use Flight;

drop table if exists Salesperson;
drop table if exists Trip;
drop table if exists Expense;

create table Salesperson (
  ssn char(9) not null, 
  lName varchar(25), 
  
  startYear char(4), 
  deptNo char(3), 
  constraint pkSalesperson primary key (ssn))
  engine = innodb;

create table Trip (
  tripId char(3) not null, 
  ssn char(9) not null, 
  fromCity varchar(10), 
  toCity varchar(10), 
  departureDate varchar(10), 
  returnDate varchar(10),  
  constraint pkTrip primary key (tripId),
  constraint fkSalesperson foreign key (ssn) 
  references Salesperson(ssn))
  engine = innodb;

create table Expense (
  tripId char(3) not null, 
  accountNumber char(5) not null,
  amount varchar (5), 
  constraint pkTripIdAcctNum primary key (accountNumber, tripID),
  constraint fkTrip foreign key (tripId) references Trip(tripId))
  engine = innodb;
   
insert into Salesperson values (
  '123456789', 'PETERSON', '1995', '101');
insert into Salesperson values (
  '987654321', 'ALBERTS', '1989', '135');

insert into Trip values (
  '100', '123456789', 'PHIL', 'CHICAGO', '11-01-2004', '11-14-2004');
insert into Trip values (
  '101', '987654321', 'PHIL', 'CHICAGO', '10-01-2004', '10-10-2004');
insert into Trip values (
  '102', '123456789', 'PHIL', 'L.A.', '11-16-2004', '11-19-2004');
insert into Trip values (
  '103', '987654321', 'PHIL', 'MIAMI', '10-12-2004', '10-15-2004');

insert into Expense values (
  '100', '25431', '500');
insert into Expense values (
  '100', '67890', '350');
insert into Expense values (
  '101', '25431', '780');
insert into Expense values (
  '101', '85321', '525');
insert into Expense values (
  '101', '67890', '450');
insert into Expense values (
  '101', '54321', '250');
insert into Expense values (
  '102', '25431', '850');
insert into Expense values (
  '102', '67890', '450');
insert into Expense values (
  '102', '85321', '300');
insert into Expense values (
  '103', '25431', '350');
insert into Expense values (
  '103', '67890', '650');
