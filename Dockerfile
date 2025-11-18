FROM python:3.11-slim

RUN apt-get update && apt-get install -y \
    wget gnupg ca-certificates fonts-liberation libasound2 \
    libnss3 libatk1.0-0 libcups2 libxkbcommon0 libxcomposite1 \
    libxrandr2 libxdamage1 libxfixes3 libxext6 libxshmfence1 \
    libglib2.0-0 libdrm2 libx11-6 libxcb1 libx11-xcb1 libatk-bridge2.0-0 \
    libgtk-3-0 libgbm1 libnotify4 libxss1 xvfb \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY . /app

RUN pip install --no-cache-dir -r requirements.txt

RUN playwright install chromium

EXPOSE 10000

CMD ["python", "main.py"]
