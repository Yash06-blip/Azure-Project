# Azure-Based Demand Forecasting & Capacity Optimization System

A modern web application for demand forecasting and capacity optimization, built with Next.js, React, and Python.

## 🚀 Features

- **Demand Forecasting**: Predict future demand using advanced algorithms
- **Capacity Planning**: Optimize resource allocation based on forecasts
- **Interactive Dashboard**: Visualize data with beautiful charts and metrics
- **Responsive Design**: Works on desktop and mobile devices
- **Modern UI/UX**: Built with Radix UI and Tailwind CSS

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
