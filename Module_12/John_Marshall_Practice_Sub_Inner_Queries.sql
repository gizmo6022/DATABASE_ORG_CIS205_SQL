--John Marshall
--Practice Assignment : Advanced Sailor Queries Sub Queries / Inner Queries
--summer 2 2023



--Find the sailor ID  and  names of sailors who have reserved both a red boat or a green boat

SELECT sailor.sid, sname
FROM Sailor
JOIN Reservation
ON Sailor.sid = Reservation.sid
JOIN Boat
ON Boat.bid = Reservation.bid
WHERE color = "Red" OR color = "Green";


--Find the Sailor ID  names of sailors who have reserved both a red boat and a green boat.

SELECT DISTINCT sailor.sid, sname
FROM Sailor
JOIN Reservation
ON Sailor.sid = Reservation.sid
JOIN Boat
ON Boat.bid = Reservation.bid
WHERE color = "Red" AND sailor.sid IN (
    SELECT sailor.sid
FROM Sailor
JOIN Reservation
ON Sailor.sid = Reservation.sid
JOIN Boat
ON Boat.bid = Reservation.bid
WHERE color = "Green"
);

--Find the Sailor ID and names of all sailors who have reserved red boats but not green boats.

SELECT DISTINCT sailor.sid, sname
FROM Sailor
JOIN Reservation
ON Sailor.sid = Reservation.sid
JOIN Boat
ON Boat.bid = Reservation.bid
WHERE color = "Red" AND NOT sailor.sid IN (
    SELECT sailor.sid
FROM Sailor
JOIN Reservation
ON Sailor.sid = Reservation.sid
JOIN Boat
ON Boat.bid = Reservation.bid
WHERE color = "Green"
);