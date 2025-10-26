# 🚀 دليل البدء السريع | Quick Start Guide

## للمستخدمين العرب | For Arabic Users

### الخطوات الكاملة من الصفر:

#### 1️⃣ تثبيت Python
- انتقل إلى: https://www.python.org/downloads/
- حمّل Python 3.11 أو أحدث
- أثناء التثبيت، **تأكد من تفعيل خيار "Add Python to PATH"**
- أعد تشغيل الكمبيوتر بعد التثبيت

#### 2️⃣ تحميل المشروع
افتح PowerShell وشغّل:
```powershell
# انتقل إلى المجلد الذي تريده
cd C:\Users\YourName\Desktop

# حمّل المشروع
git clone https://github.com/BushraAlasmari09/OpenAI-Python-GPT-4.git

# ادخل للمشروع
cd OpenAI-Python-GPT-4
```

#### 3️⃣ تشغيل الإعداد
```powershell
.\setup.ps1
```

إذا ظهرت رسالة خطأ عن تنفيذ السكريبتات، شغّل:
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```
ثم أعد تشغيل `.\setup.ps1`

#### 4️⃣ الحصول على مفتاح OpenAI

1. **افتح**: https://platform.openai.com/
2. **سجل دخول** أو **أنشئ حساب جديد**
3. اذهب إلى **API Keys** من القائمة
4. اضغط **Create new secret key**
5. **انسخ المفتاح** (يظهر مرة واحدة فقط!)
6. احفظه في مكان آمن

#### 5️⃣ تكوين المشروع

```powershell
# افتح ملف .env
notepad .env
```

**استبدل** `your-openai-api-key-here` بمفتاحك:
```
OPENAI_API_KEY=sk-proj-xxxxxxxxxxxxxxxxxxxxx
```

**احفظ** الملف واغلقه (Ctrl+S ثم Alt+F4)

#### 6️⃣ تشغيل التطبيق

```powershell
.\run.ps1
```

#### 7️⃣ فتح التطبيق

افتح متصفحك واذهب إلى:
```
http://localhost:5000
```

### ✅ تم! الآن يمكنك استخدام التطبيق

---

## For English Users

### Complete Steps from Scratch:

#### 1️⃣ Install Python
- Go to: https://www.python.org/downloads/
- Download Python 3.11 or newer
- During installation, **make sure to check "Add Python to PATH"**
- Restart your computer after installation

#### 2️⃣ Download Project
Open PowerShell and run:
```powershell
# Navigate to your desired folder
cd C:\Users\YourName\Desktop

# Download the project
git clone https://github.com/BushraAlasmari09/OpenAI-Python-GPT-4.git

# Enter the project
cd OpenAI-Python-GPT-4
```

#### 3️⃣ Run Setup
```powershell
.\setup.ps1
```

If you get an error about script execution, run:
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```
Then re-run `.\setup.ps1`

#### 4️⃣ Get OpenAI API Key

1. **Visit**: https://platform.openai.com/
2. **Sign in** or **Create new account**
3. Go to **API Keys** from menu
4. Click **Create new secret key**
5. **Copy the key** (shows only once!)
6. Save it somewhere safe

#### 5️⃣ Configure Project

```powershell
# Open .env file
notepad .env
```

**Replace** `your-openai-api-key-here` with your key:
```
OPENAI_API_KEY=sk-proj-xxxxxxxxxxxxxxxxxxxxx
```

**Save** the file and close (Ctrl+S then Alt+F4)

#### 6️⃣ Run Application

```powershell
.\run.ps1
```

#### 7️⃣ Open Application

Open your browser and go to:
```
http://localhost:5000
```

### ✅ Done! You can now use the application

---

## 🎯 الأوامر الأساسية | Basic Commands

### تشغيل التطبيق | Run Application
```powershell
.\run.ps1
```

### إيقاف التطبيق | Stop Application
```
اضغط Ctrl+C
Press Ctrl+C
```

### إعادة التثبيت | Reinstall
```powershell
# احذف المجلد venv
# Delete venv folder
Remove-Item -Recurse -Force venv

# أعد تشغيل الإعداد
# Re-run setup
.\setup.ps1
```

### تحديث المكتبات | Update Packages
```powershell
# فعّل البيئة الافتراضية
# Activate virtual environment
.\venv\Scripts\Activate.ps1

# حدّث المكتبات
# Update packages
pip install --upgrade -r requirements.txt
```

---

## ❓ مشاكل شائعة وحلولها | Common Issues and Solutions

### المشكلة: "python is not recognized"
**الحل | Solution:**
```powershell
# أعد تثبيت Python وتأكد من تفعيل "Add to PATH"
# Reinstall Python and make sure "Add to PATH" is checked
```

### المشكلة: "cannot be loaded because scripts are disabled"
**الحل | Solution:**
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

### المشكلة: "Invalid API key"
**الحل | Solution:**
1. تأكد من نسخ المفتاح كاملاً من OpenAI
2. تحقق من عدم وجود مسافات قبل أو بعد المفتاح في ملف .env
3. تأكد من أن المفتاح يبدأ بـ `sk-`

### المشكلة: "Port 5000 is already in use"
**الحل | Solution:**
```powershell
# في ملف .env، غيّر المنفذ
# In .env file, change the port
PORT=8000
```

### المشكلة: التطبيق بطيء
**الحل | Solution:**
- تحقق من اتصالك بالإنترنت
- GPT-4 يحتاج وقت للمعالجة (طبيعي)
- جرب استخدام `gpt-3.5-turbo` بدلاً من `gpt-4o-mini` في .env

---

## 💰 التكاليف | Costs

### OpenAI API
- **gpt-4o-mini**: ~$0.15 لكل 1M tokens
- **gpt-4**: ~$0.03 لكل 1K tokens
- **الحد الأدنى**: $5

### نصائح لتوفير التكاليف | Cost Saving Tips:
1. استخدم `gpt-4o-mini` للاختبار (أرخص)
2. راقب استخدامك في لوحة OpenAI
3. ضع حدود للإنفاق في حسابك
4. لا تشارك المفتاح مع أحد

---

## 📞 الدعم | Support

هل تواجه مشكلة؟ | Having issues?
- 🐛 افتح Issue في GitHub
- 📧 أرسل بريد إلكتروني
- 💬 انضم للمجتمع

---

## ⚡ نصائح سريعة | Quick Tips

### للمبتدئين | For Beginners:
1. ✅ ابدأ بالقراءة الكاملة للـ README
2. ✅ اتبع الخطوات بالترتيب
3. ✅ لا تتجاوز أي خطوة
4. ✅ احفظ مفتاح API بأمان

### للمتقدمين | For Advanced Users:
1. 🔧 عدّل `main.py` لتخصيص الردود
2. 🎨 عدّل `templates/index.html` للواجهة
3. ⚙️ استخدم متغيرات البيئة للتخصيص
4. 🚀 انشر على Heroku أو AWS

---

<div align="center">

**بالتوفيق! | Good Luck!** 🎉

إذا نجح معك المشروع، لا تنسى النجمة ⭐
If the project works for you, don't forget the star ⭐

</div>
