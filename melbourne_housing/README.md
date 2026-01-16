# Melbourne Housing: Street-Level Value & Market Analysis

## 📊 Project Overview
This project transforms a raw dataset of over 13,000 Melbourne property sales into a structured market analysis tool. By cleaning messy address strings and applying advanced SQL window functions, this analysis identifies the highest-value properties on every street and categorizes neighborhoods into distinct investment tiers.

## 🛠️ Key SQL Skills Demonstrated
Data Normalization: Handled inconsistent address strings using SPLIT_PART, SUBSTRING, and STRPOS to extract house numbers and street names.

Window Functions: Utilized RANK() partitioned by street names to identify competitive rankings within local micro-markets.

Advanced Logic (CTEs): Structured complex logic using Common Table Expressions to maintain code readability and efficiency.

Business Intelligence: Implemented CASE statements to automate the categorization of streets into 'Ultra-Luxury', 'Premium', and 'Mainstream' segments based on average price performance.

## 🔍 Analysis Steps
Cleaning & Extraction: Split the address column to create a street_name attribute, which served as the primary key for all street-level comparisons.

Internal Competition: Ranked every house against its immediate neighbors to find the "King of the Street" (Rank #1).

Market Segmentation: Grouped data to find the average price per street (minimum 3 houses to ensure statistical significance) and labeled them by price tier.

## 📈 Sample Findings
Ultra-Luxury Streets: Identified streets with average sale prices exceeding $2,000,000.

Price Leaders: Isolated the most expensive assets in specific suburbs for high-end real estate reporting.

🚀### How to Use
Import the melbourne_housing dataset into a PostgreSQL/pgAdmin environment.

Run the provided .sql script.

The results will generate two reports: a micro-level house rank and a macro-level street category report.
