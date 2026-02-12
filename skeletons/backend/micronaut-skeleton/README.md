# Micronaut Skeleton Application

A minimal Micronaut application template with a health check endpoint. This serves as a starting point for building Micronaut applications, ideal for demonstrating how to use GitHub Copilot to add new functionality.

## Features

- ✅ Micronaut 4.7.5 with Java 21
- ✅ Health check endpoint at `/health`
- ✅ Micronaut Management for production-ready features
- ✅ Maven wrapper (no Maven installation required)
- ✅ Docker and Docker Compose configuration with multi-stage build
- ✅ Fast startup and low memory footprint
- ✅ Ready to add endpoints using AI-assisted development

## Prerequisites

- Java 21 JDK (for local development)
- Docker and Docker Compose (for containerized deployment)

## Quick Start

### Local Development

1. **Install dependencies**
   ```bash
   cd skeletons/backend/micronaut-skeleton
   make install
   ```

2. **Run development server**
   ```bash
   make dev
   ```

3. **Verify it's working**
   ```bash
   curl http://localhost:8080/health
   ```
   
   Expected response:
   ```json
   {"status":"healthy","message":"Micronaut REST API application is running"}
   ```

### Docker

1. **Build and start with Docker Compose**
   ```bash
   docker compose up --build
   ```

2. **Verify it's working**
   ```bash
   curl http://localhost:8080/health
   ```

## Project Structure

```
micronaut-skeleton/
├── src/
│   ├── main/
│   │   ├── java/
│   │   │   └── com/example/skeleton/
│   │   │       ├── Application.java          # Main entry point
│   │   │       └── controller/
│   │   │           └── HealthController.java  # Health check endpoint
│   │   └── resources/
│   │       ├── application.yml               # Application configuration
│   │       └── logback.xml                   # Logging configuration
│   └── test/
│       └── java/
│           └── com/example/skeleton/
│               └── HealthControllerTest.java  # Health endpoint test
├── Dockerfile                                 # Multi-stage Docker build
├── docker-compose.yml                         # Container orchestration
├── Makefile                                   # Development commands
├── pom.xml                                    # Maven dependencies
└── README.md                                  # This file
```

## Adding New Endpoints

To add new REST endpoints to your Micronaut application:

1. **Create a new controller** in `src/main/java/com/example/skeleton/controller/`:

   ```java
   package com.example.skeleton.controller;

   import io.micronaut.http.annotation.Controller;
   import io.micronaut.http.annotation.Get;

   @Controller("/api")
   public class MyController {

       @Get("/hello")
       public String hello() {
           return "Hello, Micronaut!";
       }
   }
   ```

2. **Hot reload is enabled** — your changes will be reflected automatically when using `make dev`

3. **Test your endpoint**:
   ```bash
   curl http://localhost:8080/api/hello
   ```

## Available Make Commands

Run `make` or `make help` to see all available commands:

```
dev         Run application with auto-reload (port 8080)
build       Compile and package the application
test        Run unit tests with JUnit Jupiter
install     Download dependencies
clean       Remove build artifacts
package     Create executable JAR
run         Build and run the application
docker-build    Build Docker image
docker-run      Run application in Docker container
docker-stop     Stop Docker container
docker-logs     View Docker container logs
```

## Development Tips

### Hot Reload

When running `make dev`, Micronaut automatically reloads your application when you make changes to:
- Java source files
- Configuration files (application.yml)

### Running Tests

```bash
# Run all tests
make test

# Run specific test class
mvn test -Dtest=HealthControllerTest
```

### Building the JAR

```bash
# Build executable JAR
make build

# Run the JAR directly
java -jar target/skeleton-0.0.1-SNAPSHOT.jar
```

### Docker Development

```bash
# Build and start container
make docker-run

# View logs
make docker-logs

# Stop container
make docker-stop
```

## Micronaut Features

### Framework Benefits

- **Fast Startup**: Micronaut uses ahead-of-time (AOT) compilation for faster startup times
- **Low Memory Footprint**: Minimal reflection and runtime processing
- **Dependency Injection**: Compile-time DI with no runtime overhead
- **HTTP Client**: Built-in declarative HTTP clients
- **Testing**: First-class testing support with Micronaut Test

### Configuration

Application configuration is in `src/main/resources/application.yml`:

```yaml
micronaut:
  application:
    name: skeleton
  server:
    port: ${PORT:8080}  # Reads from PORT env variable or defaults to 8080
```

### Logging

Logging is configured in `src/main/resources/logback.xml`. The default log level is INFO, with DEBUG enabled for `com.example.skeleton` package.

## Troubleshooting

### Port Already in Use

If port 8080 is already in use:

```bash
# Change the port via environment variable
PORT=8081 make dev

# Or edit application.yml and change the default port
```

### Build Failures

```bash
# Clean and rebuild
make clean
make build
```

### Maven Wrapper Issues

If you encounter issues with the Maven wrapper:

```bash
# Make mvnw executable (Linux/Mac)
chmod +x mvnw

# Use Maven directly if installed
mvn clean package
```

## What's Next?

This skeleton gives you a foundation to build upon. Use GitHub Copilot to:

1. Add REST endpoints for your domain models
2. Integrate with databases using Micronaut Data
3. Add authentication and authorization
4. Implement business logic and services
5. Create comprehensive test suites

## Resources

- [Micronaut Documentation](https://docs.micronaut.io/)
- [Micronaut Guides](https://guides.micronaut.io/)
- [Micronaut GitHub](https://github.com/micronaut-projects/micronaut-core)

## License

This skeleton template is provided as-is for educational and development purposes.
