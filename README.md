# LAND OF LIGHT S

Access the OpenAI GPT-4 chat AI model using Python. Create your own LLM-driven AI server.

## Quickstart (local)

1. Clone the repo:

```bash
git clone https://github.com/BushraAlasmari09/OpenAI-Python-GPT-4.git
cd OpenAI-Python-GPT-4
git switch -c merge-projects
```

2. Create a virtual environment and install dependencies:

```bash
python -m venv .venv
source .venv/bin/activate  # macOS / Linux
.venv\\Scripts\\activate     # Windows
pip install -r requirements.txt
```

3. Create a .env file with the required secrets (do NOT commit):

```
OPENAI_API_KEY=your_openai_api_key
PORT=8000
```

4. Run the app (dev):

```bash
gunicorn app:app --bind 0.0.0.0:$PORT
# Or for quick dev
python app.py
```

## Deploy to Render

1. Ensure `render.yaml` is present in the repository root (it is).
2. In Render dashboard: New → Import from GitHub → select this repository.
3. Render will detect the blueprint and create the services defined in `render.yaml`.
4. Add secrets (OPENAI_API_KEY, DATABASE_URL, etc.) in the Render dashboard under Environment → Secrets.

## Project structure

- app.py / src/ - main application (make sure `app` WSGI object exists for gunicorn)
- scripts/ - cron scripts (e.g., scripts/daily.py)
- requirements.txt - Python dependencies
- render.yaml - Render blueprint

## Notes

- I chose Gunicorn as the production WSGI server and a daily cron job. If your app entrypoint name differs (not `app.py` or WSGI variable named `app`), update `render.yaml` startCommand accordingly.
- LICENSE: MIT by default (see LICENSE file).