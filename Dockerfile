FROM python:3.11-slim

# FastText için gerekli bağımlılıklar
RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Modeli Hugging Face'den indir
ADD https://huggingface.co/mstfknn/phishing-fasttext-model/resolve/main/phishing_model.bin /app/phishing_model.bin

COPY app.py .

ENV MODEL_PATH=/app/phishing_model.bin

EXPOSE 8080

CMD ["python", "app.py"]