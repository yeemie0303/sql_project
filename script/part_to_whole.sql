-- Which category contribute the most the total sales
WITH category_sales AS(
	SELECT 
		category,
		SUM(sales_amount) AS total_sales 
	FROM dim_fact_sales s 
	LEFT JOIN dim_products p ON s.product_key = p.product_key
	GROUP BY p.category
)
SELECT 
	category, 
	total_sales,
	SUM(total_sales) OVER() overall_sales,
	CONCAT(ROUND((CAST(total_sales AS FLOAT )/SUM(total_sales) OVER())*100, 2), '%') AS percentage 
FROM category_sales
ORDER BY total_sales DESC