--------------------------------------------------------------------
-- Q1. Display all columns for all transactions.
-- Expected output: All columns
select *
FROM practical1.retail_sales.sales;
--------------------------------------------------------------------
-- Q2. Display only the Transaction ID, Date, and Customer ID for all records.
-- Expected output: Transaction ID, Date, Customer ID
select Transaction_ID,
       Date,
       Customer_ID
FROM practical1.retail_sales.sales;
--------------------------------------------------------------------
-- Q3. Display all the distinct product categories in the dataset.
-- Expected output: Product Category
select DISTINCT Product_Category
FROM practical1.retail_sales.sales;
--------------------------------------------------------------------
-- Q4. Display all the distinct gender values in the dataset.
-- Expected output: Gender
select DISTINCT Gender
FROM practical1.retail_sales.sales;
--------------------------------------------------------------------
-- Q5. Display all transactions where the Age is greater than 40.
-- Expected output: All columns
select *
FROM practical1.retail_sales.sales
WHERE Age > 40;
--------------------------------------------------------------------
-- Q6. Display all transactions where the Price per Unit is between 100 and 500.
-- Expected output: All columns
select *
FROM practical1.retail_sales.sales
Where PRICE_PER_UNIT between 100 AND 500;
--------------------------------------------------------------------
-- Q7. Display all transactions where the Product Category is either 'Beauty' or
-- 'Electronics'.
-- Expected output: All columns
select *
FROM practical1.retail_sales.sales
WHERE PRODUCT_CATEGORY = 'Beauty' OR PRODUCT_CATEGORY = 'Electronics';
--------------------------------------------------------------------
-- Q8. Display all transactions where the Product Category is not 'Clothing'.
-- Expected output: All columns
select *
FROM practical1.retail_sales.sales
WHERE PRODUCT_CATEGORY != 'Clothing';
--------------------------------------------------------------------
-- Q9. Display all transactions where the Quantity is greater than or equal to 3.
-- Expected output: All columns
select *
FROM practical1.retail_sales.sales
WHERE QUANTITY >= 3;
--------------------------------------------------------------------
-- Q10. Count the total number of transactions.
-- Expected output: Total_Transactions
select COUNT (TRANSACTION_ID) AS Total_Transactions
FROM practical1.retail_sales.sales;
--------------------------------------------------------------------
-- Q11. Find the average Age of customers.
-- Expected output: Average_Age
select AVG (AGE) AS Average_Age
FROM practical1.retail_sales.sales;
--------------------------------------------------------------------
-- Q12. Find the total quantity of products sold.
-- Expected output: Total_Quantity
select SUM (QUANTITY) AS Total_Quantity
FROM practical1.retail_sales.sales;
--------------------------------------------------------------------
-- Q13. Find the maximum Total Amount spent in a single transaction.
-- Expected output: Max_Total_Amount
select max (TOTAL_AMOUNT) AS Max_Total_Amount
FROM practical1.retail_sales.sales;
--------------------------------------------------------------------
-- Q14. Find the minimum Price per Unit in the dataset.
-- Expected output: Min_Price_per_Unit
select MIN (PRICE_PER_UNIT) AS Min_Price_Per_Unit
FROM practical1.retail_sales.sales;
--------------------------------------------------------------------
-- Q15. Find the number of transactions per Product Category.
-- Expected output: Product Category, Transaction_Count
select Product_Category,
       COUNT (Transaction_ID) AS Transaction_Count
FROM practical1.retail_sales.sales
Group BY PRODUCT_CATEGORY;
--------------------------------------------------------------------
-- Q16. Find the total revenue (Total Amount) per gender.
-- Expected output: Gender, Total_Revenue
select Gender,
       SUM(Quantity*Price_Per_Unit) AS Total_Revenue
FROM practical1.retail_sales.sales
Group By Gender;
--------------------------------------------------------------------
-- Q17. Find the average Price per Unit per product category.
-- Expected output: Product Category, Average_Price
select PRODUCT_CATEGORY,
       AVG (Price_Per_Unit) AS Average_Price
FROM practical1.retail_sales.sales
Group By PRODUCT_CATEGORY;
--------------------------------------------------------------------
-- Q18. Find the total revenue per product category where total revenue is greater than
-- 10,000.
-- Expected output: Product Category, Total_Revenue
select PRODUCT_CATEGORY,
       SUM (Quantity*Price_Per_Unit) AS Total_Revenue
FROM practical1.retail_sales.sales
Group By PRODUCT_CATEGORY
HAVING Total_Revenue > 10000;
--------------------------------------------------------------------
-- Q19. Find the average quantity per product category where the average is more than 2.
-- Expected output: Product Category, Average_Quantity
select PRODUCT_CATEGORY,
       AVG (QUANTITY) AS Average_Quantity
FROM practical1.retail_sales.sales
Group By PRODUCT_CATEGORY
Having Average_Quantity > 2;
--------------------------------------------------------------------
-- Q20. Display a column called Spending_Level that shows 'High' if Total Amount > 1000,
-- otherwise 'Low'.
-- Expected output: Transaction ID, Total Amount, Spending_Level
select Transaction_ID,
       Total_Amount,
CASE WHEN TOTAL_AMOUNT > 1000 THEN 'High'
     ELSE 'Low'
END AS Spending_Level
FROM practical1.retail_sales.sales;
--------------------------------------------------------------------
-- Q21. Display a new column called Age_Group that labels customers as:
-- 'Youth' if Age < 30
-- 'Adult' if Age is between 30 and 59
-- 'Senior' if Age >= 60
-- Expected output: Customer ID, Age, Age_Group
select Customer_ID,
       Age,
CASE WHEN AGE < 30 THEN 'Youth'
     WHEN AGE between 30 AND 59 THEN 'Adult'
     WHEN AGE >= 60 THEN 'Senior'
END AS Age_Group
FROM practical1.retail_sales.sales;



       
       
