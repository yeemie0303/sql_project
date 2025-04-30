/* GROUP customers INTO 3 segments based ON their behavior:
1. VIP: customers WITH AT least 12 months OF history AND spending MORE than 5000
2. REGULAR: customers WITH AT least 12 months OF history but spending less than 5000
3. NEW: customers WITH a lifespan less than 12 months
AND find the total number OF customers FOR EACH GROUP */
WITH customer_spending AS
(
	SELECT 
	    s.customer_key,
	    SUM(s.sales_amount) AS total_spending,
	    MIN(s.order_date) AS first_order,
	    MAX(s.order_date) AS last_order,
	    ROUND(DATEDIFF(MAX(s.order_date),MIN(s.order_date))/ 30, 0) AS lifespan_month
	FROM fact_sales s
	LEFT JOIN customers c ON s.customer_key = c.customer_key
	GROUP BY s.customer_key
)

SELECT 
	CASE WHEN lifespan_month >= 12 AND total_spending > 5000 THEN 'VIP'
		WHEN lifespan_month >= 12 AND total_spending <= 5000 THEN 'REGULAR'
		ELSE 'NEW'
	END customer_group,
	COUNT(customer_key) AS customer_count
FROM customer_spending
GROUP BY customer_group
ORDER BY customer_group ; 