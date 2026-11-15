### Sales Analysis Project

This project explores a sales dataset using Python, MySQL, and Power BI. The work follows an end-to-end analysis workflow: data preparation and exploration in Python, structured analysis in MySQL, and interactive reporting in Power BI.

The dataset contains 64,104 records covering January 2014 to February 2018.
Project Objectives
- Understand the structure and quality of the sales dataset.
- Explore sales activity across time, channels, products, customers, and locations.
- Investigate revenue, cost, profit, and profit margins.
- Identify patterns in product and customer profit contribution.
- Communicate the findings through a Power BI dashboard.
## Dataset Summary

Records	64,104
Distinct order numbers	10,684
Customers	175
Products	30
Sales channels	3
States represented	47
Date range	2014-01-01 to 2018-02-28


Tools Used
- Python — data cleaning, exploration, and validation
- Pandas — data manipulation and analysis
- MySQL — database storage and SQL investigations
- Power BI — planned dashboard and visual reporting
- Git and GitHub — version control and project documentation
Repository Structure
sales-analysis-project/
├── data/
│   ├── raw/
│   │   └── Sales_data(EDA Exported).csv
│   └── cleaned/
│       └── cleaned_sales_data.csv
├── notebooks/
│   └── 01_sales_data_exploration.ipynb
├── sql/
│   ├── 01_database_setup.sql
│   └── 02_sales_analysis.sql
├── powerbi/
├── reports/
│   └── sql_analysis_notes.md
└── README.md
Workflow and Progress
1. Python: Data Cleaning and Exploration
- Inspected the raw dataset and its columns.
- Checked missing values, duplicate records, data types, and numerical fields.
- Prepared the cleaned dataset for SQL analysis.
- Retained missing budget values as NULL rather than replacing them with zero or estimated values.
- Validated calculated financial fields.
2. MySQL: Database Setup and SQL Analysis
- Created the sales_analysis database and sales_data table.
- Imported the cleaned CSV file.
- Verified that 64,104 rows were imported, with zero skipped records and zero import warnings.
- Completed 30 SQL investigations covering:
  - Dataset overview and record distribution.
  - Channel, product, and customer performance.
  - Regional and state level distribution.
  - Monthly and yearly patterns.
  - Profit margins and financial relationships.
  - Product and customer profit contribution.
  - Product performance by sales channel.
Detailed findings are documented in [`reports/sql_analysis_notes.md`](reports/sql_analysis_notes.md), and the queries are available in [`sql/02_sales_analysis.sql`](sql/02_sales_analysis.sql).
3. Power BI: Dashboard Development


