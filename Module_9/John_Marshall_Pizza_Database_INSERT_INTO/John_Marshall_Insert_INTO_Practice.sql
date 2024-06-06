--john marshall 
--INSERT INTO pracitce assignment with Pizza Delivery DB
--summer 2 2023


--database created using the sample design in CREATE TABLE ASSIGNMENT

------------------------CREATE TABLE AND PIZZA DELIVERY DATABASE---------------------------


DROP DATABASE IF EXISTS PizzaDelivery_DB;
CREATE DATABASE IF NOT EXISTS PizzaDelivery_DB;
USE PizzaDelivery_DB;


CREATE TABLE IF NOT EXISTS Person
(
    pNum VARCHAR(10),
    PName VARCHAR(50) NOT NULL,
    pAddress VARCHAR(50) NOT NULL,
    isCustomer BOOLEAN,
    isDelivery BOOLEAN,
    IsOrderStaff BOOLEAN,

    CONSTRAINT Person_PK PRIMARY KEY (pnum)
);

CREATE TABLE IF NOT EXISTS Customer
(
    phone CHAR(10),
    email VARCHAR(50),
    pNum_FK VARCHAR(10),
    

    CONSTRAINT Customer_PK PRIMARY KEY (email,pnum_FK),
    CONSTRAINT Customer_FK1 FOREIGN KEY (pNum_FK) REFERENCES Person(pNum)
);

CREATE TABLE IF NOT EXISTS Order_Staff
(
    empID VARCHAR(5),
    pNum_FK VARCHAR(10) ,

    CONSTRAINT Order_Staff_PK PRIMARY KEY (empID,pnum_FK),
    CONSTRAINT Order_Staff_FK1 FOREIGN KEY (pNum_FK) REFERENCES Person(pNum)
);

CREATE TABLE IF NOT EXISTS Delivery_Person
(
    model VARCHAR(20) NOT NULL,
    phone char(10),
    pNum_FK VARCHAR(10),
    

    CONSTRAINT Delivery_Person_PK PRIMARY KEY (phone,pnum_FK),
    CONSTRAINT Delivery_Person_FK1 FOREIGN KEY (pNum_FK) REFERENCES Person(pNum)
);

CREATE TABLE IF NOT EXISTS Pizza_Order
(
    oDate DATE NOT NULL,
    orderNum CHAR(10),
    oType CHAR(9),
    empID_FK VARCHAR(5),
    Customer_FK VARCHAR(50),
    Driver_FK CHAR(10),
    

    CONSTRAINT Pizza_Order_PK PRIMARY KEY (orderNum),

    CONSTRAINT Pizza_Order_FK1 FOREIGN KEY (empID_FK) REFERENCES Order_Staff(empID),
    CONSTRAINT Pizza_Order_FK2 FOREIGN KEY (customer_FK) REFERENCES Customer(pNum_FK),
    CONSTRAINT Pizza_Order_FK3 FOREIGN KEY (driver_FK) REFERENCES Delivery_Person(pNum_FK)
);

CREATE TABLE IF NOT EXISTS Pizza
(
    itemNum CHAR(5),
    size VARCHAR(2),
    price DOUBLE,
    

    CONSTRAINT Pizza_PK PRIMARY KEY (itemNum)
);

CREATE TABLE IF NOT EXISTS Toppings
(
    itemNum CHAR(5),
    tname CHAR(25),
    price DOUBLE,
    
    

    CONSTRAINT Toppings_PK PRIMARY KEY (itemNum)
);

CREATE TABLE IF NOT EXISTS Order_Item
(
    autoGen INT auto_increment,
    orderNum_FK CHAR(10),
    itemNum_FK CHAR(5),
    

    CONSTRAINT Order_Item_PK PRIMARY KEY (autoGen),

    CONSTRAINT Order_Item_FK1 FOREIGN KEY (orderNum_FK) REFERENCES Pizza_Order(orderNum),
    CONSTRAINT Order_Item_FK2 FOREIGN KEY (itemNum_FK) REFERENCES Pizza(itemNum)
);

DROP TABLE IF EXISTS Pizza_Topping;
CREATE TABLE IF NOT EXISTS Pizza_Topping
(   
    itemNum_FK CHAR(5),
    autoGen_FK INT,
    

    CONSTRAINT Pizza_Topping_PK PRIMARY KEY (itemNum_FK, autoGen_FK),

    CONSTRAINT Pizza_Topping_FK1 FOREIGN KEY (autoGen_FK) REFERENCES Order_Item(autoGen),
    CONSTRAINT Pizza_Topping_FK2 FOREIGN KEY (itemNum_FK) REFERENCES Toppings(itemNum)
);





----------------------------------------BEGIN INSERT INTO DATA-----------------------------------



--Person


INSERT INTO Person(pNum,pName,pAddress,isCustomer,isOrderStaff,isDelivery)
VALUES  ("PID100","James Kildare","23 Shrewbury Court",1,0,0),
    ("PID101","Ben Casey","281 S 52nd Street",1,0,0),
    ("PID102","Marcus Welby","5808 Vine Street",1,0,0),
    ("PID103","Leonard 'Bones' McCoy","16 S. Bank Street",1,0,0),
    ("PID104","Hawkeye Pierce","7311 Miller Avenue",1,0,0),
    ("PID105","Phillip Chandler","206 Locust Street",1,0,0),
    ("PID106","Heathcliff Huxtable","6600 Broad Street",1,0,0),
    ("PID107","Greg House","1920 Heather Circle",0,1,0),
    ("PID108","Derek Shepherd","101 Philadelphia Pike",0,1,0),
    ("PID109","Miranda Bailey","1010 Flourence Circle",0,1,0),
    ("PID110","Barry Sanders","100 Erving Lane",0,0,1),
    ("PID111","O.J. Simpson","101 Broad Streat",0,0,1),
    ("PID112","LaDainian Tomlinson","400 Picatoway Drive",0,0,1),
    ("PID113","Terry Bradshaw","52 Cheese Head Road",0,0,1)
;


--Customer


INSERT INTO Customer(pNum_FK,email,phone)
VALUES ("PID100","James@craigle.com",'2155551234'),
    ("PID101","Ben@craigle.com","2155559876"),
    ("PID102","Marcus@craigle.com","2155553456"),
    ("PID103","Leonard@craigle.com","2155558765"),
    ("PID104","Hawk@craigle.com","3025551234"),
    ("PID105","Phillip@craigle.com","3025559876"),
    ("PID106","Heath@craigle.com","3025554567")
;

INSERT INTO Order_Staff(pnum_FK,empID)
VALUES ("PID107","T100"),
    ("PID108","T200"),
    ("PID109","T300")
;

--delivery_Person

INSERT INTO Delivery_Person(pNum_FK,phone,model)
VALUES ("PID110","6105559876","Civic"),
    ("PID111","6105556789","beetle"),
    ("PID112","6105556754","F 150"),
    ("PID113","2155556567","Talon")
;


--Pizza_order


INSERT INTO Pizza_Order (orderNum,oDate,oType,empID_FK,customer_FK,driver_FK)
VALUES ("INV#0001","2023/08/13","Delivery","T100","PID100","PID110"),
("INV#0002","2023/08/13","Delivery","T200","PID101","PID111"),
("INV#0003","2023/08/13","Delivery","T300","PID102","PID112"),
("INV#0004","2023/08/14","Delivery","T100","PID103","PID113"),
("INV#0005","2023/08/14","Delivery","T200","PID104","PID110"),
("INV#0006","2023/08/14","Delivery","T300","PID105","PID111"),
("INV#0007","2023/08/15","Delivery","T100","PID106","PID112"),
("INV#0008","2023/08/15","Delivery","T200","PID104","PID113"),
("INV#0009","2023/08/15","Delivery","T300","PID105","PID110"),
("INV#0010","2023/08/15","Delivery","T300","PID106","PID111")
;

--Pizza 

INSERT INTO Pizza(itemNum,size,price)
VALUES(1,"SM",4.99),
(2,"MD",5.99),
(3,"LG",6.99),
(4,"XL",7.99)
;


--Toppings

INSERT INTO Toppings(itemNum,tname,price)
VALUES ("I10","sausage",1.00),
("I11","mushrooms",0.75),
("I12","onions",0.50),
("I13","peppers",0.75),
("I14","peperoni",1.00),
("I15","None",0.00)
;

--Order_item

INSERT INTO Order_Item (orderNum_FK,itemNum_FK)
VALUES ("INV#0001",2),
("INV#0001","1"),
("INV#0002","2"),
("INV#0003","3"),
("INV#0004","4"),
("INV#0005","1"),
("INV#0006","2"),
("INV#0007","3"),
("INV#0008","4"),
("INV#0009","1"),
("INV#0010","2")
;
--Pizza_topping

INSERT INTO Pizza_Topping (autoGen_FK,itemNum_FK)
VALUES (1,"I10"),
(1,"I12"),
(2,"I14"),
(3,"I11"),
(3,"I12"),
(3,"I13"),
(4,"I12"),
(4,"I13"),
(5,"I14"),
(6,"I14"),
(7,"I10"),
(8,"I10"),
(9,"I10"),
(10,"I10"),
(10,"I11"),
(10,"I12"),
(10,"I13"),
(10,"I15")
;
