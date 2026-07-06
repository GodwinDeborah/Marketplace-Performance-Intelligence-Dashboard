/*
Purpose:
Evaluate overall marketplace health by measuring revenue concentration,
menu diversity, and customer satisfaction patterns across the platform.
*/


-- =====================================================
-- Marketplace Health
-- =====================================================


-- Top 10 Restaurant Revenue Share
-- Measures revenue concentration among the highest-performing restaurants
WITH restaurant_revenue AS (
	SELECT
		dr.restaurant_name,
		SUM(f.price) AS revenue
	FROM fact_table_orders f
	JOIN dim_restaurant dr
		ON f.restaurant_id = dr.restaurant_id
	GROUP BY dr.restaurant_name
),
ranked_restaurants AS (
	SELECT
		restaurant_name,
		revenue,
		ROW_NUMBER() OVER (ORDER BY revenue DESC) AS rn
	FROM restaurant_revenue
)
SELECT
	ROUND(
		SUM(CASE WHEN rn <= 10 THEN revenue END)
		* 100.0 / SUM(revenue),
		2
	) AS top_10_restaurant_revenue_share_pct
FROM ranked_restaurants;



-- Category Diversity Index
-- Measures the breadth of menu categories available on the platform
SELECT
	COUNT(*) AS category_diversity_index
FROM dim_category;



-- Customer Satisfaction Rating Distribution
-- Analyzes the distribution of ratings across all orders
SELECT
	rating,
	COUNT(*) AS rating_count
FROM fact_table_orders
GROUP BY rating
ORDER BY rating DESC;
