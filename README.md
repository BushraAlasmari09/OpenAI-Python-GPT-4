# 🌟 أرض النور - مشروع OpenAI Python GPT-4
# Ard AlNoor - OpenAI Python GPT-4 Project

نظام ذكاء اصطناعي متكامل للتسويق السياحي باستخدام GPT-4 | Complete AI-powered tourism marketing system using GPT-4

[![Python](https://img.shields.io/badge/Python-3.11+-blue.svg)](https://www.python.org/)
[![Flask](https://img.shields.io/badge/Flask-3.0+-green.svg)](https://flask.palletsprojects.com/)
[![OpenAI](https://img.shields.io/badge/OpenAI-GPT--4-orange.svg)](https://openai.com/)
[![License](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

---

## 📋 المحتويات | Table of Contents

- [نظرة عامة | Overview](#نظرة-عامة--overview)
- [المميزات | Features](#المميزات--features)
- [المتطلبات | Requirements](#المتطلبات--requirements)
- [التثبيت والتشغيل | Installation & Running](#التثبيت-والتشغيل--installation--running)
- [استخدام PowerShell](#استخدام-powershell)
- [البنية | Structure](#البنية--structure)
- [الاستخدام | Usage](#الاستخدام--usage)
- [المساهمة | Contributing](#المساهمة--contributing)

---

## 🎯 نظرة عامة | Overview

### العربية

مشروع متكامل يستخدم تقنية GPT-4 من OpenAI لإنشاء نظام تسويق سياحي ذكي لـ "أرض النور" في الرياض. يوفر النظام:
- بوت محادثة ذكي للإجابة على استفسارات الزوار
- توليد محتوى تسويقي إبداعي للمنصات الاجتماعية
- إدارة الحملات التسويقية
- النشر التلقائي على Instagram و TikTok

### English

A comprehensive project using OpenAI's GPT-4 to create an intelligent tourism marketing system for "Ard AlNoor" in Riyadh. The system provides:
- Smart chatbot for answering visitor queries
- Creative marketing content generation for social media
- Marketing campaign management
- Automatic publishing to Instagram and TikTok

---

## ✨ المميزات | Features

### العربية
- 🤖 **بوت محادثة ذكي**: يجيب على أسئلة الزوار بذكاء باستخدام GPT-4
- 📱 **توليد محتوى تسويقي**: إنشاء منشورات إبداعية للمنصات الاجتماعية
- 📊 **إدارة الحملات**: تخطيط وتنفيذ الحملات التسويقية
- 🚀 **نشر تلقائي**: النشر المباشر على Instagram و TikTok
- 🎨 **واجهة مستخدم جميلة**: تصميم عصري ومتجاوب
- 🌐 **دعم اللغة العربية**: واجهة وردود كاملة بالعربية

### English
- 🤖 **Smart Chatbot**: Answers visitor questions intelligently using GPT-4
- 📱 **Marketing Content Generation**: Creates creative posts for social media
- 📊 **Campaign Management**: Plans and executes marketing campaigns
- 🚀 **Auto Publishing**: Direct posting to Instagram and TikTok
- 🎨 **Beautiful UI**: Modern and responsive design
- 🌐 **Arabic Support**: Full Arabic interface and responses

---

## 🔧 المتطلبات | Requirements

### العربية
- Python 3.11 أو أحدث
- مفتاح OpenAI API (مطلوب)
- مفاتيح RapidAPI (اختياري - للنشر على المنصات)
- نظام Windows / Linux / macOS

### English
- Python 3.11 or higher
- OpenAI API Key (required)
- RapidAPI Keys (optional - for platform publishing)
- Windows / Linux / macOS

---

## 🚀 التثبيت والتشغيل | Installation & Running

### استخدام PowerShell

#### الطريقة السريعة | Quick Method

```powershell
# 1. تحميل أو استنساخ المشروع
# Download or clone the project
git clone https://github.com/BushraAlasmari09/OpenAI-Python-GPT-4.git
cd OpenAI-Python-GPT-4

# 2. تشغيل سكريبت الإعداد
# Run setup script
.\setup.ps1

# 3. تحرير ملف .env وإضافة مفتاح OpenAI API
# Edit .env file and add your OpenAI API key
notepad .env

# 4. تشغيل التطبيق
# Run the application
.\run.ps1
```

#### الخطوات التفصيلية | Detailed Steps

**1. تحميل المشروع | Download Project**

```powershell
# استنساخ المشروع من GitHub
# Clone from GitHub
git clone https://github.com/BushraAlasmari09/OpenAI-Python-GPT-4.git

# الانتقال إلى مجلد المشروع
# Navigate to project folder
cd OpenAI-Python-GPT-4
```

**2. الإعداد الأولي | Initial Setup**

```powershell
# تشغيل سكريبت الإعداد الذي سيقوم بـ:
# Run setup script which will:
# - التحقق من Python
# - إنشاء بيئة افتراضية
# - تثبيت المكتبات المطلوبة
# - إنشاء ملفات التكوين

.\setup.ps1
```

**3. تكوين المشروع | Configure Project**

```powershell
# نسخ ملف المثال وتحريره
# Copy example file and edit it
Copy-Item .env.example .env
notepad .env

# أضف مفتاح OpenAI API الخاص بك:
# Add your OpenAI API key:
# OPENAI_API_KEY=sk-your-key-here
```

**4. تشغيل التطبيق | Run Application**

```powershell
# تشغيل التطبيق
# Run the application
.\run.ps1

# التطبيق سيعمل على:
# Application will run on:
# http://localhost:5000
```

**5. إيقاف التطبيق | Stop Application**

```
اضغط Ctrl+C في نافذة PowerShell
Press Ctrl+C in PowerShell window
```

### الطريقة اليدوية | Manual Method

```powershell
# 1. إنشاء بيئة افتراضية
# Create virtual environment
python -m venv venv

# 2. تفعيل البيئة الافتراضية
# Activate virtual environment
.\venv\Scripts\Activate.ps1

# 3. تثبيت المكتبات
# Install dependencies
pip install -r requirements.txt

# 4. إعداد ملف .env
# Setup .env file
Copy-Item .env.example .env
notepad .env

# 5. تشغيل التطبيق
# Run application
python main.py
```

---

## 📁 البنية | Structure

```
OpenAI-Python-GPT-4/
│
├── main.py                 # الملف الرئيسي | Main application file
├── setup.ps1              # سكريبت الإعداد | Setup script
├── run.ps1                # سكريبت التشغيل | Run script
├── requirements.txt       # المكتبات المطلوبة | Required packages
├── .env.example          # مثال متغيرات البيئة | Environment variables example
├── .env                  # متغيرات البيئة (يُنشأ تلقائياً) | Environment variables (auto-created)
├── campaigns.json        # بيانات الحملات (يُنشأ تلقائياً) | Campaign data (auto-created)
├── pyproject.toml        # تكوين Poetry | Poetry configuration
├── poetry.lock           # ملف قفل Poetry | Poetry lock file
│
├── templates/            # قوالب HTML | HTML templates
│   └── index.html       # الواجهة الرئيسية | Main interface
│
└── venv/                # البيئة الافتراضية | Virtual environment (auto-created)
```

---

## 💡 الاستخدام | Usage

### العربية

1. **البوت الذكي**: افتح المتصفح على `http://localhost:5000` واستخدم البوت للإجابة على الأسئلة
2. **توليد محتوى**: استخدم قسم "توليد محتوى" لإنشاء منشورات تسويقية
3. **الحملات**: أنشئ وأدر حملاتك التسويقية من قسم "الحملات"
4. **النشر**: فعّل النشر التلقائي بإضافة مفاتيح RapidAPI

### English

1. **Smart Bot**: Open browser at `http://localhost:5000` and use the bot to answer questions
2. **Content Generation**: Use "Generate Content" section to create marketing posts
3. **Campaigns**: Create and manage your marketing campaigns from "Campaigns" section
4. **Publishing**: Enable auto-publishing by adding RapidAPI keys

---

## 🔑 الحصول على مفاتيح API | Getting API Keys

### OpenAI API Key (مطلوب | Required)

1. افتح | Visit: https://platform.openai.com/
2. سجل دخول أو أنشئ حساب | Sign in or create account
3. اذهب إلى API Keys | Go to API Keys
4. أنشئ مفتاح جديد | Create new key
5. انسخ المفتاح وأضفه في ملف `.env`

### RapidAPI Keys (اختياري | Optional)

للنشر على Instagram و TikTok:
For publishing to Instagram and TikTok:

1. افتح | Visit: https://rapidapi.com/
2. سجل حساب | Sign up
3. ابحث عن | Search for:
   - Instagram API
   - TikTok API
4. اشترك في الخطة المناسبة | Subscribe to suitable plan
5. انسخ المفاتيح وأضفها في `.env`

---

## 🐛 حل المشاكل | Troubleshooting

### العربية

**مشكلة: Python غير معروف**
- تأكد من تثبيت Python وإضافته إلى PATH
- أعد تشغيل PowerShell بعد التثبيت

**مشكلة: فشل تفعيل البيئة الافتراضية**
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

**مشكلة: خطأ في مفتاح OpenAI**
- تحقق من صحة المفتاح في ملف `.env`
- تأكد من عدم وجود مسافات زائدة

**مشكلة: المنفذ 5000 مستخدم**
```powershell
# تغيير المنفذ في ملف .env
PORT=8000
```

### English

**Issue: Python not found**
- Make sure Python is installed and added to PATH
- Restart PowerShell after installation

**Issue: Failed to activate virtual environment**
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

**Issue: OpenAI API key error**
- Check if key is correct in `.env` file
- Make sure there are no extra spaces

**Issue: Port 5000 in use**
```powershell
# Change port in .env file
PORT=8000
```

---

## 📝 ملاحظات مهمة | Important Notes

### العربية

- ⚠️ **لا تشارك مفتاح OpenAI API**: احتفظ به سرياً
- 💰 **التكلفة**: استخدام GPT-4 له تكلفة، راقب استخدامك
- 🔒 **الأمان**: لا ترفع ملف `.env` إلى GitHub
- 📊 **الاختبار**: جرب التطبيق في بيئة التطوير أولاً

### English

- ⚠️ **Don't share OpenAI API key**: Keep it secret
- 💰 **Cost**: GPT-4 usage has costs, monitor your usage
- 🔒 **Security**: Don't upload `.env` file to GitHub
- 📊 **Testing**: Try the app in development environment first

---

## 🤝 المساهمة | Contributing

### العربية
نرحب بالمساهمات! يرجى:
1. عمل Fork للمشروع
2. إنشاء فرع جديد للميزة
3. إرسال Pull Request

### English
Contributions welcome! Please:
1. Fork the project
2. Create a feature branch
3. Submit a Pull Request

---

## 📞 الدعم | Support

### العربية
- 📧 البريد الإلكتروني | Email: support@example.com
- 🐛 المشاكل | Issues: [GitHub Issues](https://github.com/BushraAlasmari09/OpenAI-Python-GPT-4/issues)
- 📖 التوثيق | Documentation: [Wiki](https://github.com/BushraAlasmari09/OpenAI-Python-GPT-4/wiki)

### English
- 📧 Email: support@example.com
- 🐛 Issues: [GitHub Issues](https://github.com/BushraAlasmari09/OpenAI-Python-GPT-4/issues)
- 📖 Documentation: [Wiki](https://github.com/BushraAlasmari09/OpenAI-Python-GPT-4/wiki)

---

## 📄 الترخيص | License

MIT License - راجع ملف LICENSE للتفاصيل
MIT License - See LICENSE file for details

---

## 🌟 شكر خاص | Special Thanks

- OpenAI لتوفير GPT-4
- Flask لإطار العمل الممتاز
- RapidAPI لخدمات المنصات الاجتماعية

---

<div align="center">

**صُنع بـ ❤️ في الرياض | Made with ❤️ in Riyadh**

⭐ إذا أعجبك المشروع، لا تنسى النجمة!
If you like this project, don't forget to star it! ⭐

</div>
