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
        host="0.0.0.0",  # nosemgrep: python.flask.security.audit.app-run-param-config.avoid_app_run_with_bad_host
        port=app.config["PORT"]
    )
