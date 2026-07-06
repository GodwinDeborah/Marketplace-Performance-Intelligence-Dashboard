/*
Purpose:
Analyze menu performance by evaluating category and dish revenue
contribution, as well as identifying the highest-performing menu
segments based on order volume, revenue generation, and customer ratings.
*/


-- =====================================================
-- Menu Performance
-- =====================================================


-- Category Revenue Contribution
-- Shows each menu category's share of total marketplace revenue
WITH category_revenue AS (
	SELECT
		dc.category,
		SUM(f.price) AS revenue
	FROM fact_table_orders f
	JOIN dim_category dc
		ON f.category_id = dc.category_id
	GROUP BY dc.category
)
SELECT
	category,
	revenue,
	ROUND(
		revenue * 100.0 / SUM(revenue) OVER (),
		2
	) AS revenue_contribution_pct
FROM category_revenue
ORDER BY revenue DESC;



-- Dish Revenue Contribution
-- Shows each dish's share of total marketplace revenue
WITH dish_revenue AS (
	SELECT
		dd.dish_name,
		SUM(f.price) AS revenue
	FROM fact_table_orders f
	JOIN dim_dish dd
		ON f.dish_id = dd.dish_id
	GROUP BY dd.dish_name
)
SELECT
	dish_name,
	revenue,
	ROUND(
		revenue * 100.0 / SUM(revenue) OVER (),
		2
	) AS revenue_contribution_pct
FROM dish_revenue
ORDER BY revenue DESC;



-- Top Performing Menu Segments
-- Evaluates category performance using orders, revenue, and ratings
SELECT
	dc.category,
	COUNT(*) AS total_orders,
	SUM(f.price) AS total_revenue,
	ROUND(AVG(f.rating), 2) AS avg_rating
FROM fact_table_orders f
JOIN dim_category dc
	ON f.category_id = dc.category_id
GROUP BY dc.category
ORDER BY total_revenue DESC;
