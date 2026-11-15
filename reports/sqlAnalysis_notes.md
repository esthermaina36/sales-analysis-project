# SQL Analysis Notes

## 1. Project Overview

This project explores sales data using Python, MySQL, and Power BI.
The dataset contains 64,104 records covering January 2014 to February 2018.
Key dataset details:
- Total records: 64,104
- Unique order numbers: 10,684
- Unique customers: 175
- Unique products: 30
- Sales channels: 3
- States covered: 47

## 2. Important Considerations
- Each order number appears six times in the dataset.
- Most order numbers appear across multiple years.
- Financial values are repeated across the six records associated with an order number.
- Therefore, summing financial values directly across all records can multiply the totals.
- The business meaning of the repeated order numbers has not yet been established.
- Missing budget values have been retained rather than replaced with zero or estimated values.
These limitations must be considered when interpreting the results.

## 3. SQL Investigations and Findings

### Investigation 1: Dataset Overview
Findings:
- 64,104 total records.
- 10,684 distinct order numbers.
- 175 customers.
- 30 products.
- 3 sales channels.
- 47 states represented.

### Investigation 2: Distribution by Sales Channel

Wholesale channel has 34,596 records and 5,766 distinct order numbers.
Distributor channel has 19,968 records and 3,328 distinct order numbers.
Export channel has 9,540 records and 1,590 distinct order numbers

**Observation:** Wholesale accounts for the largest share of records and distinct order numbers, followed by Distributor and Export.


### Investigation 3: Yearly Distribution

**Observation:** The first four years (2014-2017) have relatively similar record counts. 2018 has fewer records because the dataset only covers January and February.

Further investigation found that 10,678 of the 10,684 distinct order numbers appear in multiple years. This means order_number should not automatically be treated as a conventional unique transaction identifier.

### Investigation 4: Monthly Distribution

**Objective:** Compare the number of records across calendar months.

Findings:
- January had the highest combined record count: 6,498.
- April had the lowest combined record count: 4,971.

These figures combine all available years and represent records, not confirmed transactions.

### Investigation 5: Monthly Distribution by Year

**Objective:** Examine how monthly record counts vary across individual years.

Findings:
- Monthly record counts generally ranged between approximately 1,200 and 1,350.
- The highest-record month varied by year.
- February had the lowest monthly record count in each year.
- 2018 contains only January and February.

### Investigation 6: Monthly Distribution and Seasonality

The year-by-year comparison showed that the month with the highest record count was not consistent across years.

Examples:
- September 2014: 1,324 records.
- October 2015: 1,361 records.
- March 2016: 1,342 records.
- May 2017: 1,348 records.
- January 2018: 1,295 records.

**Observation:** There is no single month that consistently records the highest number of records.

### Investigation 7: Average Records per Active Day

**Objective:** Compare monthly activity while accounting for the different number of days in each month.

Findings:
- Most months averaged approximately 40–44 records per active day.
- September 2014 averaged 44.13 records per day.
- May 2017 averaged 43.48 records per day.
- January 2017 averaged 39.81 records per day.
- February's lower total record count was partly explained by its shorter calendar length.

**Conclusion:** February was not consistently the weakest month when average daily records were considered.

These averages represent records per calendar day containing at least one record, not confirmed daily transaction volumes.

## 4. Outstanding Investigations

The following areas remain to be explored:

1. Financial performance by sales channel.
2. Product performance.
3. Customer analysis.
4. Regional performance.
5. Revenue and profit trends over time.
6. Further financial comparisons and profitability analysis.

## 5. General Analytical Caution

All findings should be interpreted in light of the dataset's repeated order numbers and unresolved business grain.

Financial analyses should avoid double-counting repeated values. Where appropriate, one consistent financial value per order number can be selected for analysis, while preserving the original dataset.

### Investigation 8: Financial Performance by Sales Channel

**Objective:** Compare revenue, total cost, profit, and profit margin across the three sales channels.

**Key findings:**
- Wholesale generated the highest revenue and total profit.
- Export recorded the highest profit margin at 38.01%.
- Distributor recorded a profit margin of 37.65%.
- Profit margins were relatively close across all three channels.

**Conclusion:** Wholesale contributed the most total profit, while Export converted a slightly larger proportion of its revenue into profit.

### Investigation 9: Product Performance

**Objective:** Compare the financial performance of the 30 products using revenue, cost, profit, and profit margin.

**Key findings:**
- Product 26 generated the highest revenue ($19,548,636.90) and profit ($7,401,117.08).
- Product 25 had the highest number of distinct order numbers (999).
- Product 9 recorded the highest profit margin (40.03%).
- Product 12 recorded the lowest profit margin (34.44%).

**Conclusion:** Product 26 was the strongest contributor in terms of total revenue and profit. However, Product 9 had the highest profit margin, showing that the product generating the most profit is not necessarily the product with the highest profitability percentage.

 Financial values were aggregated using one repeated value per order number and product to avoid double-counting.

 ### Investigation 10: Customer Performance

**Objective:** Identify customers contributing the highest revenue and profit, and compare their profit margins.

**Key findings:**
- Aibox Company generated the highest revenue ($2,106,875.30).
- Aibox Company also generated the highest total profit ($824,426.16).
- Kare Corp had the highest number of distinct order numbers (90).
- Neutrogena Ltd recorded the highest profit margin (44.78%).
- Dynazzy Company recorded the lowest profit margin (30.01%).

**Conclusion:** Aibox Company was the leading customer by revenue and total profit. However, Neutrogena Ltd had the highest profit margin. Kare Corp had the most distinct order numbers, showing that customer activity, revenue contribution, and profitability are different measures.

 Financial values were aggregated using one repeated value per order number and customer to avoid double-counting.

 ### Investigation 11: Regional Distribution
- West recorded the highest number of rows (19,540), followed by South (17,333), Midwest (16,588), and Northeast (10,643).
- South covered the most states (16), while Northeast covered the fewest (8).
- West had the highest number of distinct order numbers appearing in the region (9,523).
- Each region was represented on almost every date in the dataset.
- Distinct order numbers overlap across regions because individual order numbers appear in multiple geographic locations.
- These results describe geographic record distribution, not regional revenue or profit performance. Financial attribution requires a better understanding of how order values should be allocated across locations.

### Investigation 12: State-Level Distribution
- California had the highest representation, with 12,000 records and 7,613 distinct order numbers.
- Illinois ranked second with 5,682 records.
- Florida led the South with 4,601 records, while New York led the Northeast with 2,829 records.
- Delaware had the fewest records, with 70.
- Geographic representation varied considerably across states, with California particularly prominent.
- Distinct order numbers overlap across states, so these counts should not be interpreted as unique transactions per state.
- The District of Columbia is classified under the South region in this dataset; this classification should be reviewed.

### Investigation 13: Average Profit Margin by State
- Montana recorded the highest average profit margin at 39.73%, based on 180 records.
- Maine recorded the lowest average profit margin at 34.85%, based on 73 records.
- Nebraska ranked second at 39.08%.
- California, despite having the highest record count (12,000), recorded an average margin of 37.23%.
- Illinois recorded an average margin of 37.49%.
- Most states had average profit margins between 37% and 38%.
- The difference between the highest and lowest state averages was 4.88 percentage points.
- States with relatively few records should be interpreted cautiously because their averages may be less representative.
- These figures represent average recorded margins by state, not total state level profit contribution.

### Investigation 14: Average Profit Margin by Region
- Midwest recorded the highest average profit margin at 37.52%.
- Northeast recorded the lowest average margin at 37.21%.
- West recorded 37.36%, while South recorded 37.30%.
- The difference between the highest and lowest regional averages was only 0.31 percentage points.
- West had the highest record count (19,540), while South covered the most states (16).
- Profit margins were relatively consistent across all four regions.
- These figures represent average recorded margins, not total regional profit contributions.

### Investigation 15: Channel Distribution by Year
- Wholesale had the highest number of records in every year from 2014 to 2018.
- Distributor consistently ranked second, while Export ranked third.
- Wholesale records gradually declined from 8,370 in 2014 to 8,253 in 2017.
- Export records increased from 2,243 in 2014 to 2,364 in 2016, then declined to 2,219 in 2017.
- The ranking of the three channels remained unchanged throughout the full years.
- 2018 contains only January and February records, so its figures should not be directly compared with full years.
- These results describe record distribution by channel, not revenue or profit performance.

### Investigation 16: Yearly Profit Margin Trends
- 2015 recorded the highest average profit margin at 37.53%.
- 2018 recorded the lowest average at 37.03%, but only January and February were available.
- Average margins remained relatively stable between 2014 and 2017, ranging from 37.27% to 37.53%.
- Every year recorded a minimum margin of 15% and a maximum of 60%.
- There was no clear sustained upward or downward trend in average recorded profit margins.
- These figures represent row-level averages, not annual profit margins calculated from total revenue and total profit.

### Investigation 17: Monthly Profit Margin Trends
- May recorded the highest average profit margin at 37.70%.
- August recorded the lowest average profit margin at 37.09%.
- The difference between the highest and lowest monthly averages was 0.61 percentage points.
- January had the highest record count (6,498), but its average margin was 37.34%.
- Monthly average margins were relatively stable throughout the year.
- These results combine all available years, including only January and February for 2018.
- The figures represent average recorded profit margins, not monthly total profit margins.

### Investigation 18: Monthly Revenue and Profit Performance
- January had the highest number of distinct order numbers (1,594), revenue ($30,390,818.10), and profit ($11,384,630.35).
- December had the lowest number of distinct order numbers (417), revenue ($7,784,736.70), and profit ($2,886,281.61).
- Revenue and profit generally declined from January to December.
- Revenue and profit followed a similar pattern across the months.
- To prevent repeated financial values from being counted multiple times, each order number was counted once using its maximum recorded revenue and profit.
- Each order number was assigned to the month of its earliest recorded date.
- These results describe financial values grouped by first recorded month, not confirmed monthly sales performance. The dataset's unusual order-number structure limits conclusions about actual sales seasonality.

### Investigation 19: Relationship Between Revenue and Profit
- The analysis included 10,684 distinct order numbers.
- Average revenue per distinct order number was $19,280.68.
- Average profit per distinct order number was $7,203.49.
- The revenue-profit correlation coefficient was 0.8722.
- This indicates a strong positive linear relationship between revenue and profit.
- Order numbers with higher revenue generally tend to have higher profit.
- Correlation does not establish causation, and profitability is also influenced by costs.
- Financial values were deduplicated using one record per order number.

### Investigation 20: Relationship Between Cost and Profit
- The analysis included 10,684 distinct order numbers.
- Average cost per distinct order number was $12,077.19.
- Average profit per distinct order number was $7,203.49.
- The cost-profit correlation coefficient was 0.6710.
- This indicates a moderately strong positive linear relationship between cost and profit.
- Order numbers with higher costs generally also tend to have higher profits.
- The relationship between revenue and profit (0.8722) was stronger than the relationship between cost and profit (0.6710).
- Higher costs do not necessarily reduce profit because larger orders may generate both higher costs and higher revenue.
- Correlation does not establish causation.

### Investigation 21: Average Revenue per Order Number by Sales Channel
- Distributor recorded the highest average revenue per distinct order number at $19,388.01.
- Wholesale generated the highest total revenue at $111,366,207.40.
- Distributor also had the highest average profit per distinct order number at $7,300.19.
- Export recorded the lowest average revenue at $18,934.16.
- Average revenue was relatively similar across all three channels.
- Wholesale's higher total revenue was supported by its larger number of represented order numbers.
- These figures are based on distinct order numbers grouped by channel and should not automatically be interpreted as independent customer transactions.

### Investigation 22: Profit Margin Comparison by Sales Channel
- Export recorded the highest profit margin at 38.01%.
- Distributor ranked second at 37.65%.
- Wholesale recorded the lowest margin at 37.02%.
- Wholesale generated the highest total revenue ($111,366,207.40) and total profit ($41,224,647.95).
- Export generated the lowest total revenue but retained the highest percentage of revenue as profit.
- The difference between Export and Wholesale profit margins was 0.99 percentage points.
- Profit margins were calculated using total profit divided by total revenue, producing revenue-weighted margins.
- These results suggest that the largest revenue channel is not necessarily the channel with the highest profitability rate.

### Investigation 23: Average Profit per Order Number by Product
- Product 18 recorded the highest average profit per distinct order number at $8,531.10.
- Product 28 ranked second at $8,140.43.
- Product 5 ranked third at $7,940.28.
- Product 26 generated the highest total profit ($7,401,117.08), but its average profit was $7,491.01.
- Product 25 had the highest number of distinct order numbers (999).
- Product 29 recorded the lowest average profit at $6,062.93.
- The results demonstrate that the product with the highest total profit is not necessarily the product with the highest average profit.
- Financial values were counted once per order number and product.
- These averages should not automatically be interpreted as profit per independent customer transaction.

### Investigation 24: Average Revenue per Order Number by Product
- Product 18 recorded the highest average revenue per distinct order number at $22,204.11.
- Product 12 ranked second at $22,015.65.
- Product 11 ranked third at $21,758.70.
- Product 18 also recorded the highest average profit per distinct order number at $8,531.10.
- Product 26 generated the highest total revenue ($19,548,636.90), but ranked tenth in average revenue.
- Product 29 recorded the lowest average revenue at $15,948.97.
- Product 18 led in both average revenue and average profit, while other products showed different rankings across the two measures.
- These figures are based on distinct order numbers grouped by product, not necessarily independent customer transactions.

### Investigation 25: Profit Margin by Product
- Product 9 recorded the highest revenue-weighted profit margin at 40.03%.
- Product 30 ranked second at 39.05%.
- Product 28 ranked third at 38.94%.
- Product 12 recorded the lowest margin at 34.44%.
- The difference between the highest and lowest product margins was 5.59 percentage points.
- Product 18 had a margin of 38.42%, despite leading average revenue and average profit per distinct order number.
- Product 26 generated the highest total revenue and total profit, with a margin of 37.86%.
- Product 25 had the highest number of distinct order numbers (999), with a margin of 38.01%.
- These findings show that total profit, average profit and profit margin measure different aspects of product performance.

### Investigation 26: Product Contribution to Total Profit
- Product 26 contributed the largest share of total product profit at 9.62%, equivalent to $7,401,117.08.
- Product 25 ranked second, contributing 9.01% ($6,935,408.45).
- Together, Products 26 and 25 contributed 18.63% of total product profit.
- Product 13 ranked third at 6.22%.
- Product 9 had the highest profit margin (40.03%) but contributed only 1.27% of total profit.
- Product 18 had the highest average profit per distinct order number but contributed 3.85% of total profit.
- These results demonstrate that profit margin, average profit and total profit contribution measure different aspects of product performance.

### Investigation 27: Cumulative Product Profit Contribution
- Product 26 was the largest contributor at 9.62%, followed by Product 25 at 9.01%.
- The top 8 products generated 51.06% of total product profit.
- The top 13 products generated 70.06%.
- The top 17 products generated 80.93%.
- The remaining 13 products contributed approximately 19.07%.
- Profit contribution is concentrated among a smaller group of products.
- The results illustrate a Pareto-style distribution, although the traditional 80/20 rule does not apply exactly.

### Investigation 28: Customer Contribution to Total Profit
- Aibox Company recorded the highest total profit at $824,426.16, contributing 1.07% of total customer profit.
- State Ltd ranked second with $813,101.15, contributing 1.06%.
- Organon Corp ranked third with $725,995.52, contributing 0.94%.
- The top five customers contributed approximately 4.86% of total customer profit.
- Realbuzz Ltd had the highest number of distinct order numbers among the top five customers (88).
- BB17 Company had the lowest profit contribution in the results at 0.35%.
- Customer profit contribution is distributed across many customers rather than concentrated in a small number of customers.

### Investigation 29: Cumulative Customer Profit Contribution
- Aibox Company was the largest customer profit contributor at 1.07%.
- The top 66 customers contributed 50.40% of total customer profit.
- The top 105 customers contributed 70.03%.
- The top 129 customers contributed approximately 80.00%.
- Customer profit is distributed relatively evenly across the 175 customers.
- Compared with product profitability, customer profitability is less concentrated.
- The findings suggest that the business relies more heavily on a smaller group of products for profit than on a small group of customers.

### Investigation 30: Product Profitability by Sales Channel
- Distributor: Product 25 generated the highest profit of $2,522,137.15, with a 38.89% profit margin.
- Export: Product 26 generated the highest profit of $1,130,957.25, with a 37.09% margin.
- Wholesale: Product 26 generated the highest profit of $4,309,166.51, with a 38.20% margin.
- Product 26 performed particularly strongly in Wholesale and Export.
- Product 25 was the leading product in Distributor.
- Product 29 in Export recorded the highest profit margin at 49.71%, despite generating only $212,438.44 in profit.
- The findings demonstrate that high profit margins and high total profit are different measures of product performance.
- Product-channel comparisons can help identify which products perform strongly in different distribution channels.