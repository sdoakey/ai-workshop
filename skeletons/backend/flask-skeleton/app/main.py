"""
Flask Application Entry Point

This is a minimal Flask application with a health check endpoint.
Use this as a starting point to add your own endpoints and functionality.
"""

import os

from flask import Flask, jsonify


def create_app():
    """
    Application factory pattern.
    Creates and configures the Flask application.
    """
    app = Flask(__name__)

    @app.get("/health")
    def health_check():
        """Returns the current health status of the application."""
        return jsonify({
            "status": "healthy",
            "message": "Flask REST API application is running",
        })

    # TODO: Add your routes here

    return app


if __name__ == "__main__":
    port = int(os.environ.get("PORT", 5000))
    print(f"🚀 Flask server starting on port {port}...")
    app = create_app()
    app.run(host="0.0.0.0", port=port, debug=True)
