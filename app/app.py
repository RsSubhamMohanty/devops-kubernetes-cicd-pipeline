from flask import Flask
from config import Config

app = Flask(__name__)
app.config.from_object(Config)


@app.route("/")
def home():
    return f"{app.config['APP_NAME']} is running"


@app.route("/health")
def health():
    return "healthy"


@app.route("/ready")
def ready():
    return "ready"


if __name__ == "__main__":
    app.run(
        host="0.0.0.0",
        port=app.config["PORT"]
    )
