# ============================================
# FILE: start-dev.ps1
# ============================================

Write-Host "[START] Starting Azure Demand Forecasting Platform..." -ForegroundColor Cyan
Write-Host ""

# ---------------------------
# Check Python
# ---------------------------
$pythonVersion = python --version 2>&1
if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Python not found! Please install Python 3.8+" -ForegroundColor Red
    exit 1
}
Write-Host "[OK] Python found: $pythonVersion" -ForegroundColor Green
Write-Host ""

# ---------------------------
# Check Node
# ---------------------------
$nodeVersion = node --version 2>&1
if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Node.js not found! Please install Node.js 18+" -ForegroundColor Red
    exit 1
}
Write-Host ""

# ---------------------------
# Python dependencies
# ---------------------------
Write-Host "📦 Checking Python dependencies..." -ForegroundColor Yellow
if (Test-Path "backend/requirements.txt") {
    pip install -r backend/requirements.txt
    Write-Host "[OK] Python dependencies ready" -ForegroundColor Green
} else {
    Write-Host "[WARN] requirements.txt not found `(skipping`)" -ForegroundColor Yellow
}
Write-Host ""

# ---------------------------
# Node dependencies
# ---------------------------
Write-Host "📦 Checking Node.js dependencies..." -ForegroundColor Yellow
if (!(Test-Path "node_modules")) {
    Write-Host "Installing npm packages..." -ForegroundColor Yellow
    npm install
}
Write-Host "[OK] Node.js dependencies ready" -ForegroundColor Green
Write-Host ""

# ---------------------------
# Start Flask backend
# ---------------------------
Write-Host "[START] Starting Flask backend (port 5000)..." -ForegroundColor Cyan

$backendJob = Start-Job -ScriptBlock {
    Set-Location $using:PWD
    python backend/app.py
}

Write-Host "[OK] Backend started (Job ID: $($backendJob.Id))" -ForegroundColor Green

Start-Sleep -Seconds 3

# ---------------------------
# Start Next.js frontend
# ---------------------------
Write-Host "[START] Starting Next.js frontend (port 3000)..." -ForegroundColor Cyan
Write-Host ""
Write-Host "==============================================================" -ForegroundColor Cyan
Write-Host "[INFO] Application URLs:" -ForegroundColor Green
Write-Host "   Frontend: http://localhost:3000" -ForegroundColor Yellow
Write-Host "   Backend:  http://localhost:5000/api/health" -ForegroundColor Yellow
Write-Host "==============================================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "[INFO] Press Ctrl+C to stop both servers." -ForegroundColor Gray
Write-Host ""

npm run dev

# ---------------------------
# Cleanup
# ---------------------------
Write-Host ""
Write-Host "[STOP] Stopping backend server..." -ForegroundColor Yellow

Stop-Job $backendJob
Remove-Job $backendJob

Write-Host "[OK] All servers stopped" -ForegroundColor Green
