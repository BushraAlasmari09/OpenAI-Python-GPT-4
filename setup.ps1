# ═══════════════════════════════════════════════════════════════════
# سكريبت الإعداد الكامل لمشروع أرض النور - OpenAI GPT-4
# Complete Setup Script for Ard AlNoor Project - OpenAI GPT-4
# ═══════════════════════════════════════════════════════════════════

Write-Host "═══════════════════════════════════════════════════════════════════" -ForegroundColor Cyan
Write-Host "       إعداد مشروع أرض النور - OpenAI GPT-4       " -ForegroundColor Yellow
Write-Host "       Setting up Ard AlNoor - OpenAI GPT-4 Project       " -ForegroundColor Yellow
Write-Host "═══════════════════════════════════════════════════════════════════" -ForegroundColor Cyan
Write-Host ""

# التحقق من وجود Python
Write-Host "[1/6] التحقق من تثبيت Python..." -ForegroundColor Green
Write-Host "[1/6] Checking Python installation..." -ForegroundColor Green

try {
    $pythonVersion = python --version 2>&1
    Write-Host "✓ Python مثبت: $pythonVersion" -ForegroundColor Green
} catch {
    Write-Host "✗ خطأ: Python غير مثبت!" -ForegroundColor Red
    Write-Host "✗ Error: Python is not installed!" -ForegroundColor Red
    Write-Host ""
    Write-Host "الرجاء تثبيت Python من: https://www.python.org/downloads/" -ForegroundColor Yellow
    Write-Host "Please install Python from: https://www.python.org/downloads/" -ForegroundColor Yellow
    Write-Host "تأكد من تفعيل خيار 'Add Python to PATH' أثناء التثبيت" -ForegroundColor Yellow
    Write-Host "Make sure to check 'Add Python to PATH' during installation" -ForegroundColor Yellow
    exit 1
}

# التحقق من وجود pip
Write-Host ""
Write-Host "[2/6] التحقق من تثبيت pip..." -ForegroundColor Green
Write-Host "[2/6] Checking pip installation..." -ForegroundColor Green

try {
    $pipVersion = pip --version 2>&1
    Write-Host "✓ pip مثبت: $pipVersion" -ForegroundColor Green
} catch {
    Write-Host "✗ خطأ: pip غير مثبت!" -ForegroundColor Red
    Write-Host "✗ Error: pip is not installed!" -ForegroundColor Red
    exit 1
}

# إنشاء بيئة افتراضية
Write-Host ""
Write-Host "[3/6] إنشاء بيئة افتراضية..." -ForegroundColor Green
Write-Host "[3/6] Creating virtual environment..." -ForegroundColor Green

if (Test-Path "venv") {
    Write-Host "! البيئة الافتراضية موجودة بالفعل" -ForegroundColor Yellow
    Write-Host "! Virtual environment already exists" -ForegroundColor Yellow
} else {
    python -m venv venv
    if ($LASTEXITCODE -eq 0) {
        Write-Host "✓ تم إنشاء البيئة الافتراضية بنجاح" -ForegroundColor Green
    } else {
        Write-Host "✗ فشل إنشاء البيئة الافتراضية" -ForegroundColor Red
        exit 1
    }
}

# تفعيل البيئة الافتراضية
Write-Host ""
Write-Host "[4/6] تفعيل البيئة الافتراضية..." -ForegroundColor Green
Write-Host "[4/6] Activating virtual environment..." -ForegroundColor Green

$venvActivate = ".\venv\Scripts\Activate.ps1"
if (Test-Path $venvActivate) {
    & $venvActivate
    Write-Host "✓ تم تفعيل البيئة الافتراضية" -ForegroundColor Green
} else {
    Write-Host "✗ لم يتم العثور على ملف التفعيل" -ForegroundColor Red
    exit 1
}

# تثبيت المكتبات المطلوبة
Write-Host ""
Write-Host "[5/6] تثبيت المكتبات المطلوبة..." -ForegroundColor Green
Write-Host "[5/6] Installing required packages..." -ForegroundColor Green

pip install --upgrade pip
pip install flask openai requests

if ($LASTEXITCODE -eq 0) {
    Write-Host "✓ تم تثبيت جميع المكتبات بنجاح" -ForegroundColor Green
} else {
    Write-Host "✗ فشل تثبيت بعض المكتبات" -ForegroundColor Red
    exit 1
}

# إنشاء ملف .env إذا لم يكن موجوداً
Write-Host ""
Write-Host "[6/6] التحقق من ملف التكوين..." -ForegroundColor Green
Write-Host "[6/6] Checking configuration file..." -ForegroundColor Green

if (-not (Test-Path ".env")) {
    Write-Host "! ملف .env غير موجود، سيتم إنشاء ملف مثال" -ForegroundColor Yellow
    Write-Host "! .env file not found, creating example file" -ForegroundColor Yellow
    
    Copy-Item ".env.example" ".env" -ErrorAction SilentlyContinue
    
    Write-Host ""
    Write-Host "⚠ تحذير هام: يجب تحديث ملف .env بمفتاح OpenAI API الخاص بك!" -ForegroundColor Yellow
    Write-Host "⚠ Important: You must update .env file with your OpenAI API key!" -ForegroundColor Yellow
} else {
    Write-Host "✓ ملف .env موجود" -ForegroundColor Green
}

# اكتمال الإعداد
Write-Host ""
Write-Host "═══════════════════════════════════════════════════════════════════" -ForegroundColor Cyan
Write-Host "✓ اكتمل الإعداد بنجاح!" -ForegroundColor Green
Write-Host "✓ Setup completed successfully!" -ForegroundColor Green
Write-Host "═══════════════════════════════════════════════════════════════════" -ForegroundColor Cyan
Write-Host ""
Write-Host "الخطوات التالية:" -ForegroundColor Yellow
Write-Host "Next steps:" -ForegroundColor Yellow
Write-Host ""
Write-Host "1. قم بتحرير ملف .env وأضف مفتاح OpenAI API الخاص بك" -ForegroundColor White
Write-Host "   Edit .env file and add your OpenAI API key" -ForegroundColor White
Write-Host ""
Write-Host "2. لتشغيل التطبيق، استخدم:" -ForegroundColor White
Write-Host "   To run the application, use:" -ForegroundColor White
Write-Host "   .\run.ps1" -ForegroundColor Cyan
Write-Host ""
Write-Host "3. افتح المتصفح على:" -ForegroundColor White
Write-Host "   Open your browser at:" -ForegroundColor White
Write-Host "   http://localhost:5000" -ForegroundColor Cyan
Write-Host ""
