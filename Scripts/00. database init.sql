/*
Purpose:
Create a fresh Marketplace database environment for the project by removing any
existing Marketplace database, creating a new one, and setting up the initial
staging table used to load raw CSV data before transformation and modeling.
*/

USE master;
GO

-- Recreate the database to ensure a clean project environment
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'Marketplace')
BEGIN
    -- Force disconnect active sessions before dropping the database
    ALTER DATABASE Marketplace SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE Marketplace;
END;
GO

CREATE DATABASE Marketplace;
GO

USE Marketplace;
GO

-- Remove the staging table if it already exists
IF OBJECT_ID('stg_marketplace_data', 'U') IS NOT NULL 
	DROP TABLE stg_marketplace_data;
GO

-- Raw staging table used for initial CSV ingestion
-- All columns are stored as VARCHAR to prevent load failures
-- and allow validation/cleansing before data type conversion
CREATE TABLE stg_marketplace_data (
	state				VARCHAR(150),
	city				VARCHAR(150),
	order_date			VARCHAR(50),
	restaurant_name		VARCHAR(150),
	location			VARCHAR(150),
	category			VARCHAR(150),
	dish_name			VARCHAR(200),
	price				VARCHAR(50),
	rating				VARCHAR(50),
	rating_count		VARCHAR(50)
);
GO
