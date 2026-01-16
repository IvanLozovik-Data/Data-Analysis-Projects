
CREATE TABLE melbourne_housing (
    suburb TEXT,
    address TEXT,
    rooms INT,
    type TEXT,
    price NUMERIC,
    method TEXT,
    seller_g TEXT,
    date TEXT, -- Importing as text first to avoid date format errors
    distance NUMERIC,
    postcode TEXT,
    bedroom2 NUMERIC,
    bathroom NUMERIC,
    car NUMERIC,
    landsize NUMERIC,
    building_area NUMERIC,
    year_built NUMERIC,
    council_area TEXT,
    latitude NUMERIC,
    longitude NUMERIC,
    region_name TEXT,
    property_count NUMERIC
);

-- STEP 1: Create a temporary view (CTE) to clean the raw address data
-- We need to separate the house number from the street name to analyze street-level trends
WITH cleaned_data AS (
SELECT 
    address,
	price,
	-- Extract the first part before the space (House Number)
    SPLIT_PART(address, ' ', 1) as street_number,
	-- Extract everything after the first space (Street Name)
    SUBSTRING(address FROM STRPOS(address, ' ') + 1) as street_name
FROM melbourne_housing
WHERE price IS NOT NULL
)

-- STEP 2: Use Window Functions to compare houses on the same street
SELECT 
	address, 
	street_number, 
	price, 
	street_name,
	-- RANK() resets for every unique street_name (PARTITION BY)
    -- This identifies the most expensive house on every individual street
	RANK() OVER (PARTITION BY street_name ORDER BY price DESC)  AS street_rank
	
FROM cleaned_data
ORDER BY street_name, street_rank; -- Grouping the results so they are easy to read

-- Finding the Top 10 most expensive streets in Melbourne
-- We use a CTE first to get our clean street names
WITH street_data AS (
    SELECT 
        price,
        SUBSTRING(address FROM STRPOS(address, ' ') + 1) as street_name
    FROM melbourne_housing
    WHERE price IS NOT NULL
),
-- Now we aggregate the data to see the "Big Picture"
aggregated_streets AS (SELECT
    street_name,
    ROUND(AVG(price), 2) as avg_street_price,
    COUNT(*) as total_houses
FROM street_data
GROUP BY street_name
HAVING COUNT(*) >= 3 -- Only streets with enough data to be statistically significant
)
SELECT 
	street_name,
	ROUND(avg_street_price, 2) as formatted_price,
	total_houses,
	CASE 
		WHEN avg_street_price >= 2000000 THEN 'Ultra-Luxury'
		WHEN avg_street_price BETWEEN 120000 AND 2000000 THEN 'Premium'
		ELSE 'Mainstream'
	END AS market_segment
FROM aggregated_streets
ORDER BY avg_street_price DESC;




