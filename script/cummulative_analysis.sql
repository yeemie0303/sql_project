-- calculate sales per month and the running total sales over time
SELECT
    order_year,
    total_sales,
    SUM(total_sales) OVER (ORDER BY order_year) AS running_total_sales,
    AVG(avg_price) OVER (ORDER BY order_year) AS moving_avg_price
FROM (
    SELECT
        YEAR(order_date) AS order_year,
        SUM(sales_amount) AS total_sales,
        AVG(price) AS avg_price
    FROM dim_fact_sales
    WHERE order_date IS NOT NULL
    GROUP BY order_year
) AS t
ORDER BY order_year;