"""FastAPI application entry point."""

from fastapi import FastAPI
from .api.routes import router as api_router
from .config import settings

app = FastAPI(
    title=settings.PROJECT_NAME,
    description="Airline Operations API",
    version=settings.VERSION,
)

app.include_router(api_router, prefix="/api")

# Health check endpoint
@app.get("/health")
async def health_check():
    return {"status": "ok"}
