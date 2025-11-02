-- Find all records where Size is missing and the purchase_amount is greater than
-- 50.
-- Expected Columns: Customer ID, Size, purchase_amount, Item
-- Purchased
SELECT CUSTOMER_ID,
       SIZE,
       PURCHASE_AMOUNT,
       ITEM_PURCHASED
FROM PRACTICAL3.NULLFUNCTIONS.SHOPINGTRENDS
WHERE SIZE IS NULL AND PURCHASE_AMOUNT > 50;
------------------------------------------------------------------------------------

-- List the total number of purchases grouped by Season, treating NULL values a
-- s 'Unknown Season'.
-- Expected Columns: Season, Total Purchases
SELECT IFNULL(SEASON,'UNKNOWN SEASON') AS SEASON,
       COUNT(*) AS TOTAL_PURCHASES
FROM PRACTICAL3.NULLFUNCTIONS.SHOPINGTRENDS
GROUP BY SEASON;
------------------------------------------------------------------------------------

-- Count how many customers used each Payment Method, treating NULLs as
-- 'Not Provided'.
-- Expected Columns: Payment Method, Customer Count
SELECT IFNULL (PAYMENT_METHOD,'NOT PROVIDED') AS PAYMENT_METHOD,
       COUNT(CUSTOMER_ID) AS CUSTOMER_COUNT
FROM PRACTICAL3.NULLFUNCTIONS.SHOPINGTRENDS
GROUP BY PAYMENT_METHOD;
------------------------------------------------------------------------------------

-- Show customers where Promo Code Used is NULL and Review Rating is below
-- 3.0.
-- Expected Columns: Customer ID, Promo Code Used, Review Rating, Item Purchased
SELECT CUSTOMER_ID,
       PROMO_CODE_USED,
       REVIEW_RATING,
       ITEM_PURCHASED
FROM PRACTICAL3.NULLFUNCTIONS.SHOPINGTRENDS
WHERE PROMO_CODE_USED IS NULL AND REVIEW_RATING < 3.0;
------------------------------------------------------------------------------------

-- Group customers by Shipping
-- Type, and return the average purchase_amount, treating missing values as 0.
-- Expected Columns: Shipping Type, Average purchase_amount
SELECT SHIPPING_TYPE,
       IFNULL(AVG(PURCHASE_AMOUNT),0) AS AVERAGE_PURCHASE_AMOUNT
FROM PRACTICAL3.NULLFUNCTIONS.SHOPINGTRENDS
GROUP BY SHIPPING_TYPE;
------------------------------------------------------------------------------------

-- Display the number of purchases per Location only for those with more than
-- 5 purchases and no NULL Payment Method.
-- Expected Columns: Location, Total Purchases
SELECT LOCATION,
       PAYMENT_METHOD,
       COUNT(*) AS TOTAL_PURCHASES,
FROM PRACTICAL3.NULLFUNCTIONS.SHOPINGTRENDS
GROUP BY ALL
HAVING TOTAL_PURCHASES > 5 AND PAYMENT_METHOD IS NOT NULL;
------------------------------------------------------------------------------------

-- Create a column Spender Category that classifies customers using CASE:
-- 'High' if amount > 80, 'Medium' if BETWEEN 50 AND 80,
-- 'Low' otherwise. Replace NULLs in purchase_amount with 0.
-- Expected Columns: Customer ID, purchase_amount, Spender Category
SELECT CUSTOMER_ID,
       IFNULL(PURCHASE_AMOUNT,0) AS PURCHASE_AMOUNT,
CASE WHEN PURCHASE_AMOUNT > 80 THEN 'HIGH'
     WHEN PURCHASE_AMOUNT BETWEEN 50 AND 80 THEN 'MEDIUM'
     ELSE 'LOW'
     END AS SPENDER_CATEGORY
FROM PRACTICAL3.NULLFUNCTIONS.SHOPINGTRENDS;
------------------------------------------------------------------------------------

-- Find customers who have no Previous
-- Purchases value but whose Color is not NULL.
-- Expected Columns: Customer ID, Color, Previous Purchases
SELECT CUSTOMER_ID,
       COLOR,
       PREVIOUS_PURCHASES
FROM PRACTICAL3.NULLFUNCTIONS.SHOPINGTRENDS
WHERE COLOR IS NOT NULL AND PREVIOUS_PURCHASES IS NULL;
------------------------------------------------------------------------------------

-- Group records by Frequency of
-- Purchases and show the total amount spent per group, treating NULL frequenc
-- ies as 'Unknown'.
-- Expected Columns: Frequency of Purchases, Total purchase_amount
SELECT IFNULL(FREQUENCY_OF_PURCHASES, 'UNKNOWN') AS FREQUENCY_OF_PURCHASES,
       SUM(PURCHASE_AMOUNT) AS TOTAL_PURCHASE_AMOUNT
FROM PRACTICAL3.NULLFUNCTIONS.SHOPINGTRENDS
GROUP BY FREQUENCY_OF_PURCHASES;
------------------------------------------------------------------------------------

-- Display a list of all Category values with the number of times each was purcha
-- sed, excluding rows where Categoryis NULL.
-- Expected Columns: Category, Total Purchases
SELECT CATEGORY,
       COUNT(*) AS TOTAL_PURCHASES
FROM PRACTICAL3.NULLFUNCTIONS.SHOPINGTRENDS
GROUP BY CATEGORY
HAVING CATEGORY IS NULL;
------------------------------------------------------------------------------------

-- Return the top
-- 5 Locations with the highest total purchase_amount, replacing NULLs in amount
-- with 0.
-- Expected Columns: Location, Total purchase_amount
SELECT LOCATION,
       IFNULL(SUM(PURCHASE_AMOUNT),0) AS TOTAL_PURCHASE_AMOUNT
FROM PRACTICAL3.NULLFUNCTIONS.SHOPINGTRENDS
GROUP BY LOCATION
LIMIT 5;
------------------------------------------------------------------------------------

-- Group customers by Gender and Size, and count how many entries have a NUL
-- L Color.
-- Expected Columns: Gender, Size, Null Color Count
SELECT GENDER,
       SIZE,
       SUM(CASE WHEN COLOR IS NULL THEN 1
       ELSE 0
       END) AS NULL_COLOR_COUNT
FROM PRACTICAL3.NULLFUNCTIONS.SHOPINGTRENDS
GROUP BY GENDER,SIZE
HAVING NULL_COLOR_COUNT > 0;
------------------------------------------------------------------------------------

-- Identify all Item Purchased where more than 3 purchases had NULL Shipping
-- Type.
-- Expected Columns: Item Purchased, NULL Shipping Type Count
SELECT ITEM_PURCHASED,
       SUM(CASE WHEN SHIPPING_TYPE IS NULL THEN 1
       ELSE 1
       END) AS NULL_SHIPPING_TYPE
FROM PRACTICAL3.NULLFUNCTIONS.SHOPINGTRENDS
GROUP BY ITEM_PURCHASED
HAVING NULL_SHIPPING_TYPE > 3;
------------------------------------------------------------------------------------

-- Show a count of how many customers per Payment Method have NULL Review
-- Rating.
-- Expected Columns: Payment Method, Missing Review Rating Count
SELECT PAYMENT_METHOD,
       SUM(CASE WHEN REVIEW_RATING IS NULL THEN 1
       ELSE 0
       END) AS MISSING_REVIEW_RATING
FROM PRACTICAL3.NULLFUNCTIONS.SHOPINGTRENDS
GROUP BY PAYMENT_METHOD
HAVING MISSING_REVIEW_RATING > 0;
------------------------------------------------------------------------------------

-- Group by Category and return the average Review Rating, replacing NULLs with
-- 0, and filter only where average is greater than 3.5.
-- Expected Columns: Category, Average Review Rating
SELECT CATEGORY,
       COALESCE(AVG(REVIEW_RATING),0) AS AVERAGE_REVIEW_RATING
FROM PRACTICAL3.NULLFUNCTIONS.SHOPINGTRENDS
GROUP BY CATEGORY
HAVING AVERAGE_REVIEW_RATING > 3.5;
------------------------------------------------------------------------------------

-- List all Colors that are missing (NULL) in at least
-- 2 rows and the average Age of customers for those rows.
-- Expected Columns: Color, Average Age
SELECT COLOR,
       AVG(AGE) AS AVERAGE_AGE
FROM PRACTICAL3.NULLFUNCTIONS.SHOPINGTRENDS
GROUP BY COLOR
HAVING COLOR IS NULL AND COUNT (*) >= 2;
------------------------------------------------------------------------------------

-- Use CASE to create a column Delivery Speed: 'Fast' if Shipping Type is 'Express' or
-- 'Next Day Air', 'Slow' if 'Standard',
-- 'Other' for all else including NULL. Then count how many customers fall into
-- each category.
-- Expected Columns: Delivery Speed, Customer Count
SELECT 
CASE WHEN SHIPPING_TYPE = 'EXPRESS' OR SHIPPING_TYPE = 'NEXT DAY AIR' THEN 'FAST'
     WHEN SHIPPING_TYPE = 'STANDARD' THEN 'SLOW'
     ELSE 'OTHER'
     END AS DELIVERY_SPEED,
     COUNT(*) AS CUSTOMER_COUNT
FROM PRACTICAL3.NULLFUNCTIONS.SHOPINGTRENDS
GROUP BY DELIVERY_SPEED;
------------------------------------------------------------------------------------

-- Find customers whose purchase_amount is NULL and whose Promo Code Used is
-- 'Yes'.
-- Expected Columns: Customer ID, purchase_amount, Promo Code Used
SELECT CUSTOMER_ID,
       PURCHASE_AMOUNT,
       PROMO_CODE_USED
FROM PRACTICAL3.NULLFUNCTIONS.SHOPINGTRENDS
WHERE PURCHASE_AMOUNT IS NULL AND PROMO_CODE_USED = 'YES';
------------------------------------------------------------------------------------

-- Group by Location and show the maximum Previous
-- Purchases, replacing NULLs with 0, only where the average rating is above 4.0.
-- Expected Columns: Location, Max Previous Purchases, Average
-- Review Rating
SELECT LOCATION,
       COALESCE(MAX(PREVIOUS_PURCHASES), 0) AS MAX_PREVIOUS_PURCHASES,
       AVG(REVIEW_RATING) AS AVERAGE_RATING
FROM PRACTICAL3.NULLFUNCTIONS.SHOPINGTRENDS
GROUP BY LOCATION
HAVING AVERAGE_RATING > 4.0;
------------------------------------------------------------------------------------

-- Show customers who have a NULL Shipping
-- Type but made a purchase in the range of 30 to 70 USD.
-- Expected Columns: Customer ID, Shipping
-- Type, purchase_amount, Item Purchased
SELECT CUSTOMER_ID,
       SHIPPING_TYPE,
       PURCHASE_AMOUNT,
       ITEM_PURCHASED
FROM PRACTICAL3.NULLFUNCTIONS.SHOPINGTRENDS
WHERE SHIPPING_TYPE IS NULL AND PURCHASE_AMOUNT BETWEEN 30 AND 70;
