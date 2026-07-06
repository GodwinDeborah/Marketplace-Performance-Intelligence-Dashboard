/*
Purpose:
Load cleansed data from the staging table into the marketplace_data table.
During the load process, leading and trailing spaces are removed and
text values are converted to their appropriate data types for analysis.
*/

INSERT INTO marketplace_data (
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
)
SELECT
	TRIM(state),
	TRIM(city),

	-- Convert text dates from the staging table to SQL Server DATE format
	TRY_CONVERT(DATE, order_date, 105),

	TRIM(restaurant_name),
	TRIM(location),
	TRIM(category),
	TRIM(dish_name),

	-- TRY_CONVERT prevents the load from failing if invalid values exist
	TRY_CONVERT(DECIMAL(10,2), price),
	TRY_CONVERT(DECIMAL(3,1), rating),
	TRY_CONVERT(INT, rating_count)

FROM stg_marketplace_data;
GO
