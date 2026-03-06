# Go REST API Skeleton Application

A minimal Go REST API application template with no endpoints defined. This serves as a starting point for building Go REST APIs, ideal for demonstrating how to use GitHub Copilot to add new functionality.

## Features

- ✅ Go REST API application structure
- ✅ Chi router with standard middleware (logging, recovery, request ID)
- ✅ Health check endpoint included
- ✅ Multi-stage Docker build for small images
- ✅ Docker and Docker Compose configuration
- ✅ Ready to add endpoints using AI-assisted development

## Prerequisites

- Go 1.25+ (for local development)
- Docker and Docker Compose (for containerized deployment)

## Setup and Installation

### Option 1: Local Development

#### 1. Install Dependencies

```bash
# Navigate to the project directory
cd skeletons/go-skeleton

# Download module dependencies
go mod download
```

#### 2. Run the Application

```bash
# Start the development server
go run ./cmd/server

# Or use Make
make dev
```

The application will start at `http://localhost:8080`

#### 3. Build the Binary

```bash
# Build the application
make build

# Run the compiled binary
./server
```

### Option 2: Docker Deployment

#### 1. Build and Run with Docker Compose

```bash
# Navigate to the project directory
cd skeletons/go-skeleton

# Build and start the container
docker-compose up --build

# Or run in detached mode
docker-compose up -d
```

The application will start at `http://localhost:8080`

#### 2. Stop the Container

```bash
docker-compose down
```

## Project Structure

```
go-skeleton/
├── cmd/
│   └── server/
│       └── main.go              # Application entry point
├── internal/
│   ├── handlers/
│   │   └── health.go            # Health check handler
│   └── router/
│       └── router.go            # Router and middleware configuration
├── docker-compose.yml           # Docker Compose configuration
├── Dockerfile                   # Multi-stage Docker image definition
├── go.mod                       # Go module definition
├── go.sum                       # Go module checksum
├── Makefile                     # Build automation
└── README.md                    # This file
```

## Adding New Endpoints

This skeleton application is ready for you to add endpoints. Use GitHub Copilot or other AI-assisted tools to:

1. Add new handlers in `internal/handlers/`
2. Register routes in `internal/router/router.go`
3. Create models, services, and middleware in `internal/`

### Example: Adding a Simple Endpoint

```go
// internal/handlers/items.go
package handlers

import (
    "encoding/json"
    "net/http"
)

func ListItems(w http.ResponseWriter, r *http.Request) {
    items := []string{"item1", "item2", "item3"}
    w.Header().Set("Content-Type", "application/json")
    json.NewEncoder(w).Encode(map[string]interface{}{"items": items})
}
```

Then register it in `internal/router/router.go`:

```go
r.Route("/api/v1", func(r chi.Router) {
    r.Get("/items", handlers.ListItems)
})
```

## Verifying the Application

Once the application is running, test the health check endpoint:

```bash
curl http://localhost:8080/health
```

Expected response:
```json
{
  "status": "healthy",
  "message": "Go REST API application is running"
}
```

## Development Tips

- **Standard Layout**: The project follows the [Go Standard Project Layout](https://github.com/golang-standards/project-layout) with `cmd/` for entry points and `internal/` for private application code
- **Chi Router**: [Chi](https://github.com/go-chi/chi) is a lightweight, composable HTTP router that is idiomatic Go and fully compatible with `net/http`
- **Middleware**: Logger, Recoverer, RequestID, and RealIP middleware are pre-configured
- **Static Typing**: Go's type system catches errors at compile time — leverage structs for request/response models

## Next Steps

1. Define your data models as Go structs
2. Create handler functions for your endpoints
3. Register routes in the router
4. Add database integration (if needed)
5. Implement authentication and authorization middleware
6. Add comprehensive error handling
7. Write tests for your handlers

## License

This is a template/example project for educational purposes.
