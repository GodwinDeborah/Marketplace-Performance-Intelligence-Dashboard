/*
Purpose:
Analyze geographic performance by evaluating revenue generation,
revenue contribution, and customer satisfaction across cities.
*/


-- =====================================================
-- Geographic Performance
-- =====================================================


-- Revenue by City
-- Identifies the highest-revenue cities on the platform
SELECT
	dl.city,
	SUM(f.price) AS total_revenue
FROM fact_table_orders f
JOIN dim_location dl
	ON f.location_id = dl.location_id
GROUP BY dl.city
ORDER BY total_revenue DESC;



-- Geographic Revenue Share
-- Shows each city's contribution to total marketplace revenue
WITH city_revenue AS (
	SELECT
		dl.city,
		SUM(f.price) AS revenue
	FROM fact_table_orders f
	JOIN dim_location dl
		ON f.location_id = dl.location_id
	GROUP BY dl.city
)
SELECT
	city,
	revenue,
	ROUND(
		revenue * 100.0 / SUM(revenue) OVER (),
		2
	) AS revenue_share_pct
FROM city_revenue
ORDER BY revenue DESC;



-- Average Rating by City
-- Measures customer satisfaction across locations
SELECT
	dl.city,
	ROUND(AVG(f.rating), 2) AS avg_rating
FROM fact_table_orders f
JOIN dim_location dl
	ON f.location_id = dl.location_id
GROUP BY dl.city
ORDER BY avg_rating DESC;
