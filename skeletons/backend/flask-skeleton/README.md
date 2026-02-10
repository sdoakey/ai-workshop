# Flask Skeleton Application

A minimal Flask application template with a health check endpoint. This serves as a starting point for building Flask applications, ideal for demonstrating how to use GitHub Copilot to add new functionality.

## Features

- ✅ Flask application with factory pattern (`create_app`)
- ✅ Health check endpoint (`GET /health`)
- ✅ Docker and Docker Compose configuration
- ✅ Hot-reload enabled for development
- ✅ Gunicorn for production serving
- ✅ Makefile with common development targets
- ✅ Ready to add endpoints using AI-assisted development

## Prerequisites

- Python 3.11+ (for local development)
- Docker and Docker Compose (for containerized deployment)

## Quick Start

### Option 1: Local Development

```bash
# Navigate to the project directory
cd skeletons/backend/flask-skeleton

# Install dependencies
make install

# Start the development server with hot-reload
make dev
```

The application will start at `http://localhost:5000`

Verify it's running:

```bash
curl http://localhost:5000/health
```

### Option 2: Docker

```bash
# Navigate to the project directory
cd skeletons/backend/flask-skeleton

# Build and start the container
docker compose up --build
```

The application will start at `http://localhost:5000`

Verify it's running:

```bash
curl http://localhost:5000/health
```

## Project Structure

```
flask-skeleton/
├── app/
│   ├── __init__.py          # Package initialization
│   └── main.py              # Flask application entry point
├── .gitignore               # Git ignore rules
├── docker-compose.yml       # Docker Compose configuration
├── Dockerfile               # Docker image definition
├── Makefile                 # Development task runner
├── README.md                # This file
└── requirements.txt         # Python dependencies
```

## Adding New Endpoints

This skeleton application is ready for you to add endpoints. Use GitHub Copilot or other AI-assisted tools to:

1. Add new route handlers in `app/main.py`
2. Create additional modules in the `app/` directory (e.g., `app/routes/`, `app/models/`)
3. Implement business logic, data models, and services

### Example: Adding a Simple Endpoint

```python
@app.get("/items")
def get_items():
    return jsonify({"items": ["item1", "item2", "item3"]})

@app.post("/items")
def create_item():
    item = request.get_json()
    return jsonify({"message": "Item created", "item": item}), 201
```

## Development Tips

- **Hot reload**: The development server (`make dev`) runs with `debug=True`, so changes to Python files are automatically detected and the server restarts.
- **Docker hot reload**: The `docker-compose.yml` mounts the `app/` directory as a volume, so code changes are reflected immediately inside the container.
- **Production mode**: Use `make run` to start the application with Gunicorn for production-like serving.
- **Linting**: Run `make lint` to check for syntax errors.
- **Formatting**: Run `make format` to auto-format code with Black (install Black first: `pip install black`).

## Verifying the Application

```bash
# Health check
curl http://localhost:5000/health

# Expected response:
# {"message":"Flask REST API application is running","status":"healthy"}
```
