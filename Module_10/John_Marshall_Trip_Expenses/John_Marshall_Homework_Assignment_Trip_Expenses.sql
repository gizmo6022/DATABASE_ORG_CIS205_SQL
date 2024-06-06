--John_Marshall
--Homework Assignment Trip Expenses
--Summer 2 2023

--Find the SSN and Name or Sales Representatives that took trips to ‘CHICAGO’.

SELECT SalesPerson.SSN, SalesPerson.lName
FROM SalesPerson
JOIN Trip
ON  SalesPerson.SSN=Trip.SSN
WHERE Trip.toCity='CHICAGO';


--Find the total trip expenses incurred by the salesman with SSN = ‘123-45-6789’.
SELECT Expense.amount
FROM Expense
JOIN Trip
ON  Expense.tripID=Trip.tripID
JOIN SalesPerson
ON Trip.SSN =  SalesPerson.SSN
WHERE SalesPerson.SSN='123456789';


--Find the tripID, SSN, fromCity, tocity, departureDate, returnDate, and amount for trips that exceed $2000 in expenses.

SELECT Trip.tripID, SalesPerson.SSN, Trip.fromCity, Trip.tocity, Trip.departureDate, Trip.returnDate, Expense.amount
FROM Expense
JOIN Trip
ON  Expense.tripID=Trip.tripID
JOIN SalesPerson
ON Trip.SSN =  SalesPerson.SSN
WHERE Expense.amount>2000;

