# 💊 U.S. Drug Overdose Insights Pipeline (2012–2024)

An end-to-end **data analytics pipeline** exploring accidental drug overdose trends across the United States from **2012 to 2024**.  
This project integrates **Python**, **Snowflake**, and **Tableau** to transform raw health data into meaningful, interactive insights.

---

## 🧩 Overview

This project investigates how drug-related deaths have evolved across time, geography, and demographics in the U.S.  
The workflow covers **data cleaning, transformation, modeling, and visualization**, culminating in an interactive Tableau dashboard that highlights key public health patterns.

---

## 🧠 Key Insights

- **Fentanyl-related deaths** surged dramatically between **2014 and 2021**, dominating the dataset before a modest decline after 2022.  
- **Adults (7,876 deaths)** and **young adults (3,341 deaths)** were the most affected groups.  
- Clear **regional disparities** reveal overdose hotspots and shifts over time.  
- Data-driven storytelling emphasizes both the **scale** and **human impact** of the opioid epidemic.

---

## ⚙️ Tech Stack

| Layer | Technology | Purpose |
|-------|-------------|----------|
| 🐍 **Data Processing** | **Python** | Cleaning, validation, and preprocessing of raw health data |
| ❄️ **Data Warehouse** | **Snowflake** | Staging, aggregation, and creation of summary views |
| 📊 **Visualization** | **Tableau** | Interactive dashboard for trends, geospatial mapping, and substance analysis |

---

## 🧹 Python Workflow

- Cleaned and standardized overdose data from multiple sources.  
- Normalized categorical variables (e.g., age groups, race, substance types).  
- Created calculated columns such as **event year** and **age bins**.  
- Exported structured, analysis-ready datasets to **Snowflake** for further transformation.

---

## 🧱 Snowflake Modeling

The SQL pipeline builds two main summarized views to optimize Tableau performance:

### **1️⃣ ACCIDENTAL_DEATH_SUMMARY**
Aggregates overdose data by **year, demographics, location, and substances**, including:
- `total_fentanyl_cases`, `total_heroin_cases`, `total_meth_cases`, etc.  
- Average age and total case count  
- Aggregated latitude and longitude fields for mapping  

### **2️⃣ DRUG_SUM_SUMMARY**
Yearly summary view for trend and time-series visualization:
- Summarizes substance-level counts (fentanyl, heroin, cocaine, meth, etc.)  
- Enables quick temporal analysis within Tableau  

---

## 📈 Tableau Visualization

The final **interactive dashboard** visualizes:
- National and regional overdose trends  
- Substance-level comparisons across time  
- Geospatial mapping of overdose hotspots  
- Demographic breakdowns (age, sex, race, ethnicity)

🎨 **Design Focus:** Red-accented visuals to communicate urgency while maintaining clarity and readability.

---

## 🩺 Key Takeaway

This project demonstrates a complete **data-to-insight workflow**:
> Raw health data ➜ Python preprocessing ➜ Snowflake aggregation ➜ Tableau storytelling  

It bridges **data engineering, analytics, and visualization** to uncover patterns in public health data—highlighting the tragic yet crucial story behind overdose statistics.

---

## 🚀 How to Use

1. **Run the Python preprocessing notebook** (`health.ipynb`) to clean and prepare data.  
2. **Load the cleaned dataset into Snowflake**, then execute `health_project_snowflake.sql` to create tables and views.  
3. **Connect Tableau to Snowflake** and build dashboards using the `ACCIDENTAL_DEATH_SUMMARY` or `DRUG_SUM_SUMMARY` views.

---

## 🏷️ Tags

`python` · `snowflake` · `tableau` · `etl` · `data-analytics` · `public-health` · `data-visualization` · `sql` · `opioid-crisis` · `dashboard`

---

## 📸 Portfolio Link  
👉 [[[View Portfolio](https://eekong.github.io/eddieanddata.github.io/)]

---

### 🧾 Author
**Edikan**  
Data Enthusiast  
📧 [eddieanddata@gmail.com]  


---

