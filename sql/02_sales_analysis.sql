

USE sales_analysis;

-- 1. Dataset Overview
-- Investigating how many records are in the dataset
-- Investigating how many unique orders and customers exist
-- Investigating how many products and sales channels are represented
-- Investigating How many states are covered

SELECT
    COUNT(*) AS total_records,
    COUNT(DISTINCT order_number) AS unique_orders,
    COUNT(DISTINCT customer_name) AS unique_customers,
    COUNT(DISTINCT product_name) AS unique_products,
    COUNT(DISTINCT channel) AS sales_channels,
    COUNT(DISTINCT state) AS states_covered
FROM sales_data;

-- 2. Sales Performance by Channel

SELECT
    channel,
    COUNT(*) AS total_records,
    COUNT(DISTINCT order_number) AS unique_orders
FROM sales_data
GROUP BY channel
ORDER BY unique_orders DESC;

-- 3. Order Distribution by Year

SELECT
    order_year,
    COUNT(*) AS total_records,
    COUNT(DISTINCT order_number) AS unique_orders
FROM sales_data
GROUP BY order_year
ORDER BY order_year;

-- 4. Orders Appearing Across Multiple Years

SELECT
    COUNT(*) AS total_unique_orders,
    SUM(years_per_order > 1) AS orders_across_multiple_years,
    SUM(years_per_order = 1) AS orders_in_one_year
FROM (
    SELECT
        order_number,
        COUNT(DISTINCT order_year) AS years_per_order
    FROM sales_data
    GROUP BY order_number
) AS order_years;

-- 5. Monthly Record Distribution

SELECT
    order_month_name,
    order_month_num,
    COUNT(*) AS total_records,
    COUNT(DISTINCT order_number) AS unique_order_numbers
FROM sales_data
GROUP BY
    order_month_name,
    order_month_num
ORDER BY order_month_num;

-- 6. Monthly Record Distribution by Year

SELECT
    order_year,
    order_month_name,
    order_month_num,
    COUNT(*) AS total_records,
    COUNT(DISTINCT order_number) AS unique_order_numbers
FROM sales_data
GROUP BY
    order_year,
    order_month_name,
    order_month_num
ORDER BY
    order_year,
    order_month_num;
    
    -- 7. Average Records per Active Day

SELECT
    order_year,
    order_month_name,
    order_month_num,
    COUNT(*) AS total_records,
    COUNT(DISTINCT order_date) AS active_days,
    ROUND(
        COUNT(*) / COUNT(DISTINCT order_date), 2
    ) AS avg_records_per_active_day
FROM sales_data
GROUP BY
    order_year,
    order_month_name,
    order_month_num
ORDER BY
    order_year,
    order_month_num;




