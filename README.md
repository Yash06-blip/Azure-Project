# Azure-Based Demand Forecasting & Capacity Optimization System

A modern web application for demand forecasting and capacity optimization, built with Next.js, React, and Python.

## 📌 Project Context (Internship Milestones)

This project was developed as part of the Infosys Springboard Azure virtual internship.  
The work is organized across four milestones:

- **Milestone 1 – Data Cleaning & EDA**  
  Cleaned and merged raw Azure usage and external factor data into `cleaned_merged.csv`, performed basic exploratory analysis and visualizations, and exposed initial dummy REST APIs for the dashboard.

- **Milestone 2 – Feature Engineering & Advanced EDA**  
  Created time‑based, lag, rolling, and derived features (e.g., utilization ratio, storage efficiency), produced `feature_engineered.csv`, analyzed correlations and patterns, and added APIs to serve feature‑engineered data and insights.

- **Milestone 3 – Modeling & Forecasting**  
  Trained and evaluated multiple models (ARIMA/SARIMA, gradient boosting models such as LightGBM/XGBoost, and LSTM) using time‑based splits and rolling backtesting, computed MAE/RMSE/MAPE, and prepared model‑serving forecast endpoints.

- **Milestone 4 – Deployment, Capacity Planning & UI**  
  Deployed the final forecasting model via Python backend APIs, implemented a capacity‑planning engine (forecast vs available capacity with scale‑up/scale‑down recommendations), added monitoring/retraining logic, and built this Next.js dashboard UI that consumes those APIs.

## 🚀 Features

- **Demand Forecasting**: Predict future demand using advanced algorithms
- **Capacity Planning**: Optimize resource allocation based on forecasts
- **Interactive Dashboard**: Visualize data with beautiful charts and metrics
- **Responsive Design**: Works on desktop and mobile devices
- **Modern UI/UX**: Built with Radix UI and Tailwind CSS

## 🧪 Notebooks & Analysis

Core experimentation and analysis are captured in Jupyter notebooks (typically stored under `Notebooks/` & `Reports/`):

- `Milestone_01_-Data_cleaning.ipynb` – Data cleaning, merging, and basic exploratory analysis  
- `Milestone_01_Basic_Exploratory_Analysis_and_Visualization.ipynb` – Initial visual insights and usage patterns  
- `Milestone_02_Feature_Engineering.ipynb` – Feature engineering and advanced EDA  
- `Milestone_03_modeling.ipynb` – Model training, evaluation, and backtesting  
- `Milestone_04_Forecast_Integration_-_Capacity_Planning.ipynb` – API integration, capacity planning, and deployment logic

## 🛠️ Tech Stack

- **Frontend**: Next.js 14, React 18, TypeScript
- **UI Components**: Radix UI, Tailwind CSS
- **State Management**: React Hook Form, React Query
- **Backend**: Python (FastAPI/Flask)
- **Data Visualization**: Chart.js, Recharts
- **Deployment**: Vercel (Frontend), Azure (Backend)

## 🚀 Getting Started

### Prerequisites

- Node.js 18+ and npm 9+
- Python 3.9+
- Git

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/Yash06-blip/Azure-Project.git
   cd Azure-Project
   ```

2. **Install frontend dependencies**
   ```bash
   cd Project
   npm install
   ```

3. **Set up the backend**
   ```bash
   cd BACKEND
   # Create and activate virtual environment (recommended)
   python -m venv venv
   source venv/bin/activate  # On Windows: .\venv\Scripts\activate
   pip install -r requirements.txt
   ```

4. **Environment Variables**
   Create a `.env` file in the root directory with the necessary environment variables:
   ```
   NEXT_PUBLIC_API_URL=http://localhost:5000
   # Add other environment variables as needed
   ```

### Running Locally

1. **Start the development server**
   ```bash
   # From the Project directory
   npm run dev:all
   ```
   This will start both the Next.js frontend and Python backend servers.

2. Open [http://localhost:3000](http://localhost:3000) in your browser.

## 📂 Project Structure

```
.
├── AGILE_work_details/
│   ├── Agile_Template_v0.1.xlsm
│   ├── Defect_Trackerv0.1.xlsx
│   ├── Unit_Test_Plan_v0.1.xlsx
├── Data/
│   ├── processed/
│   ├── raw/
├── Models/
│   ├── active_users_forecasting_models/
│   ├── cpu_forecasting_models/
│   ├── storage_forecasting_models/
├── Notebookss/
│   ├── Milestone_01_ Data_cleaning.ipynb
│   ├── Milestone_01_Basic_Exploratory_Analysis_and_Visualization.ipynb
│   ├── Milestone_02_Feature_Engineering.ipynb
│   ├── Milestone_03_modeling.ipynb
│   ├── Milestone_04_Forecast_Integration_&_Capacity_Planning.ipynb
├── Reports/
│   ├── Milestone_01_report.md
│   ├── Milestone_02_report.md
│   ├── Milestone_03_report.md
│   ├── Milestone_04_report.md
├── Project/                  # Frontend (Next.js)
│   ├── app/                 # App router
│   ├── components/          # Reusable components
│   ├── lib/                 # Utility functions
│   ├── public/              # Static files
│   └── styles/              # Global styles
├── BACKEND/                 # Backend (Python)
│   ├── app.py              # Main application
│   └── requirements.txt     # Python dependencies
├── .gitignore
├── LICENSE.txt
└── README.md
```

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- [Next.js Documentation](https://nextjs.org/docs)
- [Radix UI](https://www.radix-ui.com/)
- [Tailwind CSS](https://tailwindcss.com/)

---

<div align="center">
  Made with ❤️ by Your Name
</div>
