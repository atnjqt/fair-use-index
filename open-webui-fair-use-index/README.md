# Open-WebUI Local Runtime

Simple guide to getting your open source GPT client running locally for development purposes with PDFs pulled from Fair Use Index.

## Using Python

Step 1. Run the following locally on your computer with Python 3.11 installed

> See the official documentation here: (https://github.com/open-webui/open-webui?tab=readme-ov-file#how-to-install-)[https://github.com/open-webui/open-webui?tab=readme-ov-file#how-to-install-]

```bash
python3.11 -m venv .venv
source .venv/bin/activate
pip install open-webui

open-webui serve
```
- Open your browser to [http://localhost:8080](http://localhost:8080)

Step 2. Create an admin user for your local installation

Step 3. Add your OpenAI API key [https://platform.openai.com/api-keys](https://platform.openai.com/api-keys) to the admin dashboard [http://localhost:8080/admin/settings](http://localhost:8080/admin/settings)

Step 4. Create a **Knowledge** Collection and attach to a model by uploading all the PDFs via [http://localhost:8080/workspace/knowledge/create](http://localhost:8080/workspace/knowledge/create) from the [`pdfs`](../pdfs/) directory

Step 5. Proceed and use OpenAI model to ask questions about the Knowledge collection (see details here: [https://docs.openwebui.com/features/workspace/knowledge/](https://docs.openwebui.com/features/workspace/knowledge/))

> This is really just for demonstration purposes, and is beyond the scope of the paper I'm writing! It's an exmaple of how one might build on the Fair Use Index with AI tools to further promote the goal of the index being an educational resource that is beneficial to the public.

## Using Docker

- Can be simpler for step 1 to run with Docker

```bash
docker run -d -p 3000:8080 -e OPENAI_API_KEY=your_secret_key -v open-webui:/app/backend/data --name open-webui --restart always ghcr.io/open-webui/open-webui:main
```