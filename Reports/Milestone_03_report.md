# 📘 Modeling Report – Milestone 3  
## 🤖 Azure Demand Forecasting & Capacity Optimization System  
**Team:** Backend – B  
**Milestone:** Machine Learning Model Development  

---

## 1. 📂 Dataset Used for Modeling

The modeling phase uses the **feature-engineered dataset** produced in Milestone 2:

- **Source:** `feature_engineered.csv`  
- Includes:
  - Time-based features (day_of_week, month, quarter, weekend flag)
  - Lag & rolling-window features (1/3/7-day lags + 7/30-day rolling stats)
  - Utilization metrics (CPU/Storage ratios)
  - External drivers (economic index, cloud market demand, holiday)
  - One-hot encoded region and resource types

### 🎯 Targets Modeled:
- `usage_cpu` – daily compute demand  
- `usage_storage` – daily storage demand  

### 🗂️ Chronological Train/Val/Test Split  
(to prevent leakage)

- **70% oldest data → Train**  
- **20% → Validation**  
- **10% newest → Test**  

Splits were performed **separately for CPU and Storage**.

---

## 2. 🏗️ Models Trained

Three different model families were developed to forecast CPU and Storage usage.

---

### 2.1 **ARIMA – Classical Time-Series Baseline**
- Built per-region on aggregated demand series  
- Captures autoregressive and moving-average patterns  
- Serves as a baseline for comparison  

**Limitations:**
- Univariate only; cannot use engineered features  
- Struggles with seasonality and structural shifts  

---

### 2.2 **LightGBM – Gradient Boosting (Selected Final Model)**

Used the *full engineered feature space*, including:
- Temporal encodings  
- Lag & rolling history  
- Utilization ratios  
- External demand drivers  
- Region/resource one-hot encodings  

Two separate models were trained:

- `lgbm_cpu_model.joblib`  
- `lgbm_storage_model.joblib`

**Hyperparameters:**

| Parameter | Value |
|----------|--------|
| boosting | gbdt |
| num_leaves | 31 |
| learning_rate | 0.05 |
| n_estimators | 500 |
| random_state | 42 |

**Advantages:**
- Extremely low error  
- Resistant to overfitting  
- Very fast inference → ideal for API deployment  
- Works well with tabular engineered features  

---

### 2.3 **LSTM – Neural Sequence Model**
- Implemented using Keras  
- Trained on scaled sliding windows of past values  
- Captures sequential dependencies  

**Limitations:**
- Requires more historical data  
- Slower training  
- Higher variance, less stable  
- Underperformed compared to LightGBM  

---

## 3. 📏 Evaluation Metrics

Each model was evaluated using:

- **MAE** – Mean Absolute Error  
- **RMSE** – Root Mean Square Error  
- **MAPE** – Mean Absolute Percentage Error  
- **Forecast Bias** – Average signed error  

Daily per-region error tables were generated for interpretability.

---

## 4. 📊 Validation Performance Overview

### 🔧 CPU Forecasting – Validation

| Model    | MAE | RMSE | MAPE | Forecast Bias |
|----------|------|--------|--------|----------------|
| ARIMA    | 11.45 | 13.53 | 16.86% | -1.99 |
| **LightGBM** | **0.07** | **0.10** | **0.09%** | ~0 |
| LSTM     | higher | higher | higher | higher bias |

**➡️ LightGBM clearly dominates with >100× lower error vs ARIMA.**

---

### 💽 Storage Forecasting – Validation

| Model    | MAE | RMSE | MAPE | Forecast Bias |
|----------|------|--------|--------|----------------|
| ARIMA    | >400 | >450 | >30% | high bias |
| **LightGBM** | **3–4** | **4–5** | **<1%** | near-zero |
| LSTM     | unstable | higher | higher | biased |

**➡️ LightGBM remains the most reliable and accurate.**

---

## 5. 🔍 Model Selection & Insights

### ✅ Final Models Chosen
- `lgbm_cpu_model.joblib`  
- `lgbm_storage_model.joblib`  

### Why LightGBM?

- Lowest MAE / RMSE / MAPE for CPU & Storage  
- Near-zero bias → balanced predictions  
- Extremely fast inference → ideal for FastAPI deployment  
- Handles large feature sets automatically  
- More stable than ARIMA & LSTM across regions  

### Key Observations

- Lag + rolling-window features were the highest contributors to accuracy  
- External factors helped but contributed less than temporal usage patterns  
- LSTM struggled due to dataset size and variability  
- ARIMA unable to capture multivariate interactions  

---

## 6. 💾 Artifacts Saved for Milestone 4 Deployment

The following files were exported for API integration:

| File | Description |
|------|-------------|
| `lgbm_cpu_model.joblib` | Final CPU demand model |
| `lgbm_storage_model.joblib` | Final Storage demand model |
| Feature name lists (`model.feature_name_`) | Used to align inference data |
| Evaluation summaries | Used for monitoring & retraining logic |

These models power the Milestone 4 FastAPI endpoints for:
- 30–60 day recursive forecasts  
- Capacity planning recommendations  
- Model drift detection  
- Automatic retraining triggers  

---

# 🎯 Final Summary

LightGBM models were selected as the final CPU and Storage forecasters due to their unbeatable accuracy, stability, and suitability for production deployment. All trained models, feature lists, and evaluation results are packaged and ready for integration in Milestone 4’s forecasting and capacity-planning API.

---
