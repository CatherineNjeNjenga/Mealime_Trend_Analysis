---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- OneStop Electronics has been collecting data on a variety of key elements, including transactions, transaction statuses, customer information, products, reviews and sessions data. 
-- However, the data is currently unrefined and underutilized, presenting both challenges and opportunities for unlocking valuable insights.
-- In cleaning and analyzing OneStop's data, meaningful insights can be extracted from the dataset to support the company’s various teams—including finance, sales, product, and marketing. 

-- Data spans from 2024-2025

-- NOTE: All data is fictional
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Taking a look at the tables in our dataset

## Products Table
SELECT *
FROM products LIMIT 1000;

## Customers Table
SELECT *
FROM customers LIMIT 1000;

## Transactions Table
SELECT *
FROM transactions LIMIT 1000;

## Sessions Table
SELECT *
FROM sessions LIMIT 1000;

## Reviews Table
SELECT *
FROM reviews LIMIT 1000;

--------------------------
-- Sales Metrics & Trends
--------------------------

## Creating a tranasctions_detailed view by joining transactios, customer and products table.
CREATE VIEW transactions_detailed AS
SELECT transaction_id AS id, t.customer_id, c.country AS customer_country, 
  c.segment AS customer_segment, c.is_churned AS customer_account_status, 
  t.product_id, p.product_name, transaction_date, quantity, unit_price, 
  total_amount, discount_applied, status  
FROM transactions AS t
LEFT JOIN customers AS c
USING (customer_id)
LEFT JOIN products AS p
USING (product_id);

## Calculating company wide sales metrics (revenue, aov, and order counts)
SELECT
  CAST(SUM(total_amount) as INT) AS total_sales, -- converting to integer
  CAST(AVG(total_amount) as INT) AS aov, -- converting to integer
  COUNT(DISTINCT id) AS order_count
FROM transactions_detailed;

## Calculating yearly sales metrics 
SELECT  
  EXTRACT(year FROM transaction_date) AS purchase_year, 
  CAST(SUM(total_amount) as INT) AS total_sales, 
  CAST(AVG(total_amount) as INT) AS aov, 
  COUNT(DISTINCT id) AS order_count
FROM transactions_detailed
GROUP BY 1
ORDER BY 1 DESC;

## Calculating quarterly sales metrics 
SELECT
  strftime('%Y', transaction_date) AS purchase_year,
  ((CAST(strftime('%m', transaction_date) AS INTEGER) - 1) / 3) + 1 AS purchase_quarter,
  CAST(SUM(total_amount) as INT) AS total_sales, 
  CAST(AVG(total_amount) as INT) AS aov, 
  COUNT(DISTINCT id) AS order_count
FROM transactions_detailed
GROUP BY 1, 2
ORDER BY 1 DESC, 2 ASC;

## Calculating monthly sales metrics 
SELECT 
  strftime('%Y', transaction_date) AS purchase_year,, 
  strftime('%m', transaction_date) AS purchase_month, 
  CAST(SUM(total_amount) as INT) AS total_sales, 
  CAST(AVG(total_amount) as INT) AS aov,
  COUNT(DISTINCT id) AS order_count
FROM transactions_detailed
GROUP BY 1,2
ORDER BY 1 DESC,2 ASC;

------------------------------------------------------
-- Further Analysis of VIP Customer Segment AOV Trend 
------------------------------------------------------

##  VIP customer segment performance metrics
SELECT 
  DATE(transaction_date, 'start of month') AS purchase_month, 
  CAST(SUM(total_amount) as INT) AS total_sales, 
  CAST(AVG(total_amount) as INT) AS aov,
  COUNT(DISTINCT id) AS order_count
FROM transactions_detailed
WHERE 
  LOWER(customer_segment) LIKE '%vip%'  
GROUP BY 1
ORDER BY 1 DESC;

## Average yearly AOV for Apple IPhone
SELECT
  CAST(AVG(total_amount) as INT) AS aov
FROM transactions_detailed
WHERE 
  LOWER(customer_segment) LIKE '%vip%';

## Average monthly AOV for VIP Customer Segment
WITH monthly_aov AS
(
SELECT
  DATE(transaction_date, 'start of month') AS purchase_month, 
  CAST(SUM(total_amount) as INT) AS total_sales, 
  CAST(AVG(total_amount) as INT) AS aov,
  COUNT(DISTINCT id) AS order_count
FROM martly_detailed
WHERE 
  LOWER(customer_segment) LIKE '%vip%'  
GROUP BY 1
ORDER BY 1 DESC
)
SELECT 
  AVG(aov) AS avg_monthly_aov
FROM monthly_aov;

## Show the top 3 products by AOV per year (Result: VIP is 2nd highest in AOV per year as well)
WITH aov_per_year AS
(
SELECT 
  strftime('%Y', transaction_date) AS purchase_year,
  customer_segment,
  CAST(AVG(total_amount) as INT) as aov
FROM transactions_detailed
GROUP BY 1,2
), ranked AS (
  SELECT 
    *,
    RANK() OVER (PARTITION BY purchase_year ORDER BY aov DESC) as aov_rank,
    ROW_NUMBER() OVER (PARTITION BY purchase_year ORDER BY aov DESC) as aov_rownum
  FROM aov_per_year
)
SELECT *
FROM ranked
WHERE aov_rank <= 4
ORDER BY purchase_year DESC;

---------------------------------------------------------------------------------------------------
-- Customer Segmentation Analysis: Which customer segments have a history of high-value purchases?
---------------------------------------------------------------------------------------------------

-- Purchase Plaform

-- Average difference between purchase platforms 
-- On Average, orders purchased on the desktop are $1 more than orders purchased on mobile phones

## Aggregating AOV by Purchase Device 
WITH device_aov AS
(
SELECT 
  device AS purchase_device,
  CAST(AVG(total_amount) as INT) AS aov
FROM transactions_detailed
GROUP BY 1
ORDER BY 1 DESC, 2
)
-- Self Joining to calculate the difference in AOV
SELECT 
    ABS(t1.aov - t2.aov) AS aov_difference
FROM 
    device_aov t1
JOIN 
    device_aov t2
ON 
    t1.purchase_device = 'desktop' 
    AND t2.purchase_device = 'mobile';

-- Featured Products

## Average AOV by Featured Products in 2025 (latest year)
SELECT 
  CASE WHEN p.is_featured = 1 THEN 'featured product' ELSE 'product not featured' END product_status,
  CAST(AVG(total_amount) as INT) AS aov
FROM transactions_detailed t
LEFT JOIN products p
USING(product_id)
WHERE 
  strftime('%Y', transaction_date) = '2025'
GROUP BY 1;

## Average AOV by Featured Product and Purchase Device in 2025
SELECT 
  CASE WHEN p.is_featured = 1 THEN 'featured product' ELSE 'product not featured' END product_status,
  device AS platform_device,
  CAST(AVG(total_amount) as INT) AS aov
FROM transactions_detailed t
LEFT JOIN products p
USING(product_id)
WHERE 
  strftime('%Y', transaction_date) = '2025'
GROUP BY 1,2
ORDER BY 1,2;

-- Country

## Top AOV Countries
SELECT 
  customer_country as country,
  strftime('%Y', transaction_date) AS purchase_year,
  COUNT(DISTINCT id) as order_count
FROM transactions_detailed
GROUP BY 1
HAVING order_count > 1000;
ORDER BY 2 DESC;


