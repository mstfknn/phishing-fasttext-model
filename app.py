import fasttext
from flask import Flask, request, jsonify
import os

app = Flask(__name__)

# Model yolunu environment variable'dan al
MODEL_PATH = os.getenv("MODEL_PATH", "phishing_model.bin")
model = fasttext.load_model(MODEL_PATH)

@app.route("/predict", methods=["POST"])
def predict():
    data = request.json
    domain = data.get("domain", "")
    if not domain:
        return jsonify({"error": "No domain provided"}), 400
    
    label, prob = model.predict(domain, k=1)
    return jsonify({
        "domain": domain,
        "label": label[0],
        "probability": float(prob[0])
    })

@app.route("/", methods=["GET"])
def home():
    return "Phishing Detection FastText Model API", 200

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080)