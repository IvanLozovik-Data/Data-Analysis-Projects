# Netflix Content Strategy Analysis

## 📌 Project Overview
In this project, I performed a comprehensive analysis of the Netflix Titles dataset (8,800+ records). The goal was to decode Netflix's content distribution strategy, identify growth eras, and analyze regional production trends to understand how the platform competes globally.

## 📊 Key Business Insights
1. **The "Modern" Push:** 70%+ of the library was released after 2015, proving a heavy pivot toward original, fresh content.
2. **Global Powerhouses:** Identified the US, India, and the UK as the primary content engines, with emerging growth in South Korean titles.
3. **Movies vs. TV:** Quantified the split between formats to understand platform stickiness and viewer retention trends.

---

## 🛠️ Technical Skills Demonstrated
* **Relational Schema Design:** Creating structured tables to handle large-scale CSV imports.
* **CTEs (Common Table Expressions):** Using `WITH` clauses to break down complex logic into readable steps.
* **Data Binning:** Using `CASE WHEN` to transform release years into "Content Eras" (Classic vs. Modern).
* **String Manipulation:** Cleaning and filtering text data for regional analysis.

---

## 🔍 Visual Evidence & SQL Queries

### 1. Content Eras Distribution
I categorized the entire library into three eras. This query demonstrates the platform's aggressive focus on the "Modern" era (2015-2021).

`![Content Eras Analysis](netflix_eras_screenshot.png)`

### 2. Top Content Producers (by Country)
By aggregating titles by country, I identified the dominant markets. This shows the geographic diversity of the Netflix library.

`![Global Production](netflix_countries_screenshot.png)`

---

## 📂 Project Structure
* `netflix_titles.csv`: The raw source data.
* `netflix_queries.sql`: The full SQL script containing the analysis.
* `README.md`: Project summary and findings.
