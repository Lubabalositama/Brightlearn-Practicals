SELECT *
FROM`retail-479102`.Sales.Data
WHERE
EXTRACT(YEAR FROM Date) = 2023;
--------------------------------
-- 2. Filtering + Conditions
-- Q2. Display all transactions where the Total Amount is more than the average Total Amount
-- of the entire dataset.
-- Expected output: All columns
SELECT *
FROM`retail-479102`.Sales.Data
WHERE `Total Amount` > (
    SELECT AVG(`Total Amount`)
    FROM`retail-479102`.Sales.Data
);
--------------------------------
-- Q3. Calculate the total revenue (sum of Total Amount).
-- Expected output: Total_Revenue
SELECT 
    SUM(`Total Amount`) AS Total_Revenue
FROM`retail-479102`.Sales.Data;
--------------------------------
-- Q4. Display all distinct Product Categories in the dataset.
-- Expected output: Product_Category
SELECT DISTINCT(`Product Category`) AS Product_Category
FROM`retail-479102`.Sales.Data;
--------------------------------
-- Q5. For each Product Category, calculate the total quantity sold.
-- Expected output: Product_Category, Total_Quantity
SELECT `Product Category`,
        SUM(Quantity) AS Total_Quantity
FROM`retail-479102`.Sales.Data
GROUP BY `Product Category`;
--------------------------------
-- Q6. Create a column called Age_Group that classifies customers as ‘Youth’ (<30), ‘Adult’
-- (30–59), and ‘Senior’ (60+).
-- Expected output: Customer_ID, Age, Age_Group
SELECT `Customer ID`,
       Age,
CASE
       WHEN Age < 30 THEN 'Youth'
       WHEN Age BETWEEN 30 AND 59 THEN 'Adult'
       WHEN Age > 59 THEN 'Senior'
       END AS Age_Group
FROM`retail-479102`.Sales.Data;
--------------------------------
-- Q7. For each Gender, count how many high-value transactions occurred (where Total
-- Amount > 500).
-- Expected output: Gender, High_Value_Transactions
SELECT Gender,
       COUNT(`Total Amount`) AS High_Value_Transactions
FROM`retail-479102`.Sales.Data
WHERE `Total Amount` > 500
GROUP BY Gender;
--------------------------------
-- Q8. For each Product Category, show only those categories where the total revenue
-- exceeds 5,000.
-- Expected output: Product_Category, Total_Revenue
SELECT DISTINCT(`Product Category`) AS Product_Category,
       SUM(`Total Amount`) AS Total_Revenue
FROM`retail-479102`.Sales.Data
GROUP BY Product_Category
Having Total_Revenue > 5000;
--------------------------------
-- Q9. Display a new column called Unit_Cost_Category that labels a transaction as:
-- 'Cheap' if Price per Unit < 50
-- 'Moderate' if Price per Unit between 50 and 200
-- 'Expensive' if Price per Unit > 200
-- Expected output: Transaction_ID, Price_per_Unit, Unit_Cost_Category
SELECT `Transaction ID`,
        `Price per Unit`,
CASE
       WHEN `Price per Unit` < 50 THEN 'Cheap'
       WHEN `Price per Unit` BETWEEN 50 AND 200 THEN 'Moderate'
       WHEN `Price per Unit` > 200 THEN 'Expensive'
       END AS Unit_Cost_Category
FROM`retail-479102`.Sales.Data;
--------------------------------
-- Q10. Display all transactions from customers aged 40 or older and add a column
-- Spending_Level showing ‘High’ if Total Amount > 1000, otherwise ‘Low’.
-- Expected output: Customer_ID, Age, Total_Amount, Spending_Level
SELECT `Customer ID`,
        Age,
       `Total Amount`,
CASE
       WHEN `Total Amount` > 1000 THEN 'High'
       ELSE 'Low'
       END AS Spending_Level
FROM`retail-479102`.Sales.Data
WHERE Age > 40;
