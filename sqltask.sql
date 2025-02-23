--Create a database named RetailStoreDB
CREATE DATABASE RetailStoreDB;
USE RetailStoreDB;

--Create three tables
CREATE TABLE Customers(
	CustomerID int PRIMARY KEY,
	FirstName varchar(100),
	LastName varchar(100),
	Email varchar(100),
	RegistrationDate date
);

CREATE TABLE Products(
	ProductID int PRIMARY KEY,
	ProductName varchar(100),
	Category varchar(100),
	Price float,
	StockQuantity int
);

CREATE TABLE Orders(
	OrderID int PRIMARY KEY,
	CustomerID int FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
	ProductID int FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
	OrderDate date,
	Quantity int
);

--Insert at least 5 records into each table
INSERT INTO Customers(CustomerID,FirstName,LastName,Email,RegistrationDate)
VALUES
(2060,'MAYA','MENSHAWY','m.hatem2360','2023-10-1'),
(2012,'ROWAYDA','SULTAN','r.hatem2312','2023-9-14'),
(1010,'MARIAM','SHAHINN','m.mohamed2310','2023-11-26'),
(1212,'JANA','OTHMAN','j.mohamed2312','2023-11-30'),
(1234,'NARDY','ABDULLAH','n.abdullah2334','2023-12-1');

INSERT INTO Products(ProductID,ProductName,Category,Price,StockQuantity)
VALUES
(1111,'MILK','DIARY',120.0,70),
(2222,'EGGS','DIARY',200.0,80),
(3333,'CORN','CANS',70.0,40),
(4444,'COCOA','DRINKS',50.0,50),
(5555,'MEAT','MEAT',300.0,60);

INSERT INTO Orders(OrderID,CustomerID,ProductID,OrderDate,Quantity)
VALUES
(151,2060,4444,'2023-9-15',9),
(262,2012,3333,'2023-9-15',80),
(383,1212,5555,'2023-9-15',40),
(494,1234,1111,'2023-9-15',50),
(575,1010,2222,'2023-9-15',60);

--Perform queries
--Show all records from each table
SELECT * FROM Customers;

SELECT * FROM Products;

SELECT * FROM Orders;

--Show customers who registered after a specific date
SELECT * FROM Customers WHERE RegistrationDate > '2023-11-25';

--Select the top 3 most expensive products
SELECT TOP 3 Price FROM Products;

--Join tables to display
--Orders with customer names and product details
SELECT Orders.OrderID, Customers.FirstName, Orders.OrderDate 
FROM Orders 
JOIN Customers ON Orders.CustomerID = Customers.CustomerID;

--Total amount spent by each customer
SELECT Customers.FirstName, Orders.ProductID, Products.Price
FROM Orders
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID
INNER JOIN Products ON Orders.ProductID = Products.ProductID;

--Use GROUP BY to find
--The number of orders placed by each customer
SELECT Customers.FirstName, COUNT(Orders.OrderID) 
AS NumberOfOrders FROM Orders
LEFT JOIN Customers ON Orders.CustomerID = Customers.CustomerID
GROUP BY FirstName;

--Total sales for each product
SELECT Products.ProductID, Products.ProductName, SUM(Orders.Quantity)
AS TotalSales FROM Orders
JOIN Products ON Orders.ProductID = Products.ProductID
GROUP BY Products.ProductID, Products.ProductName;