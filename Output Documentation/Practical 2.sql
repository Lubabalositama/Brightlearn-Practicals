-- 1. INNER JOIN: Orders with Customer and Product Names
-- Question:
-- List all orders along with the customer name and product name.
-- Expected Output Columns:
-- OrderID, OrderDate, CustomerName, ProductName, Quantity
SELECT ORDERID,
       ORDERDATE,
       CUSTOMERNAME,
       PRODUCTNAME,
       QUANTITY
FROM PRACTICAL2.SQLJOINS.ORDERS AS A
INNER JOIN PRACTICAL2.SQLJOINS.CUSTOMERS AS B
ON
A.CUSTOMERID = B.CUSTOMERID
INNER JOIN PRACTICAL2.SQLJOINS.PRODUCTS AS C
ON
A.PRODUCTID = C.PRODUCTID;
-------------------------------------------------------------------------

-- 2. INNER JOIN: Customers Who Placed Orders
-- Question:
-- Which customers have placed at least one order?
-- Expected Output Columns:
-- CustomerID, CustomerName, Country, OrderID, OrderDate
SELECT B.CUSTOMERID,
       B.CUSTOMERNAME,
       B.COUNTRY,
       A.ORDERID,
       A.ORDERDATE
FROM PRACTICAL2.SQLJOINS.ORDERS AS A
INNER JOIN PRACTICAL2.SQLJOINS.CUSTOMERS AS B
ON
A.CUSTOMERID = B.CUSTOMERID;
-------------------------------------------------------------------------

-- 3. LEFT JOIN: All Customers and Their Orders
-- Question:
-- List all customers and any orders they might have placed. Include customers who have
-- not placed any orders.
-- Expected Output Columns:
-- CustomerID, CustomerName, Country, OrderID, OrderDate, ProductID, Quantity
SELECT B.CUSTOMERID,
       B.CUSTOMERNAME,
       B.COUNTRY,
       A.ORDERID,
       A.ORDERDATE,
       A.PRODUCTID,
       A.QUANTITY
FROM PRACTICAL2.SQLJOINS.ORDERS AS A
LEFT JOIN PRACTICAL2.SQLJOINS.CUSTOMERS AS B
ON
A.CUSTOMERID = B.CUSTOMERID;
-------------------------------------------------------------------------

-- 4. LEFT JOIN: Product Order Count
-- Question:
-- List all products and how many times each was ordered (if any).
-- Expected Output Columns:
-- ProductID, ProductName, TotalOrders
-- (TotalOrders is the count of how many times the product appears in orders)
SELECT A.PRODUCTID,
       A.PRODUCTNAME,
       COUNT(B.ORDERID) AS TOTALORDERS
FROM PRACTICAL2.SQLJOINS.PRODUCTS AS A
LEFT JOIN PRACTICAL2.SQLJOINS.ORDERS AS B
ON
A.PRODUCTID = B.PRODUCTID
GROUP BY ALL;
-------------------------------------------------------------------------

-- 5. RIGHT JOIN: Orders with Product Info (Include Products Not Ordered)
-- Question:
-- Find all orders along with product details, including any products that might not have
-- been ordered.
-- Expected Output Columns:
-- OrderID, OrderDate, ProductID, ProductName, Price, Quantity
SELECT B.ORDERID,
       B.ORDERDATE,
       B.PRODUCTID,
       A.PRODUCTNAME,
       A.PRICE,
       B.QUANTITY
FROM PRACTICAL2.SQLJOINS.PRODUCTS AS A
RIGHT JOIN PRACTICAL2.SQLJOINS.ORDERS AS B
ON
A.PRODUCTID = B.PRODUCTID;
-------------------------------------------------------------------------

-- 6. RIGHT JOIN: Customer Info with Orders (Include All Customers)
-- Question:
-- Which customers have made orders, and include customers even if they have never
-- placed an order.
-- Expected Output Columns:
-- CustomerID, CustomerName, Country, OrderID, OrderDate, ProductID, Quantity
SELECT B.CUSTOMERID,
       A.CUSTOMERNAME,
       A.COUNTRY,
       B.ORDERID,
       B.ORDERDATE,
       B.PRODUCTID,
       B.QUANTITY
FROM PRACTICAL2.SQLJOINS.CUSTOMERS AS A
RIGHT JOIN PRACTICAL2.SQLJOINS.ORDERS AS B
ON
A.CUSTOMERID = B.CUSTOMERID;
-------------------------------------------------------------------------

-- 7. FULL OUTER JOIN: All Customers and All Orders
-- Question:
-- List all customers and orders, showing NULLs where customers have not ordered or
-- where orders have no customer info.
--Expected Output Columns:
-- CustomerID, CustomerName, Country, OrderID, OrderDate, ProductID, Quantity
SELECT A.CUSTOMERID,
       A.CUSTOMERNAME,
       A.COUNTRY,
       B.ORDERID,
       B.ORDERDATE,
       B.PRODUCTID,
       B.QUANTITY
FROM PRACTICAL2.SQLJOINS.CUSTOMERS AS A
FULL OUTER JOIN PRACTICAL2.SQLJOINS.ORDERS AS B
ON
A.CUSTOMERID = B.CUSTOMERID;
-------------------------------------------------------------------------

-- 8. FULL OUTER JOIN: All Products and Orders
-- Question:
-- List all products and orders, showing NULLs where products were never ordered or
-- orders are missing product info.
-- Expected Output Columns:
-- ProductID, ProductName, Price, OrderID, OrderDate, CustomerID, Quantity
SELECT A.PRODUCTID,
       A.PRODUCTNAME,
       B.ORDERID,
       B.ORDERDATE,
       B.CUSTOMERID,
       B.QUANTITY
FROM PRACTICAL2.SQLJOINS.PRODUCTS AS A
FULL OUTER JOIN PRACTICAL2.SQLJOINS.ORDERS AS B
ON
A.PRODUCTID = B.PRODUCTID;
