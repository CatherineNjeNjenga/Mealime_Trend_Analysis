---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- OneStop Electronics has been collecting data on a variety of key elements, including orders, order statuses, customer information, products, and geographic data. 
-- However, the data is currently unrefined and underutilized, presenting both challenges and opportunities for unlocking valuable insights.
-- In cleaning and analyzing OneStop's data, meaningful insights can be extracted from the dataset to support the company’s various teams—including finance, sales, product, and marketing. 

-- Data spans from 2019-2022

-- NOTE: All data is fictional
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Taking a look at the tables in our dataset

## Orders Table
SELECT *
FROM core.orders LIMIT 1000;

## Order Status Table
SELECT *
FROM core.order_status LIMIT 1000;

## Geo Lookup Table
SELECT *
FROM core.geo_lookup LIMIT 1000;

## Customers Table
SELECT *
FROM core.customers LIMIT 1000;

--------------------------
-- Sales Metrics & Trends
--------------------------

## Calculating company wide sales metrics (revenue, aov, and order counts)
SELECT
  CAST(SUM(usd_price) as INT) AS total_sales, ## converting to integer
  CAST(AVG(usd_price) as INT) AS aov, ## converting to integer
  COUNT(DISTINCT id) AS order_count
FROM core.orders;

## Calculating yearly sales metrics 
SELECT
  EXTRACT(year FROM purchase_ts) AS purchase_year, 
  CAST(SUM(usd_price) as INT) AS total_sales, 
  CAST(AVG(usd_price) as INT) AS aov, 
  COUNT(DISTINCT id) AS order_count
FROM core.orders
GROUP BY 1
ORDER BY 1 DESC;

## Calculating quarterly sales metrics 
SELECT
  EXTRACT(year FROM purchase_ts) AS purchase_year,
   EXTRACT(quarter FROM purchase_ts) AS purchase_quarter,
  CAST(SUM(usd_price) as INT) AS total_sales, 
  CAST(AVG(usd_price) as INT) AS aov, 
  COUNT(DISTINCT id) AS order_count
FROM core.orders
GROUP BY 1, 2
ORDER BY 1 DESC, 2 ASC;

## Calculating monthly sales metrics 
SELECT
  EXTRACT(year FROM purchase_ts) AS purchase_year, 
  EXTRACT(month FROM purchase_ts) AS purchase_month, 
  CAST(SUM(usd_price) as INT) AS total_sales, 
  CAST(AVG(usd_price) as INT) AS aov,
  COUNT(DISTINCT id) AS order_count
FROM core.orders
GROUP BY 1,2
ORDER BY 1 DESC,2 ASC;

----------------------------------------------
-- Further Analysis of Apple IPhone AOV Trend 
----------------------------------------------

## Apple IPhone performance metrics
SELECT
  DATE_TRUNC(purchase_ts, month) AS purchase_month, 
  -- CAST(SUM(usd_price) as INT) AS total_sales, 
  CAST(AVG(usd_price) as INT) AS aov
  -- COUNT(DISTINCT id) AS order_count
FROM core.orders
WHERE 
  LOWER(product_name) LIKE '%iphone%'  
GROUP BY 1
ORDER BY 1 DESC;

## Average yearly AOV for Apple IPhone
SELECT
  CAST(AVG(usd_price) as INT) AS aov
FROM core.orders
WHERE 
  LOWER(product_name) LIKE '%iphone%';

## Average monthly AOV for Apple IPhone
WITH monthly_aov AS
(
SELECT
  DATE_TRUNC(purchase_ts, month) AS purchase_month, 
  -- CAST(SUM(usd_price) as INT) AS total_sales, 
  CAST(AVG(usd_price) as INT) AS aov
  -- COUNT(DISTINCT id) AS order_count
FROM core.orders
WHERE 
  LOWER(product_name) LIKE '%iphone%'  
GROUP BY 1
ORDER BY 1 DESC
)
SELECT 
  AVG(aov) AS avg_monthly_aov
FROM monthly_aov;

## Show the top 3 products by AOV per year (Result: IPhone is 3rd highest in AOV per year as well)
WITH aov_per_year AS
(
SELECT 
  EXTRACT(year FROM purchase_ts) as purchase_year,
  product_name,
  CAST(AVG(usd_price) as INT) as aov
FROM core.orders
GROUP BY 1,2
ORDER BY 1,3 DESC
)
SELECT 
  *,
  ROW_NUMBER() OVER (PARTITION BY purchase_year ORDER BY aov DESC) as aov_rank
FROM aov_per_year
QUALIFY aov_rank < 4
ORDER BY purchase_year DESC, aov_rank ASC;

---------------------------------------------------------------------------------------------------
-- Customer Segmentation Analysis: Which customer segments have a history of high-value purchases?
---------------------------------------------------------------------------------------------------

-- Purchase Plaform

-- Average difference between purchase platforms 
-- On Average, orders purchased on the website are $257 more than orders purchased on mobile phones

## Aggregating AOV by Purchase Platform 
WITH platform_aov AS
(
SELECT 
  purchase_platform,
  AVG(usd_price) as aov
FROM core.orders
GROUP BY 1
ORDER BY 1 DESC, 2
)
## Self Joining to calculate the difference in AOV
SELECT 
    ABS(t1.aov - t2.aov) AS aov_difference
FROM 
    platform_aov t1
JOIN 
    platform_aov t2
ON 
    t1.purchase_platform = 'website' 
    AND t2.purchase_platform = 'mobile app';

-- Loyalty Program

## Average AOV by Loyalty Program in 2022 (latest year)
SELECT 
  CASE WHEN loyalty_program = 1 THEN 'loyalty members' ELSE 'non-loyalty members' END AS loyalty_status,
  AVG(usd_price) as aov
FROM core.orders
LEFT JOIN core.customers as cust
ON orders.customer_id = cust.id
WHERE 
  EXTRACT(year FROM orders.purchase_ts) = 2022
GROUP BY 1;

## Average AOV by Loyalty Program and Purchase Platform in 2022
SELECT 
  CASE WHEN loyalty_program = 1 THEN 'loyalty members' ELSE 'non-loyalty members' END AS loyalty_status,
  purchase_platform,
  AVG(usd_price) as aov
FROM core.orders
LEFT JOIN core.customers as cust
ON orders.customer_id = cust.id
WHERE
  EXTRACT(year FROM orders.purchase_ts) = 2022
GROUP BY 1,2
ORDER BY 1,2;

-- Country

## Top AOV Countries
SELECT 
  country_code as country,
  ROUND(AVG(usd_price),2) as aov,
  COUNT(DISTINCT orders.id) as order_count
FROM core.orders
LEFT JOIN core.customers
ON orders.customer_id = customers.id
GROUP BY 1
HAVING order_count > 1000
ORDER BY 2 DESC;


