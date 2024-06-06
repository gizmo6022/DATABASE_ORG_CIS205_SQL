--John Marshall
--Summer 2 2023
--Practice Exercise: Multi-Table SQL Script - Sailor Reservation Database


--Find the Boat ID, 
--Sailor names and sailor ages of the sailor that reserved boat 3  

SELECT sname, Age, bid_FK
FROM Sailor
JOIN Reservation
ON Sailor.sid = Reservation.sid_FK
WHERE bid_FK = 3;


--Find the Boat ID,  Boat Color, 
--names and ages of the sailor that reserved red or green boat
SELECT sname, Age, bid_FK, color
FROM Sailor
JOIN Reservation
ON Sailor.sid = Reservation.sid_FK
JOIN Boat
ON Boat.bid = Reservation.bid_FK
WHERE color = "Red" OR color = "Green";