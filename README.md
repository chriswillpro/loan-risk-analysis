# Loan Risk & Delinquency Analysis

## Project Overview
This project demonstrates foundational data engineering and analytics skills by tracking member loan performance and evaluating repayment risks. Using a custom relational database, I engineered SQL pipelines to aggregate delinquency metrics and visualized the insights using Tableau to highlight portfolio risk trends.

## Technical Stack
* **Database:** SQLite
* **Query Language:** SQL (Joins, Aggregations)
* **Data Visualization:** Tableau
* **Data Source:** Custom dataset simulating member profiles, loan terms, and payment histories.

## Key Features & Queries
* **Relational Schema Design:** Structured a normalized database with `members`, `loans`, and `payments` tables.
* **Risk Aggregation Pipeline:** Engineered an SQL query to join member credit scores with loan status, calculating the `total_days_late` across all payments to identify high-risk accounts.

## Visual Insights (Tableau)
<img width="1047" height="240" alt="image" src="https://github.com/user-attachments/assets/c3c96afd-198f-4fd3-a611-762749b46153" />


## Repository Contents
* `loan_project.db`: The local SQLite database file.
* `loan_analysis.sql`: The SQL script containing table creation, data insertion, and the core analytical query.
* `loan_analysis_data.csv`: The exported raw dataset used for visualization.
