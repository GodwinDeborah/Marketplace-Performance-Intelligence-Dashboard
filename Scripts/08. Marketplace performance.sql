/*
Purpose:
Generate marketplace-level performance KPIs that provide a high-level
view of business performance, including revenue generation, order volume,
and average customer spend per order.
*/

-- =====================================================
-- Marketplace Overview
-- =====================================================

-- Total Revenue
-- Measures overall revenue generated across all orders
SELECT
	SUM(price) AS total_revenue
FROM fact_table_orders;


-- Total Orders
-- Measures total transaction volume
SELECT
	COUNT(*) AS total_orders
FROM fact_table_orders;


-- Average Order Value (AOV)
-- Measures average customer spend per order
SELECT
	ROUND(AVG(price), 2) AS avg_order_value
FROM fact_table_orders;
