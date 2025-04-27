-- Creating the original table that violates the 1NF
CREATE DATABASE sampledb;
CREATE TABLE ProductDetail (
OrderID INT,
CustomerName VARCHAR(100),
Products VARCHAR(255)
);
INSERT INTO ProductDetail (OrderID, CustomerName, Products)
VALUES 
(101, 'John Doe', 'Laptop, Mouse'),
(102, 'Jane Smith', 'Tablet, Keyboard, Mouse'),
(103, 'Emily Clark', 'Phone');

-- Achieving the 1NF, each row to hold a single value
CREATE TABLE ProductDetail_1NF (
OrderID INT,
CustomerName VARCHAR(100),
Product VARCHAR(100)
);
INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product)
VALUES
(101, 'John Doe', 'Laptop'),
(101, 'John Doe', 'Mouse'),
(102, 'Jane Smith', 'Tablet'),
(102, 'Jane Smith', 'Keyboard'),
(102, 'Jane Smith', 'Mouse'),
(103, 'Emily Clark', 'Phone');

-- Achieving the 2NF,We split the tables into smaller tables to avoid partial dependencies,
-- Creating the first small table, orders, and inserting values.
CREATE TABLE Orders (
OrderID INT PRIMARY KEY,
CustomerName VARCHAR(100)
);
INSERT INTO Orders (OrderID, CustomerName)
VALUES
(101, 'John Doe'),
(102, 'Jane Smith'),
(103, 'Emily Clark');

-- creating second small table orderproducts and adding values
CREATE TABLE OrderProducts (
OrderID INT,
Product VARCHAR(100),
Quantity INT,
PRIMARY KEY (OrderID, Product),
FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);
INSERT INTO OrderProducts (OrderID, Product, Quantity)
VALUES
(101, 'Laptop', 2),
(101, 'Mouse', 1),
(102, 'Tablet', 3),
(102, 'Keyboard', 1),
(102, 'Mouse', 2),
(103, 'Phone', 1);
