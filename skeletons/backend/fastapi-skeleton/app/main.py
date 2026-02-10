"""
FastAPI Application Entry Point

This is a minimal FastAPI application with a health check endpoint.
Use this as a starting point to add your own endpoints and functionality.
"""

from fastapi import FastAPI
from contextlib import asynccontextmanager


# Application lifespan event handler
@asynccontextmanager
async def lifespan(app: FastAPI):
    """
    Manage application lifespan events.
    Code before yield runs on startup, code after yield runs on shutdown.
    """
    # Startup
    print("🚀 FastAPI application starting up...")
    yield
    # Shutdown
    print("👋 FastAPI application shutting down...")


# Initialize FastAPI application
app = FastAPI(
    title="FastAPI Skeleton",
    description="A minimal FastAPI application ready for endpoint development",
    version="1.0.0",
    lifespan=lifespan
)


@app.get("/health")
async def health_check():
    """Returns the current health status of the application."""
    return {
        "status": "healthy",
        "message": "FastAPI REST API application is running",
    }