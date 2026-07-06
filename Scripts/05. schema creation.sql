/*
Purpose:
This script creates a dimensional data model (star schema) for the marketplace dataset.
It defines dimension tables (date, location, restaurant, category, dish) and a central
fact table (fact_table_orders) to support efficient analytical querying and reporting.
*/

-- =========================
-- Dimension: Date
-- =========================
IF OBJECT_ID('dim_date', 'U') IS NOT NULL
    DROP TABLE dim_date;
GO

CREATE TABLE dim_date (
    date_id INT IDENTITY (1,1) PRIMARY KEY,
    full_date  DATE,
    year       INT,
    month      INT,
    month_name VARCHAR(20),
    quater     INT,  -- Note: Represents calendar quarter (1–4)
    day        INT,
    week       INT
);

-- =========================
-- Dimension: Location
-- =========================
IF OBJECT_ID('dim_location', 'U') IS NOT NULL
    DROP TABLE dim_location;
GO

CREATE TABLE dim_location (
    location_id INT IDENTITY (1,1) PRIMARY KEY,
    state    VARCHAR(100),
    city     VARCHAR(100),
    location VARCHAR(200)
);

-- =========================
-- Dimension: Restaurant
-- =========================
IF OBJECT_ID('dim_restaurant', 'U') IS NOT NULL
    DROP TABLE dim_restaurant;
GO

CREATE TABLE dim_restaurant (
    restaurant_id INT IDENTITY (1,1) PRIMARY KEY,
    restaurant_name VARCHAR(200)
);

-- =========================
-- Dimension: Category
-- =========================
IF OBJECT_ID('dim_category', 'U') IS NOT NULL
    DROP TABLE dim_category;
GO

CREATE TABLE dim_category (
    category_id INT IDENTITY (1,1) PRIMARY KEY,
    category VARCHAR(200)
);

-- =========================
-- Dimension: Dish
-- =========================
IF OBJECT_ID('dim_dish', 'U') IS NOT NULL
    DROP TABLE dim_dish;
GO

CREATE TABLE dim_dish (
    dish_id INT IDENTITY (1,1) PRIMARY KEY,
    dish_name VARCHAR(200)
);

-- =========================
-- Fact Table: Orders
-- =========================
IF OBJECT_ID('fact_table_orders', 'U') IS NOT NULL
    DROP TABLE fact_table_orders;
GO

CREATE TABLE fact_table_orders (
    order_id INT IDENTITY (1,1) PRIMARY KEY,
    date_id INT,
    price DECIMAL(10,2),
    rating DECIMAL(4,2),
    rating_count INT,
    location_id INT,
    restaurant_id INT,
    category_id INT,
    dish_id INT,

    -- Foreign keys enforce referential integrity across dimensions
    FOREIGN KEY (date_id) REFERENCES dim_date (date_id),
    FOREIGN KEY (location_id) REFERENCES dim_location (location_id),
    FOREIGN KEY (restaurant_id) REFERENCES dim_restaurant (restaurant_id),
    FOREIGN KEY (category_id) REFERENCES dim_category (category_id),
    FOREIGN KEY (dish_id) REFERENCES dim_dish (dish_id)
);
