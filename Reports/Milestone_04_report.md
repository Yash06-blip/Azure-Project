# 📡 Forecast Integration & Capacity Planning – Milestone 4  
## 🤖 Azure Demand Forecasting & Capacity Optimization System  
**Team:** Backend – B  
**Milestone:** Forecast API, Automation, Reporting & Monitoring  

---

## 1. 🎯 Objective & Setup

Milestone 4 integrates the trained forecasting models into a **production-style backend system**.  
This involves:

- Building a FastAPI service for CPU/Storage forecasting  
- Implementing capacity-planning recommendations  
- Simulating automated forecasting runs  
- Tracking forecast accuracy  
- Generating summary reports and visualizations  
- Adding monitoring + retraining logic  

This milestone uses:

- `lgbm_cpu_model.joblib`  
- `lgbm_storage_model.joblib`  
- `feature_engineered.csv`  

Key libraries: **FastAPI, Uvicorn, Joblib, Pandas, NumPy, Matplotlib, Seaborn**.

---

## 2. 🧠 Model & Data Loading in FastAPI

The notebook loads the trained models and dataset:

```python
cpu_model = joblib.load("lgbm_cpu_model.joblib")
storage_model = joblib.load("lgbm_storage_model.joblib")
df = pd.read_csv("feature_engineered.csv")
