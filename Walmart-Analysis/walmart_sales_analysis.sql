-- PROJECT: Walmart Retail Sales Analysis
-- GOAL: Identify factors (Holidays, Economics, Weather) that impact revenue

-- STEP 1: Top 5 Performing Stores
-- Shows overall business leaders
SELECT store, ROUND(SUM(weekly_sales), 2) AS total_sales
FROM walmart_sales
GROUP BY store
ORDER BY total_sales DESC
LIMIT 5;

-- STEP 2: Holiday Impact Analysis
-- Does the holiday flag correlate with higher sales?
SELECT 
    CASE WHEN holiday_flag = 0 THEN 'Non-Holiday' ELSE 'Holiday' END AS status,
    ROUND(AVG(weekly_sales), 2) AS avg_sales
FROM walmart_sales
GROUP BY holiday_flag;

-- STEP 3: Economic Factors (Unemployment)
-- Analyzing Store 1 performance when unemployment is high (>8%)
SELECT SUM(weekly_sales) AS total_high_unemployment_sales
FROM walmart_sales
WHERE store = 1 AND unemployment > 8;