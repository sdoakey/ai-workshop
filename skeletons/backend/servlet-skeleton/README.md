# Servlet Skeleton

Minimal backend starter using vanilla Java Servlet API (no additional web frameworks).

## Features

- Plain Java Servlet app using `jakarta.servlet`
- `GET /health` endpoint returning JSON health status
- Hot reload development server via embedded Jetty Maven plugin
- Docker development workflow with source-mounted live updates
- Production-ready WAR packaging for Tomcat runtime image

## Prerequisites

- Java 21+
- Maven 3.9+
- Docker + Docker Compose (optional, for container workflow)

## Quick Start

1. Install dependencies:

```bash
make install
```

2. Start local development server:

```bash
make dev
```

3. Verify the health endpoint:

```bash
curl http://localhost:8080/health
```

Expected response:

```json
{"status":"healthy","message":"Java Servlet REST API application is running"}
```

### Docker

1. Start the containerized development server:

```bash
docker compose up --build
```

2. Verify:

```bash
curl http://localhost:8080/health
```

## Project Structure

```text
servlet-skeleton/
├── Dockerfile
├── Makefile
├── README.md
├── docker-compose.yml
├── pom.xml
└── src/
    └── main/
        ├── java/com/example/skeleton/
        │   ├── HealthServlet.java      # GET /health endpoint
        │   └── StartupListener.java    # startup log + route extension placeholder
        └── webapp/WEB-INF/
            └── web.xml                 # servlet registration and route mapping
```

## Adding New Endpoints

- Add servlet classes in `src/main/java/com/example/skeleton/`
- Register new servlets and URL patterns in `src/main/webapp/WEB-INF/web.xml`
- Use `make dev` for automatic reload while developing

## Development Tips

- `make dev` uses `mvn jetty:run` and scans for changes every second
- Override default port with `PORT=9090 make dev`
- Build a WAR with `make build`
- Run packaged WAR with `make run`
