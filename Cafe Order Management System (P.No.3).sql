CREATE DATABASE CafeOrderDB;

USE CafeOrderDB;

CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    Address1 VARCHAR(100),
    Address2 VARCHAR(100)
);

CREATE TABLE Staff (
    StaffID INT PRIMARY KEY,
    Name VARCHAR(100),
    Role VARCHAR(50)
);

CREATE TABLE TableInfo (
    TableID INT PRIMARY KEY,
    TableNumber INT,
    Seats INT
);

CREATE TABLE OrderStatus (
    OrderStatusID INT PRIMARY KEY,
    Name VARCHAR(50)
);

CREATE TABLE Product (
    ProductID INT PRIMARY KEY,
    Name VARCHAR(100),
    Price DECIMAL(10,2)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    StaffID INT,
    OrderStatusID INT,
    TableID INT,
    TotalAmount DECIMAL(10,2),
    OrderDate DATE,
    PreparationTime INT,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (StaffID) REFERENCES Staff(StaffID),
    FOREIGN KEY (OrderStatusID) REFERENCES OrderStatus(OrderStatusID),
    FOREIGN KEY (TableID) REFERENCES TableInfo(TableID)
);

CREATE TABLE OrderLine (
    OrderLineID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

CREATE TABLE Payment (
    PaymentID INT PRIMARY KEY,
    OrderID INT,
    PaymentType VARCHAR(50),
    TransactionID VARCHAR(50),
    PaymentDate DATE,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);


INSERT INTO Customer VALUES (1, 'Ali Ahmad', 'Street A', 'Building 1');
INSERT INTO Customer VALUES (2, 'Sara Kamal', 'Street B', 'Building 2');
INSERT INTO Customer VALUES (3, 'Mohamed Ziad', 'Street C', 'Building 3');


INSERT INTO Staff VALUES (1, 'Lina Hassan', 'Barista');
INSERT INTO Staff VALUES (2, 'Omar Farid', 'Waiter');
INSERT INTO Staff VALUES (3, 'Mona Tarek', 'Manager');


INSERT INTO TableInfo VALUES (1, 101, 2);
INSERT INTO TableInfo VALUES (2, 102, 4);
INSERT INTO TableInfo VALUES (3, 103, 6);


INSERT INTO OrderStatus VALUES (1, 'Pending');
INSERT INTO OrderStatus VALUES (2, 'In Progress');
INSERT INTO OrderStatus VALUES (3, 'Completed');


INSERT INTO Product VALUES (1, 'Cappuccino', 15.00);
INSERT INTO Product VALUES (2, 'Espresso', 12.00);
INSERT INTO Product VALUES (3, 'Croissant', 10.00);


INSERT INTO Orders VALUES (1, 1, 2, 1, 1, 25.00, '2025-04-10', 10);
INSERT INTO Orders VALUES (2, 2, 1, 2, 2, 27.00, '2025-04-10', 15);
INSERT INTO Orders VALUES (3, 3, 3, 3, 3, 22.00, '2025-04-11', 7);


INSERT INTO OrderLine VALUES (1, 1, 1, 1);
INSERT INTO OrderLine VALUES (2, 2, 2, 2);
INSERT INTO OrderLine VALUES (3, 3, 3, 2);


INSERT INTO Payment VALUES (1, 1, 'Cash', 'TX001', '2025-04-10');
INSERT INTO Payment VALUES (2, 2, 'Card', 'TX002', '2025-04-10');
INSERT INTO Payment VALUES (3, 3, 'Mobile Payment', 'TX003', '2025-04-11');

UPDATE Customer
SET Address1 = 'Street Z'
WHERE CustomerID = 1;


DELETE FROM Payment
WHERE PaymentID = 3;


SELECT * FROM Customer
WHERE Name LIKE 'A%';


SELECT * FROM Product
WHERE ProductID IN (1, 3);

SELECT * FROM Orders
WHERE TotalAmount BETWEEN 20 AND 26;

SELECT * FROM Payment
WHERE TransactionID IS NULL;

SELECT * FROM Payment
WHERE TransactionID IS NOT NULL;

SELECT DISTINCT PaymentType FROM Payment;

SELECT TOP 2 * FROM Orders;



SELECT * FROM Product
ORDER BY Price DESC;

SELECT PaymentType, COUNT(*) AS TotalPayments
FROM Payment
GROUP BY PaymentType;


CREATE INDEX idx_order_date
ON Orders (OrderDate);


CREATE VIEW OrderDetailsView AS
SELECT o.OrderID, c.Name AS CustomerName, s.Name AS StaffName, t.TableNumber, o.TotalAmount
FROM Orders o
JOIN Customer c ON o.CustomerID = c.CustomerID
JOIN Staff s ON o.StaffID = s.StaffID
JOIN TableInfo t ON o.TableID = t.TableID;


SELECT Name, Price
FROM Product
WHERE Price > (
    SELECT AVG(Price) FROM Product
);










