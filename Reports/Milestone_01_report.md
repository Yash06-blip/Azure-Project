# 📝 EDA Report – Milestone 1

## 📅 Project: Azure Demand Forecasting & capacity Optimization System 
**Milestone:** Data Collection & Preparation  
**Team:** Backend - B  

---

## 1. 📂 Datasets Used

- **`azure_usage.csv`**: Simulated Azure usage data representing daily compute and storage usage across multiple regions and resource types.  
- **`external_factors.csv`**: Daily external economic indicators, cloud market demand metrics, and holiday markers.

---

## 2. 🎯 Key Observations

### Azure Usage:
- **Number of records:** 1080  
- **Regions covered:** East US, West US, North Europe, Southeast Asia  
- **Resource types:** VM, Storage, Container  
- **Average CPU usage:** ~74.65 (range: 50 to 99)  
- **Average Storage usage:** ~1242.48 (range: 500 to 1995)  
- **Active users range:** 200 to 499  

### External Data:
- **Economic Index range:** 73.8 (min) to 118.86 (max)  
- **Cloud Market Demand mean:** Approx. 1.02, with standard deviation around 0.12  
- **Holiday:** Binary indicator with weekends and some holidays marked as 1  

---

## 3. 🧼 Data Quality Checks

*   No missing values were found in either the `azure_usage` or `external_factors` dataframes during the initial check.
*   No duplicate rows were identified or removed from either the `azure_usage` or `external_factors` dataframes.
*   The 'date' columns in both dataframes were successfully converted from 'object' to 'datetime64[ns]' format.


|  Column             | Missing Values   | Action Taken                    |
| ------------------- | ---------------- | ------------------------------- |
| usage_cpu           | 0                | N/A                             |
| usage_storage       | 0                | N/A (No missing values found)   |
| users_active        | 0                | N/A                             |
| economic_index      | 0                | N/A                             |
| cloud_market_demand | 0                | N/A                             |
| holiday             | 0                | N/A                             |

---

## 4. 🧩 Data Integration

*   Internal Azure usage and external factors data were successfully merged using an inner join on the 'date' column, resulting in a `merged_df`. The merged data was saved to `cleaned_merged.csv`.

---

## 5. 📌 Key Findings from Exploratory Analysis

Based on the analysis of the `cleaned_merged.csv` dataset:

*   **Average Daily CPU Usage per Region:** The average daily CPU usage varies across regions over time. It exhibits a consistent trend with some daily fluctuations visible across the quarter. The visualizations show the trends for East US, West US, North Europe, and Southeast Asia.
*   **Peak Cloud Market Demand per Month:** The peak cloud market demand was calculated for each month in the dataset (January, February, and March 2023). The bar plot highlights the month with the highest peak demand.
*   **Top Regions by Total Usage:** The top 4 regions by total usage (sum of CPU and storage usage) were identified as West US, East US, North Europe, and Southeast Asia. The bar plot visually represents the total usage for these regions.

---

## 6. 📊 Visualizations

*   **Average Daily CPU Usage per Region Over Time:** Line plots showing the trend of average daily CPU usage for each region.
*   **Peak Cloud Market Demand per Month:** Bar plot illustrating the peak cloud market demand for each month.
*   **Top Regions by Total Usage:** Bar plot comparing the total usage across the top regions.

## Conclusion

* The exploratory data analysis revealed insights into the cloud usage patterns and their relationship with external factors.
* The data was successfully loaded, cleaned, and merged.
* The analysis identified variations in CPU usage by region, the months with peak cloud market demand, and the regions with the highest total usage.

## ✅ Final Output

- The cleaned and fully merged dataset is saved at:  
  `data/processed/cleaned_merged.csv`  
- Dataset is now ready for feature engineering and subsequent model training.

---

## 📌 Notes / Challenges

- Ensuring exact datetime conversion for merging required careful preprocessing.  
- No significant missing data found, simplifying cleaning efforts.  
- External factors provide useful market and holiday context correlated to resource demand, beneficial for forecasting.

---

This comprehensive EDA sets a strong foundation for model development in the next milestones.
