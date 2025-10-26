# ═══════════════════════════════════════════════════════════════════
# سكريبت الكل في واحد لمشروع أرض النور - OpenAI GPT-4
# All-in-One Script for Ard AlNoor Project - OpenAI GPT-4
# 
# هذا السكريبت يقوم بكل شيء من البداية للنهاية:
# This script does everything from start to finish:
# 1. التحقق من المتطلبات | Check requirements
# 2. الإعداد | Setup
# 3. التكوين | Configuration
# 4. التشغيل | Running
# ═══════════════════════════════════════════════════════════════════

param(
    [switch]$SkipSetup,    # تخطي الإعداد | Skip setup
    [switch]$SkipConfig,   # تخطي التكوين | Skip configuration
    [switch]$JustRun       # التشغيل فقط | Just run
)

function Write-ColorOutput($ForegroundColor) {
    $fc = $host.UI.RawUI.ForegroundColor
    $host.UI.RawUI.ForegroundColor = $ForegroundColor
    if ($args) {
        Write-Output $args
    }
    $host.UI.RawUI.ForegroundColor = $fc
}

function Write-Header {
    param([string]$Text)
    Write-Host ""
    Write-Host "═══════════════════════════════════════════════════════════════════" -ForegroundColor Cyan
    Write-Host "  $Text" -ForegroundColor Yellow
    Write-Host "═══════════════════════════════════════════════════════════════════" -ForegroundColor Cyan
    Write-Host ""
}

function Write-Step {
    param([string]$Text)
    Write-Host ""
    Write-Host $Text -ForegroundColor Green
}

function Write-Success {
    param([string]$Text)
    Write-Host "✓ $Text" -ForegroundColor Green
}

function Write-Error-Custom {
    param([string]$Text)
    Write-Host "✗ $Text" -ForegroundColor Red
}

function Write-Warning-Custom {
    param([string]$Text)
    Write-Host "⚠ $Text" -ForegroundColor Yellow
}

function Load-EnvFile {
    # تحميل متغيرات البيئة من ملف .env
    # Load environment variables from .env file
    if (Test-Path ".env") {
        Get-Content ".env" | ForEach-Object {
            if ($_ -match '^\s*([^#][^=]+)=(.*)$') {
                $name = $matches[1].Trim()
                $value = $matches[2].Trim()
                [System.Environment]::SetEnvironmentVariable($name, $value, "Process")
            }
        }
        return $true
    }
    return $false
}

# عرض الشعار
Write-Header "مشروع أرض النور - OpenAI GPT-4 | Ard AlNoor Project"

# إذا كان المستخدم يريد التشغيل فقط
if ($JustRun) {
    Write-Host "تشغيل التطبيق مباشرة... | Running application directly..." -ForegroundColor Yellow
    & ".\run.ps1"
    exit
}

# ═══════════════════════════════════════════════════════════════════
# الخطوة 1: التحقق من Python
# Step 1: Check Python
# ═══════════════════════════════════════════════════════════════════

if (-not $SkipSetup) {
    Write-Step "[1/5] التحقق من تثبيت Python... | Checking Python installation..."
    
    try {
        $pythonVersion = python --version 2>&1
        Write-Success "Python مثبت: $pythonVersion | Python installed: $pythonVersion"
    } catch {
        Write-Error-Custom "Python غير مثبت! | Python is not installed!"
        Write-Host ""
        Write-Host "يرجى تثبيت Python من: | Please install Python from:" -ForegroundColor Yellow
        Write-Host "https://www.python.org/downloads/" -ForegroundColor Cyan
        Write-Host ""
        Write-Host "تأكد من تفعيل 'Add Python to PATH' أثناء التثبيت" -ForegroundColor Yellow
        Write-Host "Make sure to check 'Add Python to PATH' during installation" -ForegroundColor Yellow
        exit 1
    }
    
    # التحقق من pip
    try {
        $pipVersion = pip --version 2>&1
        Write-Success "pip مثبت: $pipVersion | pip installed: $pipVersion"
    } catch {
        Write-Error-Custom "pip غير مثبت! | pip is not installed!"
        exit 1
    }
}

# ═══════════════════════════════════════════════════════════════════
# الخطوة 2: إنشاء البيئة الافتراضية
# Step 2: Create Virtual Environment
# ═══════════════════════════════════════════════════════════════════

if (-not $SkipSetup) {
    Write-Step "[2/5] إنشاء البيئة الافتراضية... | Creating virtual environment..."
    
    if (Test-Path "venv") {
        Write-Warning-Custom "البيئة الافتراضية موجودة بالفعل | Virtual environment already exists"
    } else {
        python -m venv venv
        if ($LASTEXITCODE -eq 0) {
            Write-Success "تم إنشاء البيئة الافتراضية | Virtual environment created"
        } else {
            Write-Error-Custom "فشل إنشاء البيئة الافتراضية | Failed to create virtual environment"
            exit 1
        }
    }
}

# ═══════════════════════════════════════════════════════════════════
# الخطوة 3: تفعيل البيئة وتثبيت المكتبات
# Step 3: Activate Environment and Install Packages
# ═══════════════════════════════════════════════════════════════════

if (-not $SkipSetup) {
    Write-Step "[3/5] تفعيل البيئة وتثبيت المكتبات... | Activating environment and installing packages..."
    
    $venvActivate = ".\venv\Scripts\Activate.ps1"
    
    if (-not (Test-Path $venvActivate)) {
        Write-Error-Custom "ملف التفعيل غير موجود | Activation script not found"
        exit 1
    }
    
    # تفعيل البيئة
    & $venvActivate
    
    # ترقية pip
    Write-Host "  → ترقية pip... | Upgrading pip..." -ForegroundColor Gray
    pip install --upgrade pip --quiet
    
    # تثبيت المكتبات
    Write-Host "  → تثبيت Flask..." -ForegroundColor Gray
    pip install flask --quiet
    
    Write-Host "  → تثبيت OpenAI..." -ForegroundColor Gray
    pip install openai --quiet
    
    Write-Host "  → تثبيت Requests..." -ForegroundColor Gray
    pip install requests --quiet
    
    Write-Host "  → تثبيت Python-dotenv..." -ForegroundColor Gray
    pip install python-dotenv --quiet
    
    if ($LASTEXITCODE -eq 0) {
        Write-Success "تم تثبيت جميع المكتبات | All packages installed"
    } else {
        Write-Warning-Custom "قد تكون هناك مشاكل في بعض المكتبات | There might be issues with some packages"
    }
}

# ═══════════════════════════════════════════════════════════════════
# الخطوة 4: التكوين
# Step 4: Configuration
# ═══════════════════════════════════════════════════════════════════

if (-not $SkipConfig) {
    Write-Step "[4/5] التكوين... | Configuration..."
    
    if (Test-Path ".env") {
        Write-Success "ملف .env موجود | .env file exists"
        
        # التحقق من مفتاح API
        $envContent = Get-Content ".env" -Raw
        if ($envContent -match "OPENAI_API_KEY=sk-[a-zA-Z0-9_-]{20,}") {
            Write-Success "مفتاح OpenAI API موجود | OpenAI API key found"
        } else {
            Write-Warning-Custom "مفتاح OpenAI API غير مكتمل! | OpenAI API key not complete!"
            Write-Host ""
            Write-Host "يرجى تحديث ملف .env بمفتاح صحيح" -ForegroundColor Yellow
            Write-Host "Please update .env file with a valid key" -ForegroundColor Yellow
            
            $openEnv = Read-Host "هل تريد فتح ملف .env الآن؟ (y/n) | Open .env now? (y/n)"
            if ($openEnv -eq "y" -or $openEnv -eq "Y") {
                notepad .env
                Write-Host "بعد حفظ المفتاح، اضغط Enter للمتابعة..." -ForegroundColor Yellow
                Write-Host "After saving the key, press Enter to continue..." -ForegroundColor Yellow
                Read-Host
            }
        }
    } else {
        Write-Warning-Custom "ملف .env غير موجود | .env file not found"
        
        if (Test-Path ".env.example") {
            Copy-Item ".env.example" ".env"
            Write-Success "تم إنشاء ملف .env من المثال | Created .env from example"
            
            Write-Host ""
            Write-Host "يرجى إضافة مفتاح OpenAI API في ملف .env" -ForegroundColor Yellow
            Write-Host "Please add your OpenAI API key in .env file" -ForegroundColor Yellow
            Write-Host ""
            Write-Host "للحصول على المفتاح: | To get the key:" -ForegroundColor Cyan
            Write-Host "1. افتح | Visit: https://platform.openai.com/" -ForegroundColor White
            Write-Host "2. اذهب إلى API Keys | Go to API Keys" -ForegroundColor White
            Write-Host "3. أنشئ مفتاح جديد | Create new key" -ForegroundColor White
            Write-Host "4. انسخه وألصقه في ملف .env" -ForegroundColor White
            Write-Host "   Copy and paste it in .env file" -ForegroundColor White
            Write-Host ""
            
            $openEnv = Read-Host "هل تريد فتح ملف .env الآن؟ (y/n) | Open .env now? (y/n)"
            if ($openEnv -eq "y" -or $openEnv -eq "Y") {
                notepad .env
                Write-Host ""
                Write-Host "بعد إضافة المفتاح وحفظ الملف، اضغط Enter للمتابعة..." -ForegroundColor Yellow
                Write-Host "After adding the key and saving, press Enter to continue..." -ForegroundColor Yellow
                Read-Host
            } else {
                Write-Host ""
                Write-Host "⚠ تنبيه: لن يعمل التطبيق بدون مفتاح صحيح!" -ForegroundColor Yellow
                Write-Host "⚠ Warning: App won't work without a valid key!" -ForegroundColor Yellow
                Write-Host ""
            }
        } else {
            Write-Error-Custom "ملف .env.example غير موجود! | .env.example not found!"
        }
    }
}

# ═══════════════════════════════════════════════════════════════════
# الخطوة 5: التشغيل
# Step 5: Running
# ═══════════════════════════════════════════════════════════════════

Write-Step "[5/5] الاستعداد للتشغيل... | Preparing to run..."

Write-Host ""
Write-Header "جاهز للتشغيل! | Ready to Run!"

Write-Host "هل تريد تشغيل التطبيق الآن؟ | Run the application now?" -ForegroundColor Yellow
Write-Host "[Y] نعم / Yes   [N] لا / No   (الافتراضي: نعم / Default: Yes)" -ForegroundColor Gray
$runNow = Read-Host

if ($runNow -eq "" -or $runNow -eq "y" -or $runNow -eq "Y") {
    Write-Host ""
    Write-Host "═══════════════════════════════════════════════════════════════════" -ForegroundColor Cyan
    Write-Host "  تشغيل التطبيق... | Starting application..." -ForegroundColor Green
    Write-Host "═══════════════════════════════════════════════════════════════════" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "التطبيق سيعمل على: | Application will run on:" -ForegroundColor Yellow
    Write-Host "http://localhost:5000" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "للإيقاف، اضغط Ctrl+C | To stop, press Ctrl+C" -ForegroundColor Yellow
    Write-Host ""
    
    # تفعيل البيئة الافتراضية إذا لم تكن مفعلة
    # Activate virtual environment if not already active
    if (-not $env:VIRTUAL_ENV) {
        & ".\venv\Scripts\Activate.ps1"
    }
    
    # تحميل متغيرات البيئة
    # Load environment variables
    Load-EnvFile | Out-Null
    
    # تشغيل التطبيق
    python main.py
} else {
    Write-Host ""
    Write-Host "لتشغيل التطبيق لاحقاً، استخدم أحد الأوامر التالية:" -ForegroundColor Yellow
    Write-Host "To run the application later, use one of these commands:" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "  .\run.ps1" -ForegroundColor Cyan
    Write-Host "  .\start.ps1 -JustRun" -ForegroundColor Cyan
    Write-Host ""
}
