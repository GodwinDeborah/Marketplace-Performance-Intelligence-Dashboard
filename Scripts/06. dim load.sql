/*
Purpose:
This script populates dimension tables (dim_date, dim_location, dim_restaurant,
dim_category, dim_dish) from the raw marketplace_data table.
It extracts distinct values to eliminate redundancy and ensure each dimension
contains unique records for efficient star schema modeling.
*/

-- =========================
-- Populate Date Dimension
-- =========================
INSERT INTO dim_date
(full_date, year, month, month_name, quater, day, week)
SELECT DISTINCT
	order_date,
	YEAR(order_date),
	MONTH(order_date),
	DATENAME(MONTH, order_date),
	DATEPART(QUARTER, order_date),
	DAY(order_date),
	DATEPART(WEEK, order_date)
FROM marketplace_data 
WHERE order_date IS NOT NULL;  -- Prevent invalid date records


-- =========================
-- Populate Location Dimension
-- =========================
INSERT INTO dim_location (state, city, location)
SELECT DISTINCT 
	state,
	city,
	location
FROM marketplace_data;


-- =========================
-- Populate Restaurant Dimension
-- =========================
INSERT INTO dim_restaurant (restaurant_name)
SELECT DISTINCT 
	restaurant_name 
FROM marketplace_data;


-- =========================
-- Populate Category Dimension
-- =========================
INSERT INTO dim_category (category)
SELECT DISTINCT
	category
FROM marketplace_data;


-- =========================
-- Populate Dish Dimension
-- =========================
INSERT INTO dim_dish (dish_name)
SELECT DISTINCT
	dish_name
FROM marketplace_data;
