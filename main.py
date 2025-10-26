
from flask import Flask, render_template, request, jsonify
import os
import json
import requests
from datetime import datetime, timedelta
from openai import OpenAI
import random

app = Flask(__name__)

# إعداد OpenAI
client = OpenAI(api_key=os.environ.get('OPENAI_API_KEY', ''))

# بيانات الحملات
CAMPAIGNS_FILE = 'campaigns.json'

# معلومات أرض النور للبوت
ARD_ALNOOR_INFO = """
أنت مرشد سياحي ذكي ومسوق محترف تعمل لصالح "أرض النور" في الرياض.

معلومات عن أرض النور:
- موقع سياحي فريد في قلب الرياض
- يجمع بين التراث السعودي الأصيل والحداثة
- يقع بالقرب من أبراج كافد الشهيرة
- يوفر تجربة سياحية صحراوية أصيلة
- يحتوي على مطاعم تراثية ومقاهي
- مناسب للعائلات والشباب
- يقدم جولات سياحية وفعاليات ثقافية

استخدم فلسفة فيليب كوتلر في التسويق:
- ركز على القيمة المقدمة للزائر
- اصنع تجربة عاطفية لا تُنسى
- استخدم أسلوب storytelling جذاب
- كن أصيلاً ومتحمساً
- اجعل العميل يشعر بأنه جزء من القصة

أسلوبك:
- ودود ومرحب
- متحمس للسياحة السعودية
- يستخدم أمثلة حية وقصص
- يجيب بشكل مختصر وجذاب
- يشجع على الزيارة
"""

def load_campaigns():
    """تحميل الحملات من الملف"""
    try:
        if os.path.exists(CAMPAIGNS_FILE):
            with open(CAMPAIGNS_FILE, 'r', encoding='utf-8') as f:
                return json.load(f)
        return []
    except:
        return []

def save_campaigns(campaigns):
    """حفظ الحملات في الملف"""
    with open(CAMPAIGNS_FILE, 'w', encoding='utf-8') as f:
        json.dump(campaigns, f, ensure_ascii=False, indent=2)

def generate_marketing_content(topic, platform):
    """توليد محتوى تسويقي ذكي باستخدام GPT"""
    try:
        prompt = f"""أنت مسوق محترف تعمل لصالح 'أرض النور' في الرياض.
اصنع منشور جذاب لـ {platform} عن: {topic}

المنشور يجب أن:
- يكون مشوقاً وجذاباً
- يستخدم emojis مناسبة
- يدعو للزيارة
- يبرز التجربة الفريدة
- لا يتجاوز 150 كلمة
- يحتوي على هاشتاجات مناسبة
"""
        
        response = client.chat.completions.create(
            model="gpt-4o-mini",
            messages=[
                {"role": "system", "content": ARD_ALNOOR_INFO},
                {"role": "user", "content": prompt}
            ],
            temperature=0.7
        )
        
        return response.choices[0].message.content
    except Exception as e:
        return f"✨ اكتشف أرض النور في قلب الرياض! تجربة سياحية فريدة بين الصحراء وأبراج كافد 🏜️🌆 #الرياض #السياحة_السعودية #ارض_النور"

def post_to_instagram(content, api_key):
    """نشر على Instagram باستخدام RapidAPI"""
    try:
        url = "https://instagram120.p.rapidapi.com/api/instagram/posts"
        headers = {
            'Content-Type': 'application/json',
            'x-rapidapi-host': 'instagram120.p.rapidapi.com',
            'x-rapidapi-key': api_key
        }
        data = {
            "username": "ard_alnoor_riyadh",
            "caption": content
        }
        
        response = requests.post(url, json=data, headers=headers, timeout=10)
        return {"success": True, "platform": "Instagram", "response": response.json()}
    except Exception as e:
        return {"success": False, "platform": "Instagram", "error": str(e)}

def post_to_tiktok(content, api_key):
    """نشر على TikTok باستخدام RapidAPI"""
    try:
        url = "https://tiktok-api23.p.rapidapi.com/api/post"
        headers = {
            'Content-Type': 'application/json',
            'x-rapidapi-host': 'tiktok-api23.p.rapidapi.com',
            'x-rapidapi-key': api_key
        }
        data = {
            "description": content,
            "hashtags": ["الرياض", "السياحة", "ارض_النور", "السعودية"]
        }
        
        response = requests.post(url, json=data, headers=headers, timeout=10)
        return {"success": True, "platform": "TikTok", "response": response.json()}
    except Exception as e:
        return {"success": False, "platform": "TikTok", "error": str(e)}

@app.route('/')
def index():
    """الصفحة الرئيسية"""
    return render_template('index.html')

@app.route('/api/chat', methods=['POST'])
def chat():
    """معالجة محادثات البوت"""
    try:
        data = request.json
        user_message = data.get('message', '')
        
        # استخدام GPT للرد بذكاء
        response = client.chat.completions.create(
            model="gpt-4o-mini",
            messages=[
                {"role": "system", "content": ARD_ALNOOR_INFO},
                {"role": "user", "content": user_message}
            ],
            temperature=0.2
        )
        
        bot_reply = response.choices[0].message.content
        
        return jsonify({
            "success": True,
            "reply": bot_reply
        })
    except Exception as e:
        return jsonify({
            "success": False,
            "reply": "مرحباً! 🌟 أنا مرشدك السياحي في أرض النور. كيف يمكنني مساعدتك اليوم؟"
        })

@app.route('/api/campaigns', methods=['GET'])
def get_campaigns():
    """الحصول على جميع الحملات"""
    campaigns = load_campaigns()
    return jsonify(campaigns)

@app.route('/api/campaigns', methods=['POST'])
def create_campaign():
    """إنشاء حملة جديدة"""
    try:
        data = request.json
        campaigns = load_campaigns()
        
        # توليد محتوى ذكي
        topic = data.get('topic', 'زيارة أرض النور')
        platforms = data.get('platforms', ['Instagram', 'TikTok'])
        
        campaign = {
            "id": f"camp_{datetime.now().strftime('%Y%m%d_%H%M%S')}",
            "topic": topic,
            "platforms": platforms,
            "content": {},
            "status": "draft",
            "created_at": datetime.now().isoformat()
        }
        
        # توليد محتوى لكل منصة
        for platform in platforms:
            campaign['content'][platform] = generate_marketing_content(topic, platform)
        
        campaigns.append(campaign)
        save_campaigns(campaigns)
        
        return jsonify({
            "success": True,
            "campaign": campaign
        })
    except Exception as e:
        return jsonify({
            "success": False,
            "error": str(e)
        }), 500

@app.route('/api/campaigns/<campaign_id>/publish', methods=['POST'])
def publish_campaign(campaign_id):
    """نشر حملة على المنصات"""
    try:
        campaigns = load_campaigns()
        campaign = next((c for c in campaigns if c['id'] == campaign_id), None)
        
        if not campaign:
            return jsonify({"success": False, "error": "Campaign not found"}), 404
        
        # مفاتيح API
        instagram_key = "25e6791cc7mshc1cdc96ef49b330p1ffd3fjsn7b72594aab32"
        tiktok_key = "25e6791cc7mshc1cdc96ef49b330p1ffd3fjsn7b72594aab32"
        
        results = {}
        
        # النشر على كل منصة
        if 'Instagram' in campaign['platforms']:
            content = campaign['content'].get('Instagram', '')
            results['Instagram'] = post_to_instagram(content, instagram_key)
        
        if 'TikTok' in campaign['platforms']:
            content = campaign['content'].get('TikTok', '')
            results['TikTok'] = post_to_tiktok(content, tiktok_key)
        
        # تحديث حالة الحملة
        campaign['status'] = 'published'
        campaign['published_at'] = datetime.now().isoformat()
        campaign['results'] = results
        
        save_campaigns(campaigns)
        
        return jsonify({
            "success": True,
            "results": results
        })
    except Exception as e:
        return jsonify({
            "success": False,
            "error": str(e)
        }), 500

@app.route('/api/generate-content', methods=['POST'])
def generate_content():
    """توليد محتوى تسويقي فوري"""
    try:
        data = request.json
        topic = data.get('topic', 'أرض النور')
        platform = data.get('platform', 'Instagram')
        
        content = generate_marketing_content(topic, platform)
        
        return jsonify({
            "success": True,
            "content": content
        })
    except Exception as e:
        return jsonify({
            "success": False,
            "error": str(e)
        }), 500

if __name__ == '__main__':
    # إنشاء ملف الحملات إذا لم يكن موجوداً
    if not os.path.exists(CAMPAIGNS_FILE):
        save_campaigns([])
    
    # تشغيل التطبيق
    app.run(host='0.0.0.0', port=5000, debug=True)
