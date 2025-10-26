# 📚 دليل السكريبتات والأوامر الكاملة
# Complete Scripts and Commands Reference

هذا الملف يحتوي على جميع الأوامر والسكريبتات المطلوبة لتشغيل المشروع من البداية للنهاية.

This file contains all commands and scripts needed to run the project from start to finish.

---

## 🎯 الطريقة الأسهل | Easiest Way

### لمستخدمي Windows | For Windows Users

**باستخدام الملف .bat:**
```cmd
start.bat
```

**أو باستخدام PowerShell مباشرة:**
```powershell
powershell -ExecutionPolicy Bypass -File ".\start.ps1"
```

هذا السكريبت سيقوم بكل شيء تلقائياً!
This script will do everything automatically!

---

## 📝 السكريبتات المتاحة | Available Scripts

### 1. `start.ps1` - السكريبت الشامل | All-in-One Script

**الوصف | Description:**
سكريبت كامل يقوم بالإعداد والتكوين والتشغيل
Complete script that handles setup, configuration, and running

**الاستخدام | Usage:**
```powershell
# تشغيل كامل (إعداد + تكوين + تشغيل)
# Full run (setup + config + run)
.\start.ps1

# التشغيل فقط (إذا كان الإعداد منتهي)
# Run only (if setup is done)
.\start.ps1 -JustRun

# تخطي الإعداد
# Skip setup
.\start.ps1 -SkipSetup

# تخطي التكوين
# Skip configuration
.\start.ps1 -SkipConfig
```

**الميزات | Features:**
- ✅ التحقق من Python و pip
- ✅ إنشاء البيئة الافتراضية
- ✅ تثبيت جميع المكتبات
- ✅ إنشاء وتكوين ملف .env
- ✅ تشغيل التطبيق

---

### 2. `start.bat` - ملف تنفيذ Windows | Windows Batch File

**الوصف | Description:**
ملف تنفيذ مباشر لنظام Windows
Direct execution file for Windows

**الاستخدام | Usage:**
```cmd
start.bat
```

أو مجرد النقر المزدوج على الملف!
Or just double-click the file!

---

### 3. `setup.ps1` - سكريبت الإعداد | Setup Script

**الوصف | Description:**
يقوم بإعداد المشروع (البيئة الافتراضية + المكتبات)
Sets up the project (virtual environment + packages)

**الاستخدام | Usage:**
```powershell
.\setup.ps1
```

**ماذا يفعل | What it does:**
1. يتحقق من تثبيت Python
2. ينشئ البيئة الافتراضية
3. يثبت جميع المكتبات المطلوبة
4. ينشئ ملف .env من المثال

---

### 4. `run.ps1` - سكريبت التشغيل | Run Script

**الوصف | Description:**
يشغل التطبيق فقط (بعد الإعداد)
Runs the application only (after setup)

**الاستخدام | Usage:**
```powershell
.\run.ps1
```

**ماذا يفعل | What it does:**
1. يفعّل البيئة الافتراضية
2. يحمّل متغيرات البيئة من .env
3. يشغل التطبيق Python

---

## 🔧 الأوامر اليدوية | Manual Commands

إذا كنت تفضل تنفيذ الأوامر يدوياً خطوة بخطوة:
If you prefer to execute commands manually step by step:

### الإعداد الأولي | Initial Setup

```powershell
# 1. التحقق من Python | Check Python
python --version

# 2. التحقق من pip | Check pip
pip --version

# 3. إنشاء البيئة الافتراضية | Create virtual environment
python -m venv venv

# 4. تفعيل البيئة الافتراضية | Activate virtual environment
.\venv\Scripts\Activate.ps1

# في حالة ظهور خطأ في التنفيذ، قم بتشغيل:
# If execution error appears, run:
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

### تثبيت المكتبات | Install Packages

```powershell
# ترقية pip | Upgrade pip
pip install --upgrade pip

# الطريقة 1: من ملف requirements.txt
# Method 1: From requirements.txt
pip install -r requirements.txt

# الطريقة 2: تثبيت المكتبات واحدة تلو الأخرى
# Method 2: Install packages one by one
pip install flask
pip install openai
pip install requests
pip install python-dotenv
```

### التكوين | Configuration

```powershell
# نسخ ملف المثال | Copy example file
Copy-Item .env.example .env

# فتح الملف للتحرير | Open file for editing
notepad .env

# أو استخدام محرر آخر | Or use another editor
code .env          # VS Code
vim .env           # Vim
nano .env          # Nano (في Linux/Mac | on Linux/Mac)
```

### التشغيل | Running

```powershell
# تأكد من تفعيل البيئة الافتراضية | Make sure venv is activated
.\venv\Scripts\Activate.ps1

# شغّل التطبيق | Run the application
python main.py

# أو | Or
flask run
```

---

## 🌐 أوامر لمستخدمي Linux/Mac | Commands for Linux/Mac Users

```bash
# 1. إنشاء البيئة الافتراضية | Create virtual environment
python3 -m venv venv

# 2. تفعيل البيئة | Activate environment
source venv/bin/activate

# 3. تثبيت المكتبات | Install packages
pip install -r requirements.txt

# 4. نسخ ملف التكوين | Copy config file
cp .env.example .env

# 5. تحرير ملف .env | Edit .env file
nano .env

# 6. تشغيل التطبيق | Run application
python main.py
```

---

## 📋 قائمة المكتبات المطلوبة | Required Packages List

```
flask>=3.0.0
openai>=1.3.0
requests>=2.31.0
python-dotenv>=1.0.0
```

---

## 🔑 تكوين ملف .env | .env File Configuration

```env
# مفتاح OpenAI (مطلوب) | OpenAI Key (Required)
OPENAI_API_KEY=sk-proj-your-actual-key-here

# إعدادات النماذج | Model Settings
OPENAI_MARKETING_MODEL=gpt-4o-mini
OPENAI_EMBEDDING_MODEL=text-embedding-3-small

# إعدادات الخادم | Server Settings
PORT=5000
FLASK_ENV=development

# درجة الحرارة للإبداع | Temperature for creativity
MARKETING_TEMPERATURE=0.7

# إعدادات النشر (اختياري) | Publishing Settings (Optional)
USE_REAL_PLATFORMS=false
INSTAGRAM_RAPIDAPI_KEY=your-key-here
TIKTOK_RAPIDAPI_KEY=your-key-here
```

---

## 🎯 أمثلة على حالات الاستخدام | Usage Examples

### الحالة 1: أول مرة تشغيل | First Time Running

```powershell
# ببساطة شغّل | Simply run:
.\start.ps1

# أو | Or:
start.bat
```

### الحالة 2: تشغيل بعد إعداد سابق | Running After Previous Setup

```powershell
.\start.ps1 -JustRun

# أو | Or:
.\run.ps1
```

### الحالة 3: إعادة التثبيت الكاملة | Complete Reinstall

```powershell
# 1. حذف البيئة الافتراضية | Delete virtual environment
Remove-Item -Recurse -Force venv

# 2. إعادة الإعداد | Re-setup
.\setup.ps1

# 3. التشغيل | Run
.\run.ps1
```

### الحالة 4: تحديث المكتبات | Update Packages

```powershell
# تفعيل البيئة | Activate environment
.\venv\Scripts\Activate.ps1

# تحديث كل المكتبات | Update all packages
pip install --upgrade -r requirements.txt

# أو تحديث مكتبة معينة | Or update specific package
pip install --upgrade openai
```

---

## 🐛 حل المشاكل الشائعة | Common Troubleshooting

### المشكلة: "cannot be loaded because running scripts is disabled"

**الحل | Solution:**
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

### المشكلة: "Python is not recognized"

**الحل | Solution:**
1. أعد تثبيت Python من: https://www.python.org/
2. تأكد من تفعيل "Add Python to PATH"
3. أعد تشغيل PowerShell

### المشكلة: "pip is not recognized"

**الحل | Solution:**
```powershell
python -m ensurepip --upgrade
```

### المشكلة: "Port 5000 is already in use"

**الحل | Solution:**
غيّر المنفذ في ملف .env:
```env
PORT=8000
```

### المشكلة: "Invalid API key"

**الحل | Solution:**
1. تحقق من المفتاح في ملف .env
2. تأكد من أنه يبدأ بـ `sk-`
3. لا توجد مسافات قبل أو بعد المفتاح
4. احصل على مفتاح جديد من: https://platform.openai.com/

---

## 📞 الدعم والمساعدة | Support and Help

### الموارد | Resources:
- 📖 README.md - الدليل الكامل | Complete guide
- 🚀 QUICKSTART.md - دليل البدء السريع | Quick start guide
- 📚 SCRIPTS.md - هذا الملف | This file

### الحصول على المساعدة | Getting Help:
- 🐛 [فتح Issue على GitHub](https://github.com/BushraAlasmari09/OpenAI-Python-GPT-4/issues)
- 📧 مراسلة عبر البريد الإلكتروني | Email support
- 💬 المجتمع | Community

---

## ✅ قائمة التحقق | Checklist

قبل التشغيل، تأكد من:
Before running, make sure:

- [ ] Python 3.11+ مثبت | Python 3.11+ installed
- [ ] pip مثبت ومحدّث | pip installed and updated
- [ ] ملف .env موجود ومُكوّن | .env file exists and configured
- [ ] مفتاح OpenAI API صحيح | Valid OpenAI API key
- [ ] المنفذ 5000 متاح (أو غيّره) | Port 5000 available (or change it)

---

<div align="center">

**بالتوفيق! | Good Luck!** 🎉

إذا كان هذا الدليل مفيداً، لا تنسى ⭐ النجمة!
If this guide is helpful, don't forget the ⭐ star!

</div>
