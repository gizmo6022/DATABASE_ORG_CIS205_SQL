/* 
John Marshall
Assignment: Single Table Queries: House Table
Summer 2 2023
*/



/* Query 1.) */

SELECT id, street, value
FROM house
WHERE zip = 19140 AND value < 240000;

/*
| id    | street           | value  |
+-------+------------------+--------+
| 10055 | 5720 Bell Street | 207000 |
*/


/* Query 2.) */

SELECT id, street, value
FROM house
WHERE zip = 19128 AND bedrooms >= 3 AND bathrooms >= 2;

/*
+-------+--------------------+--------+
| 10005 | 236 PARKER AVE     | 491400 |
| 10075 | 1755 Miller Avenue | 491400 |
+-------+--------------------+--------+
*/

/* Query 3.) */

SELECT id, street, value
FROM house
WHERE first = "MARK" AND last = "JONES";

/*
+-------+------------------------+--------+
| id    | street                 | value  |
+-------+------------------------+--------+
| 10015 | 1914 Fairmount Avenue  | 300640 |
| 10016 | 2022 Spring Garden     | 251000 |
| 10044 | 1503 Green Street      | 249000 |
+-------+------------------------+--------+
*/

/* Query 4.) */

SELECT street, value, bedrooms, bathrooms
FROM house
WHERE zip =  19116 OR zip = 19154;

/*
+----------------+--------+----------+-----------+
| street         | value  | bedrooms | bathrooms |
+----------------+--------+----------+-----------+
| 121 NANDINA ST | 227500 |      2.0 |       1.5 |
| 207 DUPONT ST  | 507000 |      4.0 |       2.0 |
+----------------+--------+----------+-----------+
*/

/* Query 5.) */

SELECT id, street, value
FROM house
WHERE zip =  19139 AND SOLD = 0;

/*
+-------+-------------------+--------+
| id    | street            | value  |
+-------+-------------------+--------+
| 10044 | 1503 Green Street | 249000 |
+-------+-------------------+--------+
*/


