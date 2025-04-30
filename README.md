🧠 Customer & Product Analytics (SQL-Only Version)

This project focuses on using **SQL (MySQL)** to analyze customer behavior and product performance from a transactional sales dataset. It lays the groundwork for a future Power BI dashboard by preparing clean, segmented, and insightful data summaries.

---

## 📦 Dataset Overview

This project uses a structured retail dataset consisting of:

- `fact_sales`: Transaction-level sales data
- `products`: Product attributes and classifications
- `customers`: Demographic information

Each sale record links a customer to a product on a specific date with quantity and sales value.

---

## 🛠 Tools Used

- **MySQL** for querying and transformation
- **DBMS**: MySQL 8+
- **Git** for version control
- *(Power BI to be added in future work)*

---

## ✅ SQL Objectives

### 📍 Customer Analytics
- Calculate total orders, sales, and quantity per customer
- Derive customer age and lifespan (months between first and last order)
- Segment customers into:
  - `VIP` (high spenders with long tenure)
  - `Regular` (long tenure, lower spend)
  - `New` (short tenure)

### 📍 Product Analytics
- Aggregate product performance:
  - Total orders, revenue, quantity sold, unique customers
  - Lifespan in market (based on first and last sale)
- Segment products into:
  - `High-Performers` (revenue > 100K)
  - `Mid-Range`
  - `Low-Performers`

---

## 📂 Project Structure
