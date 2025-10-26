# ═══════════════════════════════════════════════════════════════════
# سكريبت تشغيل مشروع أرض النور - OpenAI GPT-4
# Run Script for Ard AlNoor Project - OpenAI GPT-4
# ═══════════════════════════════════════════════════════════════════

Write-Host "═══════════════════════════════════════════════════════════════════" -ForegroundColor Cyan
Write-Host "       تشغيل مشروع أرض النور - OpenAI GPT-4       " -ForegroundColor Yellow
Write-Host "       Running Ard AlNoor - OpenAI GPT-4 Project       " -ForegroundColor Yellow
Write-Host "═══════════════════════════════════════════════════════════════════" -ForegroundColor Cyan
Write-Host ""

# التحقق من وجود البيئة الافتراضية
if (-not (Test-Path "venv")) {
    Write-Host "✗ البيئة الافتراضية غير موجودة!" -ForegroundColor Red
    Write-Host "✗ Virtual environment not found!" -ForegroundColor Red
    Write-Host ""
    Write-Host "الرجاء تشغيل سكريبت الإعداد أولاً:" -ForegroundColor Yellow
    Write-Host "Please run the setup script first:" -ForegroundColor Yellow
    Write-Host "  .\setup.ps1" -ForegroundColor Cyan
    exit 1
}

# التحقق من وجود ملف .env
if (-not (Test-Path ".env")) {
    Write-Host "⚠ تحذير: ملف .env غير موجود!" -ForegroundColor Yellow
    Write-Host "⚠ Warning: .env file not found!" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "سيتم استخدام متغيرات البيئة الافتراضية" -ForegroundColor Yellow
    Write-Host "Default environment variables will be used" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "⚠ تحذير: قد لا يعمل التطبيق بدون مفتاح OpenAI API!" -ForegroundColor Yellow
    Write-Host "⚠ Warning: The app may not work without OpenAI API key!" -ForegroundColor Yellow
    Write-Host ""
    
    $continue = Read-Host "هل تريد المتابعة؟ (y/n) / Continue? (y/n)"
    if ($continue -ne "y" -and $continue -ne "Y") {
        exit 0
    }
}

# تفعيل البيئة الافتراضية
Write-Host "تفعيل البيئة الافتراضية..." -ForegroundColor Green
Write-Host "Activating virtual environment..." -ForegroundColor Green

$venvActivate = ".\venv\Scripts\Activate.ps1"
& $venvActivate

# تحميل متغيرات البيئة من .env
if (Test-Path ".env") {
    Write-Host "تحميل متغيرات البيئة..." -ForegroundColor Green
    Write-Host "Loading environment variables..." -ForegroundColor Green
    
    Get-Content ".env" | ForEach-Object {
        if ($_ -match '^\s*([^#][^=]+)=(.*)$') {
            $name = $matches[1].Trim()
            $value = $matches[2].Trim()
            [System.Environment]::SetEnvironmentVariable($name, $value, "Process")
        }
    }
}

Write-Host ""
Write-Host "═══════════════════════════════════════════════════════════════════" -ForegroundColor Cyan
Write-Host "✓ بدء تشغيل التطبيق..." -ForegroundColor Green
Write-Host "✓ Starting application..." -ForegroundColor Green
Write-Host "═══════════════════════════════════════════════════════════════════" -ForegroundColor Cyan
Write-Host ""
Write-Host "التطبيق يعمل على: http://localhost:5000" -ForegroundColor Yellow
Write-Host "Application running at: http://localhost:5000" -ForegroundColor Yellow
Write-Host ""
Write-Host "للإيقاف، اضغط Ctrl+C" -ForegroundColor Yellow
Write-Host "To stop, press Ctrl+C" -ForegroundColor Yellow
Write-Host ""
Write-Host "═══════════════════════════════════════════════════════════════════" -ForegroundColor Cyan
Write-Host ""

# تشغيل التطبيق
python main.py
