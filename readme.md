# 🛡️ Phishing Detection Model ([FastText](https://github.com/facebookresearch/fastText))

A lightweight FastText-based model to classify domain names as **phishing** or **clean**.
It uses supervised learning with `wordNgrams=2` for better n-gram feature coverage.

## 🚀 Installation

### Option 1: Build FastText from Source (recommended)
```bash
git clone https://github.com/facebookresearch/fastText.git
cd fastText
mkdir build && cd build
cmake ..
make
```

### Option 2: Install via pip (limited support)
```bash
pip install fasttext
```
⚠️ Note: The pip version does not support all FastText features. Compiling from source is recommended.

## 📦 Usage

### Predict a single domain
```bash
echo "carreeffoursa.site" | ./fasttext predict phishing_model.bin -
```

### API with Docker
You can also run the model via Docker API:
```bash
# Run with Docker Hub image
docker run -p 8080:8080 mstfknn/phishing-fasttext:latest

# Or run with GHCR image
docker run -p 8080:8080 ghcr.io/mstfknn/phishing-fasttext:latest
```

Example request:
```bash
curl -X POST http://localhost:8080/predict \
  -H "Content-Type: application/json" \
  -d '{"domain": "carreeffoursa.site"}'
```

Example response:
```json
{
  "domain": "carreeffoursa.site",
  "label": "__label__phishing",
  "probability": 0.9734
}
```

## 🏋️ Training Info

- **Framework**: FastText
- **Labels**: `__label__phishing`, `__label__clean`
- **Epochs**: 10
- **Learning rate**: 0.5
- **wordNgrams**: 2

## 📊 Dataset

The model was trained on **[mstfknn/phishing-domain-list-2m-plus](https://huggingface.co/datasets/mstfknn/phishing-domain-list-2m-plus)**,
a dataset with **2,000,000 domain names** labeled as either phishing or clean.

## 📄 License

This project is licensed under the MIT License.

## 🔗 Links

- 🤗 [Hugging Face Model](https://huggingface.co/mstfknn/phishing-fasttext-model)
- 🐳 [Docker Hub Image](https://hub.docker.com/r/mstfknn/phishing-fasttext)
- 📦 [GitHub Container Registry (GHCR) Image](https://ghcr.io/mstfknn/phishing-fasttext)

## Star History

<a href="https://www.star-history.com/#mstfknn/phishing-fasttext-model&Date">
 <picture>
   <source media="(prefers-color-scheme: dark)" srcset="https://api.star-history.com/svg?repos=mstfknn/phishing-fasttext-model&type=Date&theme=dark" />
   <source media="(prefers-color-scheme: light)" srcset="https://api.star-history.com/svg?repos=mstfknn/phishing-fasttext-model&type=Date" />
   <img alt="Star History Chart" src="https://api.star-history.com/svg?repos=mstfknn/phishing-fasttext-model&type=Date" />
 </picture>
</a>
