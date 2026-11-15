

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
    
    create database if not exists sales_analysis;
use sales_analysis;
    
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
    
    WITH order_level AS (
    SELECT
        order_number,
        channel,
        MAX(revenue) AS revenue,
        MAX(total_cost) AS total_cost,
        MAX(profit) AS profit
    FROM sales_data
    GROUP BY
        order_number,
        channel
)

SELECT
    channel,
    COUNT(*) AS unique_order_numbers,
    ROUND(SUM(revenue), 2) AS total_revenue,
    ROUND(SUM(total_cost), 2) AS total_cost,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(
        SUM(profit) / NULLIF(SUM(revenue), 0) * 100,
        2
    ) AS profit_margin_pct
FROM order_level
GROUP BY channel
ORDER BY total_revenue DESC;

WITH product_level AS (
    SELECT
        order_number,
        product_name,
        MAX(revenue) AS revenue,
        MAX(total_cost) AS total_cost,
        MAX(profit) AS profit
    FROM sales_data
    GROUP BY
        order_number,
        product_name
)

SELECT
    product_name,
    COUNT(*) AS unique_order_numbers,
    ROUND(SUM(revenue), 2) AS total_revenue,
    ROUND(SUM(total_cost), 2) AS total_cost,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(
        SUM(profit) / NULLIF(SUM(revenue), 0) * 100,
        2
    ) AS profit_margin_pct
FROM product_level
GROUP BY product_name
ORDER BY total_revenue DESC;

WITH customer_level AS (
    SELECT
        order_number,
        customer_name,
        MAX(revenue) AS revenue,
        MAX(total_cost) AS total_cost,
        MAX(profit) AS profit
    FROM sales_data
    GROUP BY
        order_number,
        customer_name
)

SELECT
    customer_name,
    COUNT(*) AS unique_order_numbers,
    ROUND(SUM(revenue), 2) AS total_revenue,
    ROUND(SUM(total_cost), 2) AS total_cost,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(
        SUM(profit) / NULLIF(SUM(revenue), 0) * 100,
        2
    ) AS profit_margin_pct
FROM customer_level
GROUP BY customer_name
ORDER BY total_revenue DESC;

SELECT
    us_region,
    COUNT(*) AS total_records,
    COUNT(DISTINCT order_number) AS unique_order_numbers,
    COUNT(DISTINCT state) AS states_covered,
    COUNT(DISTINCT order_date) AS active_days
FROM sales_data
GROUP BY us_region
ORDER BY total_records DESC;

SELECT
    state_name,
    us_region,
    COUNT(*) AS total_records,
    COUNT(DISTINCT order_number) AS unique_order_numbers
FROM sales_data
GROUP BY state_name, us_region
ORDER BY total_records DESC;

SELECT
    state_name,
    us_region,
    COUNT(*) AS total_records,
    ROUND(AVG(profit_margin_pct), 2) AS average_profit_margin_pct
FROM sales_data
GROUP BY state_name, us_region
ORDER BY average_profit_margin_pct DESC;

SELECT
    us_region,
    COUNT(*) AS total_records,
    COUNT(DISTINCT state) AS states_covered,
    ROUND(AVG(profit_margin_pct), 2) AS average_profit_margin_pct
FROM sales_data
GROUP BY us_region
ORDER BY average_profit_margin_pct DESC;

SELECT
    order_year,
    channel,
    COUNT(*) AS total_records,
    COUNT(DISTINCT order_number) AS unique_order_numbers
FROM sales_data
GROUP BY order_year, channel
ORDER BY order_year, total_records DESC;

SELECT
    order_year,
    COUNT(*) AS total_records,
    ROUND(AVG(profit_margin_pct), 2) AS average_profit_margin_pct,
    ROUND(MIN(profit_margin_pct), 2) AS minimum_profit_margin_pct,
    ROUND(MAX(profit_margin_pct), 2) AS maximum_profit_margin_pct
FROM sales_data
GROUP BY order_year
ORDER BY order_year;

SELECT
    order_month_num,
    order_month_name,
    COUNT(*) AS total_records,
    ROUND(AVG(profit_margin_pct), 2) AS average_profit_margin_pct
FROM sales_data
GROUP BY order_month_num, order_month_name
ORDER BY order_month_num;

WITH order_level AS (
    SELECT
        order_number,
        MIN(order_date) AS first_recorded_date,
        MAX(revenue) AS revenue,
        MAX(profit) AS profit
    FROM sales_data
    GROUP BY order_number
)
SELECT
    MONTH(first_recorded_date) AS month_num,
    MONTHNAME(first_recorded_date) AS month_name,
    COUNT(*) AS unique_order_numbers,
    ROUND(SUM(revenue), 2) AS total_revenue,
    ROUND(SUM(profit), 2) AS total_profit
FROM order_level
GROUP BY
    MONTH(first_recorded_date),
    MONTHNAME(first_recorded_date)
ORDER BY month_num;

WITH order_level AS (
    SELECT
        order_number,
        MAX(revenue) AS revenue,
        MAX(profit) AS profit
    FROM sales_data
    GROUP BY order_number
)
SELECT
    COUNT(*) AS unique_order_numbers,
    ROUND(AVG(revenue), 2) AS average_revenue,
    ROUND(AVG(profit), 2) AS average_profit,
    ROUND(
        (SUM((revenue - avg_revenue) * (profit - avg_profit))) /
        SQRT(
            SUM(POW(revenue - avg_revenue, 2)) *
            SUM(POW(profit - avg_profit, 2))
        ),
        4
    ) AS revenue_profit_correlation
FROM (
    SELECT
        revenue,
        profit,
        AVG(revenue) OVER () AS avg_revenue,
        AVG(profit) OVER () AS avg_profit
    FROM order_level
) AS correlation_data;

WITH order_level AS (
    SELECT
        order_number,
        MAX(total_cost) AS total_cost,
        MAX(profit) AS profit
    FROM sales_data
    GROUP BY order_number
)
SELECT
    COUNT(*) AS unique_order_numbers,
    ROUND(AVG(total_cost), 2) AS average_cost,
    ROUND(AVG(profit), 2) AS average_profit,
    ROUND(
        SUM((total_cost - avg_cost) * (profit - avg_profit)) /
        SQRT(
            SUM(POW(total_cost - avg_cost, 2)) *
            SUM(POW(profit - avg_profit, 2))
        ),
        4
    ) AS cost_profit_correlation
FROM (
    SELECT
        total_cost,
        profit,
        AVG(total_cost) OVER () AS avg_cost,
        AVG(profit) OVER () AS avg_profit
    FROM order_level
) AS correlation_data;

WITH order_level AS (
    SELECT
        order_number,
        channel,
        MAX(revenue) AS revenue,
        MAX(profit) AS profit
    FROM sales_data
    GROUP BY order_number, channel
)
SELECT
    channel,
    COUNT(*) AS unique_order_numbers,
    ROUND(SUM(revenue), 2) AS total_revenue,
    ROUND(AVG(revenue), 2) AS average_revenue_per_order,
    ROUND(AVG(profit), 2) AS average_profit_per_order
FROM order_level
GROUP BY channel
ORDER BY average_revenue_per_order DESC;

WITH order_level AS (
    SELECT
        order_number,
        channel,
        MAX(revenue) AS revenue,
        MAX(profit) AS profit
    FROM sales_data
    GROUP BY order_number, channel
)
SELECT
    channel,
    COUNT(*) AS unique_order_numbers,
    ROUND(SUM(revenue), 2) AS total_revenue,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(
        SUM(profit) / NULLIF(SUM(revenue), 0) * 100,
        2
    ) AS profit_margin_pct
FROM order_level
GROUP BY channel
ORDER BY profit_margin_pct DESC;

WITH product_level AS (
    SELECT
        order_number,
        product_name,
        MAX(revenue) AS revenue,
        MAX(profit) AS profit
    FROM sales_data
    GROUP BY order_number, product_name
)
SELECT
    product_name,
    COUNT(*) AS unique_order_numbers,
    ROUND(SUM(revenue), 2) AS total_revenue,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(AVG(profit), 2) AS average_profit_per_order
FROM product_level
GROUP BY product_name
ORDER BY average_profit_per_order DESC;


WITH product_level AS (
    SELECT
        order_number,
        product_name,
        MAX(revenue) AS revenue,
        MAX(profit) AS profit
    FROM sales_data
    GROUP BY order_number, product_name
)
SELECT
    product_name,
    COUNT(*) AS unique_order_numbers,
    ROUND(SUM(revenue), 2) AS total_revenue,
    ROUND(AVG(revenue), 2) AS average_revenue_per_order,
    ROUND(AVG(profit), 2) AS average_profit_per_order
FROM product_level
GROUP BY product_name
ORDER BY average_revenue_per_order DESC;

WITH product_level AS (
    SELECT
        order_number,
        product_name,
        MAX(revenue) AS revenue,
        MAX(profit) AS profit
    FROM sales_data
    GROUP BY order_number, product_name
)
SELECT
    product_name,
    COUNT(*) AS unique_order_numbers,
    ROUND(SUM(revenue), 2) AS total_revenue,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(
        SUM(profit) / NULLIF(SUM(revenue), 0) * 100,
        2
    ) AS profit_margin_pct
FROM product_level
GROUP BY product_name
ORDER BY profit_margin_pct DESC;

WITH product_level AS (
    SELECT
        order_number,
        product_name,
        MAX(revenue) AS revenue,
        MAX(profit) AS profit
    FROM sales_data
    GROUP BY order_number, product_name
),
product_profit AS (
    SELECT
        product_name,
        COUNT(*) AS unique_order_numbers,
        SUM(revenue) AS total_revenue,
        SUM(profit) AS total_profit
    FROM product_level
    GROUP BY product_name
)
SELECT
    product_name,
    unique_order_numbers,
    ROUND(total_revenue, 2) AS total_revenue,
    ROUND(total_profit, 2) AS total_profit,
    ROUND(
        total_profit / SUM(total_profit) OVER () * 100,
        2
    ) AS profit_contribution_pct
FROM product_profit
ORDER BY profit_contribution_pct DESC;

WITH product_level AS (
    SELECT
        order_number,
        product_name,
        MAX(profit) AS profit
    FROM sales_data
    GROUP BY order_number, product_name
),
product_profit AS (
    SELECT
        product_name,
        SUM(profit) AS total_profit
    FROM product_level
    GROUP BY product_name
),
profit_contribution AS (
    SELECT
        product_name,
        total_profit,
        SUM(total_profit) OVER () AS overall_profit,
        SUM(total_profit) OVER (
            ORDER BY total_profit DESC
            ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
        ) AS cumulative_profit
    FROM product_profit
)
SELECT
    product_name,
    ROUND(total_profit, 2) AS total_profit,
    ROUND(total_profit / overall_profit * 100, 2) AS profit_contribution_pct,
    ROUND(cumulative_profit / overall_profit * 100, 2) AS cumulative_profit_pct
FROM profit_contribution
ORDER BY total_profit DESC;


WITH customer_level AS (
    SELECT
        order_number,
        customer_name,
        MAX(revenue) AS revenue,
        MAX(profit) AS profit
    FROM sales_data
    GROUP BY order_number, customer_name
),
customer_profit AS (
    SELECT
        customer_name,
        COUNT(*) AS unique_order_numbers,
        SUM(revenue) AS total_revenue,
        SUM(profit) AS total_profit
    FROM customer_level
    GROUP BY customer_name
)
SELECT
    customer_name,
    unique_order_numbers,
    ROUND(total_revenue, 2) AS total_revenue,
    ROUND(total_profit, 2) AS total_profit,
    ROUND(
        total_profit / SUM(total_profit) OVER () * 100,
        2
    ) AS profit_contribution_pct
FROM customer_profit
ORDER BY total_profit DESC;

WITH customer_level AS (
    SELECT
        order_number,
        customer_name,
        MAX(profit) AS profit
    FROM sales_data
    GROUP BY order_number, customer_name
),
customer_profit AS (
    SELECT
        customer_name,
        SUM(profit) AS total_profit
    FROM customer_level
    GROUP BY customer_name
),
profit_contribution AS (
    SELECT
        customer_name,
        total_profit,
        SUM(total_profit) OVER () AS overall_profit,
        SUM(total_profit) OVER (
            ORDER BY total_profit DESC
            ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
        ) AS cumulative_profit
    FROM customer_profit
)
SELECT
    customer_name,
    ROUND(total_profit, 2) AS total_profit,
    ROUND(
        total_profit / overall_profit * 100,
        2
    ) AS profit_contribution_pct,
    ROUND(
        cumulative_profit / overall_profit * 100,
        2
    ) AS cumulative_profit_pct
FROM profit_contribution
ORDER BY total_profit DESC;

WITH product_channel_level AS (
    SELECT
        order_number,
        channel,
        product_name,
        MAX(revenue) AS revenue,
        MAX(total_cost) AS total_cost,
        MAX(profit) AS profit
    FROM sales_data
    GROUP BY
        order_number,
        channel,
        product_name
)
SELECT
    channel,
    product_name,
    COUNT(*) AS unique_order_numbers,
    ROUND(SUM(revenue), 2) AS total_revenue,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(
        SUM(profit) / NULLIF(SUM(revenue), 0) * 100,
        2
    ) AS profit_margin_pct
FROM product_channel_level
GROUP BY channel, product_name
ORDER BY channel, total_profit DESC;