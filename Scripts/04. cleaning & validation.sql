/*
Purpose:
Perform data quality validation checks on the cleansed marketplace dataset,
identify potential data issues, and remove duplicate records while
retaining a single instance of each unique row.
*/

-- =====================================================
-- 1. Check for NULL values across key columns
-- =====================================================
SELECT
	SUM(CASE WHEN state IS NULL THEN 1 ELSE 0 END) AS null_state,
	SUM(CASE WHEN city IS NULL THEN 1 ELSE 0 END) AS null_city,
	SUM(CASE WHEN order_date IS NULL THEN 1 ELSE 0 END) AS null_order_date,
	SUM(CASE WHEN restaurant_name IS NULL THEN 1 ELSE 0 END) AS null_restaurant_name,
	SUM(CASE WHEN location IS NULL THEN 1 ELSE 0 END) AS null_location,
	SUM(CASE WHEN category IS NULL THEN 1 ELSE 0 END) AS null_category,
	SUM(CASE WHEN dish_name IS NULL THEN 1 ELSE 0 END) AS null_dish_name,
	SUM(CASE WHEN price IS NULL THEN 1 ELSE 0 END) AS null_price,
	SUM(CASE WHEN rating IS NULL THEN 1 ELSE 0 END) AS null_rating,
	SUM(CASE WHEN rating_count IS NULL THEN 1 ELSE 0 END) AS null_rating_count
FROM marketplace_data;


-- =====================================================
-- 2. Check for blank or whitespace-only text values
-- =====================================================
SELECT *
FROM marketplace_data
WHERE TRIM(state) = ''
   OR TRIM(city) = ''
   OR TRIM(restaurant_name) = ''
   OR TRIM(location) = ''
   OR TRIM(category) = ''
   OR TRIM(dish_name) = '';


-- =====================================================
-- 3. Validate rating values
-- Expected range: 0 to 5
-- =====================================================
SELECT *
FROM marketplace_data
WHERE rating < 0
   OR rating > 5;


-- =====================================================
-- 4. Validate price values
-- Prices should be greater than zero
-- =====================================================
SELECT *
FROM marketplace_data
WHERE price <= 0;


-- =====================================================
-- 5. Validate rating count values
-- Rating counts cannot be negative
-- =====================================================
SELECT *
FROM marketplace_data
WHERE rating_count < 0;


-- =====================================================
-- 6. Detect duplicate records
-- =====================================================
SELECT
	state,
	city,
	order_date,
	restaurant_name,
	location,
	category,
	dish_name,
	price,
	rating,
	rating_count,
	COUNT(*) AS duplicate_count
FROM marketplace_data
GROUP BY
	state,
	city,
	order_date,
	restaurant_name,
	location,
	category,
	dish_name,
	price,
	rating,
	rating_count
HAVING COUNT(*) > 1;


-- =====================================================
-- 7. Remove duplicate records
-- Retains one instance of each unique row
-- =====================================================
WITH duplicate_cte AS
(
	SELECT *,
		ROW_NUMBER() OVER
		(
			PARTITION BY
				state,
				city,
				order_date,
				restaurant_name,
				location,
				category,
				dish_name,
				price,
				rating,
				rating_count
			ORDER BY (SELECT NULL)
		) AS rn
	FROM marketplace_data
)
DELETE
FROM duplicate_cte
WHERE rn > 1;


-- =====================================================
-- 8. Verify duplicate removal
-- =====================================================
SELECT
	state,
	city,
	order_date,
	restaurant_name,
	location,
	category,
	dish_name,
	price,
	rating,
	rating_count,
	COUNT(*) AS duplicate_count
FROM marketplace_data
GROUP BY
	state,
	city,
	order_date,
	restaurant_name,
	location,
	category,
	dish_name,
	price,
	rating,
	rating_count
HAVING COUNT(*) > 1;
