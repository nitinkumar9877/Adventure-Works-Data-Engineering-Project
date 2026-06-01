CREATE MASTER KEY ENCRYPTION BY PASSWORD ='Nitin@2710Azure!'

CREATE DATABASE SCOPED CREDENTIAL cred_saini
WITH
    IDENTITY = 'Managed Identity'



CREATE EXTERNAL DATA SOURCE source_silver 
WITH(
    Location = 'https://dlalprojectcink1.dfs.core.windows.net/silver',
    CREDENTIAL = cred_saini
)


CREATE EXTERNAL DATA SOURCE source_gold 
WITH(
    Location = 'https://dlalprojectcink1.dfs.core.windows.net/gold',
    CREDENTIAL = cred_saini
)


CREATE EXTERNAL FILE FORMAT format_parquet
WITH(
    FORMAT_TYPE = PARQUET,
    DATA_COMPRESSION = 'org.apache.hadoop.io.compress.SnappyCodec'
)



-- COPY DATA SALES
CREATE EXTERNAL TABLE gold.extsales
WITH(
    LOCATION = 'extsales',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
) AS 
SELECT * FROM gold.sales_2015;

-- Calendar
CREATE EXTERNAL TABLE gold.extcalendar
WITH(
    LOCATION = 'extcalendar',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
) AS 
SELECT * FROM gold.calendar;

-- customers
CREATE EXTERNAL TABLE gold.extcustomers
WITH(
    LOCATION = 'extcustomers',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
) AS 
SELECT * FROM gold.customers;

-- product_categories
CREATE EXTERNAL TABLE gold.extproduct_categories
WITH(
    LOCATION = 'extproduct_categories',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
) AS 
SELECT * FROM gold.product_categories;

-- product_subcategories
CREATE EXTERNAL TABLE gold.extproduct_subcategories
WITH(
    LOCATION = 'extproduct_subcategories',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
) AS 
SELECT * FROM gold.product_subcategories;

-- products
CREATE EXTERNAL TABLE gold.extproducts
WITH(
    LOCATION = 'extproducts',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
) AS 
SELECT * FROM gold.products;

-- returns
CREATE EXTERNAL TABLE gold.extreturns
WITH(
    LOCATION = 'extreturns',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
) AS 
SELECT * FROM gold.returns;

-- territories
CREATE EXTERNAL TABLE gold.extterritories
WITH(
    LOCATION = 'extterritories',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
) AS 
SELECT * FROM gold.territories;