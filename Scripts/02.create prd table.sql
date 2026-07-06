/*
Purpose:
Create the cleansed Marketplace source table that stores validated and
properly typed data from the staging layer. This table serves as the
foundation for data transformation, dimensional modeling, and analysis.
*/

-- Remove the existing source table to allow a fresh rebuild
IF OBJECT_ID('marketplace_data', 'U') IS NOT NULL
	DROP TABLE marketplace_data;
GO

-- Stores cleaned and type-converted data loaded from the staging table
CREATE TABLE marketplace_data (
	state				VARCHAR(150),
	city				VARCHAR(150),
	order_date			DATE,
	restaurant_name		VARCHAR(150),
	location			VARCHAR(150),
	category			VARCHAR(150),
	dish_name			VARCHAR(200),
	price				DECIMAL(10,2),
	rating				DECIMAL(3,1),
	rating_count		INT
);
GO
