CREATE SCHEMA gold;

CREATE VIEW gold.calendar
AS
SELECT * FROM
OPENROWSET(
    BULK 'https://dlalprojectcink1.dfs.core.windows.net/silver/calendar/',
    FORMAT = 'PARQUET'
) AS Quer1;

CREATE VIEW gold.customers
AS
SELECT * FROM
OPENROWSET(
    BULK 'https://dlalprojectcink1.dfs.core.windows.net/silver/customers/',
    FORMAT = 'PARQUET'
) AS Quer1;

CREATE VIEW gold.product_categories
AS
SELECT * FROM
OPENROWSET(
    BULK 'https://dlalprojectcink1.dfs.core.windows.net/silver/product_categories/',
    FORMAT = 'PARQUET'
) AS Quer1;

CREATE VIEW gold.product_subcategories
AS
SELECT * FROM
OPENROWSET(
    BULK 'https://dlalprojectcink1.dfs.core.windows.net/silver/product_subcategories/',
    FORMAT = 'PARQUET'
) AS Quer1;

CREATE VIEW gold.products
AS
SELECT * FROM
OPENROWSET(
    BULK 'https://dlalprojectcink1.dfs.core.windows.net/silver/products/',
    FORMAT = 'PARQUET'
) AS Quer1;

CREATE VIEW gold.returns
AS
SELECT * FROM
OPENROWSET(
    BULK 'https://dlalprojectcink1.dfs.core.windows.net/silver/returns/',
    FORMAT = 'PARQUET'
) AS Quer1;

CREATE VIEW gold.sales_2015
AS
SELECT * FROM
OPENROWSET(
    BULK 'https://dlalprojectcink1.dfs.core.windows.net/silver/sales_2015/',
    FORMAT = 'PARQUET'
) AS Quer1;

CREATE VIEW gold.sales_2016
AS
SELECT * FROM
OPENROWSET(
    BULK 'https://dlalprojectcink1.dfs.core.windows.net/silver/sales_2016/',
    FORMAT = 'PARQUET'
) AS Quer1;

CREATE VIEW gold.sales_2017
AS
SELECT * FROM
OPENROWSET(
    BULK 'https://dlalprojectcink1.dfs.core.windows.net/silver/sales_2017/',
    FORMAT = 'PARQUET'
) AS Quer1;

CREATE VIEW gold.territories
AS
SELECT * FROM
OPENROWSET(
    BULK 'https://dlalprojectcink1.dfs.core.windows.net/silver/territories/',
    FORMAT = 'PARQUET'
) AS Quer1;

