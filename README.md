# 📊 SQL Data Analysis: E-Commerce Sales Insights (DecodeLabs Project 3)

## 📌 Project Overview
This project serves as the core data extraction milestone for the **DecodeLabs Industrial Training Track**[cite: 1]. Moving beyond standard spreadsheet views, the primary focus is **Querying for Truth**—translating 1,200 raw, unorganized transaction records into structured, actionable business intelligence using pure PostgreSQL relational logic[cite: 1].

---

## 🛠️ Tools & Technologies Used
* **Database Engine:** PostgreSQL 18
* **GUI Tool:** pgAdmin 4
* **Language:** ANSI SQL
* **Data Processing & Conversion:** Microsoft Excel (XLSX to UTF-8 CSV conversion)

---

## ⚙️ Detailed Execution Workflow (What We Did & How We Did It)

### 1. Database Creation & Schema Definition
We set up a dedicated relational database named `decodelabs_project3` and defined a structured `orders` table matching the raw data attributes:
* **Primary Key Assignment:** `OrderID` was defined as the `PRIMARY KEY` to enforce row uniqueness and prevent duplicate transaction entries.
* **Optimized Data Types:** Applied exact data types including `TIMESTAMP` for transaction dates, `VARCHAR` for categorical attributes, `INT` for discrete quantities, and `NUMERIC(10, 2)` for monetary values (`UnitPrice`, `TotalPrice`) to avoid floating-point rounding errors.

### 2. Data Conversion & Bulk Ingestion
* **Format Conversion:** Converted the source file (`Dataset for Data Analytics.xlsx`) into a UTF-8 `orders.csv` file, as PostgreSQL operates natively and more efficiently with flat CSV files.
* **Bulk Data Import:** Configured PostgreSQL's native importer via pgAdmin GUI / `COPY` command, ensuring header headers were mapped and text delimiters (`,`) were properly parsed to load all 1,200 records accurately.

### 3. Data Integrity & NULL Value Assessment
* Conducted an audit across all 14 columns. Found that **13 columns contained 0 nulls**, while `CouponCode` had 309 missing entries (25.75%).
* **Methodology:** Preserved all rows with missing coupon codes to maintain 100% financial and revenue accuracy, recognizing that missing coupon codes simply indicate organic purchases made without promo discounts.

### 4. Advanced Analytical Queries & Logical Execution
We wrote and executed queries covering the complete ANSI SQL query execution hierarchy:
* **Data Inspection (`SELECT`, `LIMIT`):** Inspected raw records to verify data types, schema alignment, and value formatting[cite: 1].
* **Row Filtering (`WHERE`):** Isolated specific datasets (e.g., delivered orders and high-value purchases exceeding $1,000) prior to aggregation[cite: 1].
* **Categorical Bucketing (`GROUP BY`):** Grouped transaction rows into discrete buckets by product category, payment channel, and fulfillment status[cite: 1].
* **Financial Aggregations (`COUNT`, `SUM`, `AVG`):** Computed overall portfolio volume, category revenue totals, and mean unit prices[cite: 1].
* **Group Level Filtering (`HAVING`):** Filtered aggregated groups to isolate top payment methods driving gross sales over $250,000[cite: 1].
* **Relative Category Contribution (Subqueries):** Embedded subqueries to evaluate each product category’s percentage share relative to overall gross company revenue[cite: 1].

---

## 📊 Key Business Insights & Analytical Findings

* **Gross Revenue Analyzed:** **$1,264,761.96** processed across 1,200 transactions[cite: 1].
* **Average Order Value (AOV):** **$1,053.97** per customer order[cite: 1].
* **Product Performance (Top Revenue Share):**
  * **Chairs:** $195,620.11 (15.47% share | 562 units sold)
  * **Printers:** $195,612.61 (15.47% share | 542 units sold)
  * **Laptops:** $192,126.56 (15.19% share | 535 units sold)
  * **Tablets:** $186,568.95 (14.75% share | 497 units sold)
* **Payment Channel Dominance (`HAVING > $250k`):**
  * **Credit Card:** 234 orders generating **$263,847.63**
  * **Online:** 258 orders generating **$262,442.94**
  * **Cash:** 246 orders generating **$259,786.29**

---

## 🔍 SQL Concepts Applied
* Data Definition Language (DDL): `CREATE DATABASE`, `CREATE TABLE`
* Data Manipulation Language (DML): `COPY`, `SELECT`, `LIMIT`[cite: 1]
* Row Filtering: `WHERE`[cite: 1]
* Grouping & Bucketing: `GROUP BY`[cite: 1]
* Mathematical Reduction: `COUNT()`, `SUM()`, `AVG()`, `ROUND()`[cite: 1]
* Group Filtering: `HAVING`[cite: 1]
* Sorting & Ranking: `ORDER BY DESC`[cite: 1]
* Advanced Analysis: Scalar Subqueries for Percentage Share Calculation[cite: 1]
