# 🧠 SQL Retail Analytics Project

This project is a SQL-based retail analytics exploration using sales, customer, and product data to generate insights into customer behavior, product performance, and temporal sales trends. It simulates a data warehouse environment and includes a set of reusable SQL scripts and output views that support business intelligence reporting.

## 📁 Project Structure

```
sql_project/
│
├── data/                  # Raw input data in CSV format
│   ├── customers.csv
│   ├── fact_sales.csv
│   └── products.csv
│
├── script/                # SQL scripts used for transformation and analysis
│   ├── changes_over_time.sql
│   ├── cummulative_analysis.sql
│   ├── customer_report.sql
│   ├── data_segmentation.sql
│   ├── data_segmentation_2.sql
│   ├── part_to_whole.sql
│   ├── performance_analysis.sql
│   └── product_report.sql
│
├── view/                  # Output CSVs generated from queries
│   ├── report_customers.csv
│   └── report_products.csv
```

## ✅ Project Goals

- Load and query customer, sales, and product data.
- Perform descriptive analytics through reusable SQL scripts.
- Generate summary reports on:
  - 📊 Product performance (revenue, volume, lifespan)
  - 👥 Customer segmentation (VIPs, Regulars, New)
  - 📈 Sales trends over time

## 🔍 Example Insights

- Which product categories bring in the highest revenue?
- How do we classify customers by total spending and order history?
- What is the lifetime value and behavior of our loyal customers?

## 🛠 Technologies

- MySQL 8.x (with Docker)
- SQL for transformations, aggregations, and window functions
- Power BI (planned for visualization, not yet implemented)

## 🚀 Next Steps

- [ ] Develop Power BI dashboards using data from the `view/` directory
- [ ] Implement user behavior clustering or trend forecasting
- [ ] Enhance automation for ETL and data loading

## 📌 Getting Started

To run the SQL scripts, ensure:
1. MySQL server is running (you can use Docker).
2. Tables are loaded from the CSVs inside `data/`.
3. Each SQL file can be executed in MySQL Workbench or CLI.

## 📄 License

MIT License
