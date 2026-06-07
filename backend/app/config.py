"""Configuration settings using Pydantic BaseSettings."""

from pydantic import BaseSettings, PostgresDsn, RedisDsn

class Settings(BaseSettings):
    PROJECT_NAME: str = "Airline Ops API"
    VERSION: str = "0.1.0"
    DATABASE_URL: PostgresDsn
    REDIS_URL: RedisDsn
    RABBITMQ_URL: str

    class Config:
        env_file = ".env"
        env_file_encoding = "utf-8"

settings = Settings()
