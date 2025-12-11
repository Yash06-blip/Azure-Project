# 🧮 Feature Engineering Report – Milestone 2  
### Project: Azure Demand Forecasting & Capacity Optimization System  
### Team: Backend – B  
### Dataset: cleaned_merged.csv → feature_engineered.csv  

---

## 1. 📂 Base Dataset Overview

The base dataset (`cleaned_merged.csv`) contains:

- `date`, `region`, `resource_type`
- `usage_cpu`, `usage_storage`, `users_active`
- `economic_index`, `cloud_market_demand`, `holiday`

All missing values and duplicates were resolved in Milestone 1.

The dataset represents daily Azure resource usage across multiple global regions merged with external economic factors.

---

## 2. ⏱️ Time-based Features Added

To incorporate seasonality and calendar patterns, the following features were extracted from the `date` column:

- **day_of_week** → 0–6 (weekday/weekend patterns)  
- **month** → Monthly demand cycles  
- **year** → Annual grouping  
- **quarter** → Q1–Q4 patterns  
- **is_weekend** → 1 if Saturday/Sunday else 0  

These features help the model understand recurring workload patterns and seasonality.

---

## 3. 🔁 Lag & Rolling Window Features

Lag and rolling features help the model understand temporal dependencies and recent trends.

### CPU Features
**Lag Values (per region):**  
- `usage_cpu_lag_1` – Yesterday  
- `usage_cpu_lag_3` – 3 days ago  
- `usage_cpu_lag_7` – 1 week ago  

**7-day Rolling Window:**  
- `usage_cpu_rolling_mean_7d`  
- `usage_cpu_rolling_max_7d`  
- `usage_cpu_rolling_min_7d`  

**30-day Rolling Window:**  
- `usage_cpu_rolling_mean_30d`  
- `usage_cpu_rolling_max_30d`  
- `usage_cpu_rolling_min_30d`  

### Storage Features
Mirror the CPU structure:  
- Lags: `usage_storage_lag_1`, `_lag_3`, `_lag_7`  
- 7-day rolling statistics  
- 30-day rolling statistics  

Early rows contain `NaN` due to window length; handled during model training.

---

## 4. 📊 Derived Utilization & Efficiency Metrics

To measure infrastructure efficiency:

- **cpu_allocation** → assumed total CPU allocation  
- **storage_allocation** → assumed total storage allocation  
- **utilization_ratio = usage_cpu / cpu_allocation**  
- **storage_efficiency = usage_storage / storage_allocation**  

These derived ratios help in later capacity planning and forecasting tasks.

---

## 5. 🌐 External Drivers Included

The dataset integrates the following real-world drivers:

- **economic_index** → macroeconomic conditions  
- **cloud_market_demand** → industry demand indicator  
- **holiday** → binary special-event marker  

These features help models capture demand influences beyond technical usage.

---

## 6. 🌍 Categorical Encoding

To make categorical variables usable for tree-based models (LightGBM), one-hot encoding was applied.

### Region Encodings:
- `region_East US`  
- `region_West US`  
- `region_North Europe`  
- `region_Southeast Asia`  

### Resource Type Encodings:
- `resource_type_VM`  
- `resource_type_Storage`  
- `resource_type_Container`  

This ensures each region and service type is represented independently in the feature space.

---

## 7. 🚫 Dropped / Cleaned Features

During preparation:

- Intermediate rolling index columns  
- Temporary calculation helpers  
- Redundant identifiers  
- Columns with no variance  

were removed to reduce noise and avoid multicollinearity.

---

## 8. ✅ Final Output Summary

**Final dataset:** `feature_engineered.csv`  
**Stored in:** `data/processed/`

The final version includes:

- Time-based features  
- CPU/Storage lag variables  
- CPU/Storage rolling window statistics  
- Utilization & efficiency metrics  
- One-hot encoded categorical fields  
- External economic & market drivers  

This enhanced feature set provides a rich temporal + categorical + contextual foundation for Milestone 3 modeling (LightGBM, ARIMA baselines, LSTM preparation).

---

## ✔ Status: Feature Engineering Completed

The dataset is now fully prepared for forecasting model development in Milestone 3.
