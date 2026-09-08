import os


class Config:
    APP_NAME = os.getenv("APP_NAME", "DevSecOps Flask Application")
    APP_ENV = os.getenv("APP_ENV", "development")
    PORT = int(os.getenv("PORT", "5000"))
