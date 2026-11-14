create database if not exists sales_analysis;
use sales_analysis;

CREATE TABLE IF NOT EXISTS sales_data (
    order_number VARCHAR(20),
    order_date DATE,
    customer_name VARCHAR(100),
    channel VARCHAR(30),
    product_name VARCHAR(30),
    quantity INT,
    unit_price DECIMAL(25,15),
    revenue DECIMAL(25,15),
    cost DECIMAL(25,15),
    state CHAR(2),
    state_name VARCHAR(50),
    us_region VARCHAR(20),
    lat DECIMAL(25,15),
    lon DECIMAL(25,15),
    budget DECIMAL(25,15),
    total_cost DECIMAL(25,15),
    profit DECIMAL(25,15),
    profit_margin_pct DECIMAL(25,15),
    order_month_name VARCHAR(15),
    order_month_num INT,
    order_month VARCHAR(7),
    order_year INT
);


-- Source file:
-- data/cleaned/cleaned_sales_data.csv

-- Imported using LOAD DATA LOCAL INFILE
-- Missing budget values were converted to NULL
-- using NULLIF(@budget, '').

-- Import results:
-- Total records imported: 64,104
-- Records skipped: 0
-- Warnings: 0

-- Total records and unique orders
SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT order_number) AS unique_orders
FROM sales_data;

-- Missing and available budget values
SELECT
    SUM(budget IS NULL) AS missing_budget,
    SUM(budget IS NOT NULL) AS available_budget
FROM sales_data;








