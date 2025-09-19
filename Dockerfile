FROM python:3.11-slim-bookworm

# Install FastText dependencies and clean up
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    cmake \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Download model from Hugging Face
ADD https://huggingface.co/mstfknn/phishing-fasttext-model/resolve/main/phishing_model.bin /app/phishing_model.bin

COPY app.py .

ENV MODEL_PATH=/app/phishing_model.bin

EXPOSE 8080

CMD ["python", "app.py"]