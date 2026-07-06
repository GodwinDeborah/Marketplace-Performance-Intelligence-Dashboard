/*
Purpose:
Reload the staging table with raw Marketplace CSV data using SQL Server's
BULK INSERT functionality. Existing staging records are removed to
ensure a complete and consistent refresh of the source dataset.
*/

-- Clear existing staging data before loading a fresh file
TRUNCATE TABLE stg_marketplace_data;
GO

BULK INSERT stg_marketplace_data
FROM 'C:\Users\Marketplace.csv' --Add the actual file path
WITH
(
    FORMAT = 'CSV',
    FIRSTROW = 2,      -- Skip the header row
    FIELDQUOTE = '"',  -- Handle text values enclosed in double quotes
    CODEPAGE = '65001' -- UTF-8 encoding support
);
GO
