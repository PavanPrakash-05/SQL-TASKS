-- Schema
CREATE SCHEMA sales_task;

-- Tables
-- Customer Table
CREATE TABLE 
	sales_task.Customers(
	  CustomerID INT PRIMARY KEY
	, Email VARCHAR(30) UNIQUE NOT NULL
	, Address TEXT
	, Phone CHAR(10) NOT NULL
	, Age SMALLINT NOT NULL
	, DOB DATE
	);
    
-- Products Table
CREATE TABLE
	sales_task.Products(
	   ProductID INT PRIMARY KEY
	 , ProductName VARCHAR(30) NOT NULL
     , Price DECIMAL(10,2) 
     , CHECK (Price > 0)
     , Description TEXT
     , Category VARCHAR(20) NOT NULL
);

-- Orders Table
CREATE TABLE
	sales_task.Orders(
		OrderID INT PRIMARY KEY AUTO_INCREMENT
	  , CustomerID INT
	  , FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
	  , ProductID INT
      , FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
      , OrderDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
      , Status VARCHAR(20) 
      , ShippingAddress TEXT
      , PaymentMethod VARCHAR(30)
      , PaymentStatus VARCHAR(20)
	  , ShippingMethod VARCHAR(30)
      , TrackingNumber VARCHAR(50)
      , Notes TEXT
);

-- Values
-- Customers
INSERT INTO sales_task.customers(CustomerID, email, address, phone, age, dob)
VALUES
  (1, 'john.doe@example.com', '123 Main St', '9876543210', 30, '1993-05-15'),
  (2, 'jane.smith@example.com', '456 Elm St', '8765432109', 25, '1998-09-22'),
  (3, 'robert.johnson@example.com', '789 Oak St', '7890123456', 40, '1983-03-10'),
  (4, 'susan.white@example.com', '101 Pine St', '8765432101', 35, '1987-11-05'),
  (5, 'david.wilson@example.com', '222 Birch St', '7654321098', 28, '1995-07-20'),
  (6, 'mary.brown@example.com', '333 Cedar St', '6543210987', 22, '2001-01-12'),
  (7, 'william.anderson@example.com', '444 Maple St', '5432109876', 45, '1978-12-30'),
  (8, 'laura.jones@example.com', '555 Fir St', '4321098765', 29, '1994-04-18'),
  (9, 'kevin.miller@example.com', '666 Redwood St', '3210987654', 32, '1991-08-28'),
  (10, 'emily.taylor@example.com', '777 Sequoia St', '2109876543', 27, '1996-12-03');


-- Products
INSERT INTO sales_task.products (ProductID, ProductName, price, description, category)
VALUES
  (1, 'Laptop', 899.99, 'High-performance laptop with Intel i7 processor', 'Electronics'),
  (2, 'Smartphone', 599.99, 'Latest model smartphone with 5G support', 'Electronics'),
  (3, 'Camera', 499.99, 'Digital camera with 20MP resolution', 'Electronics'),
  (4, 'Coffee Maker', 49.99, 'Drip coffee maker with timer', 'Appliances'),
  (5, 'Toaster', 29.99, '2-slice toaster with adjustable browning', 'Appliances'),
  (6, 'Blender', 79.99, 'High-speed blender for smoothies and soups', 'Appliances'),
  (7, 'Running Shoes', 79.99, 'High-performance running shoes', 'Clothing'),
  (8, 'T-shirt', 19.99, 'Cotton crew-neck t-shirt in various colors', 'Clothing'),
  (9, 'Backpack', 39.99, 'Lightweight backpack with multiple compartments', 'Accessories'),
  (10, 'Headphones', 129.99, 'Over-ear wireless headphones with noise cancellation', 'Electronics');

INSERT INTO orders (CustomerID, ProductID, status, ShippingAddress, PaymentMethod, PaymentStatus, TrackingNumber, Notes)
VALUES
  (1, 1, 'Processing', '123 Main St', 'Credit Card', 'Paid', '1234567890', 'Note for order 1'),
  (2, 5, 'Shipped', '456 Elm St', 'PayPal', 'Paid', '2345678901', 'Note for order 2'),
  (3, 3, 'Delivered', '789 Oak St', 'COD', 'Pending', '3456789012', 'Note for order 3'),
  (4, 8, 'Processing', '101 Pine St', 'Credit Card', 'Paid', '4567890123', 'Note for order 4'),
  (5, 10, 'Shipped', '222 Birch St', 'PayPal', 'Pending', '5678901234', 'Note for order 5'),
  (6, 2, 'Processing', '333 Cedar St', 'Credit Card', 'Pending', '6789012345', 'Note for order 6'),
  (7, 7, 'Shipped', '444 Maple St', 'COD', 'Pending', '7890123456', 'Note for order 7'),
  (8, 9, 'Processing', '555 Fir St', 'GPAY', 'Paid', '8901234567', 'Note for order 8'),
  (9, 4, 'Shipped', '666 Redwood St', 'PayPal', 'Paid', '9012345678', 'Note for order 9'),
  (10, 6, 'Delivered', '777 Sequoia St', 'Credit Card', 'Paid', '0123456789', 'Note for order 10');


-- Execuetion
SELECT * FROM sales_task.customers;
SELECT * FROM sales_task.products;
SELECT * FROM sales_task.orders;