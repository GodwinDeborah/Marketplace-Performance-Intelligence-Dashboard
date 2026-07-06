/*
Purpose:
This script populates the fact_table_orders table by transforming and loading
transactional data from marketplace_data. It maps raw data to corresponding dimension
tables and inserts structured records with surrogate keys and measurable metrics,
completing the star schema design.
*/

-- =========================
-- Populate Fact Table
-- =========================
INSERT INTO fact_table_orders (
	date_id,
	price,
	rating,
	rating_count,
	location_id,
	restaurant_id,
	category_id,
	dish_id
)
SELECT 
	dd.date_id,
	f.price,
	f.rating,
	f.rating_count,
	dl.location_id,
	dr.restaurant_id,
	dc.category_id,
	dsh.dish_id
FROM marketplace_data f

-- Map transaction date to date dimension
JOIN dim_date dd
	ON dd.full_date = f.order_date

-- Resolve location hierarchy to surrogate key
JOIN dim_location dl
	ON dl.state = f.state
	AND dl.city = f.city
	AND dl.location = f.location

-- Map restaurant to dimension
JOIN dim_restaurant dr
	ON dr.restaurant_name = f.restaurant_name

-- Map category to dimension
JOIN dim_category dc
	ON dc.category = f.category

-- Map dish to dimension
JOIN dim_dish dsh
	ON dsh.dish_name = f.dish_name;
