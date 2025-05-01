/* Product Report
Purpose:
- This report consolidates key product metrics and behaviors.
Highlights:
1. Gathers essential fields such as product name, category, subcategory, and cost.
2. Segments products by revenue to identify High-Performers, Mid-Range, or Low-Performers.
3. Aggregates product-level metrics:
- total orders
- total sales
- total quantity sold
- total customers (unique)
- lifespan (in months)
4. Calculates valuable KPIs:
- recency (months since last sale)
- average order revenue (AOR)
- average monthly revenue */
CREATE VIEW report_products AS

WITH basic_query AS (
    SELECT 
        s.product_key,
        s.customer_key,
        s.quantity,
        s.sales_amount,
        s.order_number,
        s.order_date,
        p.product_name,
        p.category,
        p.subcategory,
        p.cost
    FROM fact_sales s 
    LEFT JOIN products p ON p.product_key = s.product_key
    WHERE s.order_date IS NOT NULL
),
product_aggregation AS (
    SELECT 
	    product_key,
	    product_name,
	    category,
	    subcategory,
	    cost,
        MAX(order_date) AS last_order_date,
        COUNT(DISTINCT order_number) AS total_order,
        SUM(sales_amount) AS total_sales,
        SUM(quantity) AS total_quantity,
        COUNT(DISTINCT customer_key) AS total_customers,
        ROUND(DATEDIFF(MAX(order_date), MIN(order_date)) / 30, 0) AS lifespan
    FROM basic_query
    GROUP BY product_key, product_name, category, subcategory, cost
)

SELECT 
    product_key,
    product_name,
    category,
    subcategory,
    cost,
    total_sales,  
    lifespan,
    CASE 
        WHEN total_sales <= 50000 THEN 'Low-Performers'
        WHEN total_sales BETWEEN 50001 AND 100000 THEN 'Mid-Range'
        ELSE 'High-Performers' 
    END AS product_segment,
    TIMESTAMPDIFF(MONTH, last_order_date, CURDATE()) AS recency,
    CASE WHEN total_order = 0 THEN 0
    ELSE total_sales/ total_order END avg_order_rev,
    CASE WHEN total_order = 0 THEN 0
    ELSE total_sales / lifespan END avg_month_rev
FROM product_aggregation;
