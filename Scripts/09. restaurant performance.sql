/*
Purpose:
Analyze restaurant-level performance by measuring order volume,
revenue contribution, customer ratings, and ranking restaurants
based on revenue performance.
*/


-- =====================================================
-- Restaurant Performance
-- =====================================================


-- Total Orders Per Restaurant
-- Measures transaction volume by restaurant
SELECT
	dr.restaurant_name,
	COUNT(*) AS total_orders
FROM fact_table_orders f
JOIN dim_restaurant dr
	ON f.restaurant_id = dr.restaurant_id
GROUP BY dr.restaurant_name
ORDER BY total_orders DESC;



-- Revenue Contribution Percentage
-- Shows each restaurant's share of total marketplace revenue
WITH restaurant_revenue AS (
	SELECT
		dr.restaurant_name,
		SUM(f.price) AS revenue
	FROM fact_table_orders f
	JOIN dim_restaurant dr
		ON f.restaurant_id = dr.restaurant_id
	GROUP BY dr.restaurant_name
)
SELECT
	restaurant_name,
	revenue,
	ROUND(
		revenue * 100.0 / SUM(revenue) OVER (), 2
	) AS revenue_contribution_pct
FROM restaurant_revenue
ORDER BY revenue DESC;



-- Average Restaurant Rating
-- Measures customer rating performance by restaurant
SELECT
	dr.restaurant_name,
	ROUND(AVG(f.rating), 2) AS avg_rating
FROM fact_table_orders f
JOIN dim_restaurant dr
	ON f.restaurant_id = dr.restaurant_id
GROUP BY dr.restaurant_name
ORDER BY avg_rating DESC;



-- Restaurant Performance Ranking
-- Ranks restaurants based on revenue generated
WITH restaurant_metrics AS (
	SELECT
		dr.restaurant_name,
		COUNT(*) AS total_orders,
		SUM(f.price) AS revenue,
		AVG(f.rating) AS avg_rating
	FROM fact_table_orders f
	JOIN dim_restaurant dr
		ON f.restaurant_id = dr.restaurant_id
	GROUP BY dr.restaurant_name
)
SELECT
	restaurant_name,
	total_orders,
	revenue,
	ROUND(avg_rating, 2) AS avg_rating,
	RANK() OVER(ORDER BY revenue DESC) AS revenue_rank
FROM restaurant_metrics
ORDER BY revenue_rank;
