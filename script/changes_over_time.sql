-- analyze sales performance overtime
SELECT 
    DATE_FORMAT(order_date, '%Y-%m') AS order_month,
    SUM(sales_amount) AS total_sales,
    COUNT(DISTINCT customer_key) AS customer_count,
    SUM(quantity) AS total_quantity
FROM dim_fact_sales
WHERE order_date IS NOT NULL 
GROUP BY order_month
ORDER BY order_month;