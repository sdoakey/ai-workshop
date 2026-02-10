---
name: create-skeleton
description: Create a new skeleton project in the specified language choice
---

# Create Skeleton Project

Create a new skeleton project for a chosen language/framework. The skeleton must be a minimal, ready-to-run application that follows the established conventions in `skeletons/backend/` or `skeletons/frontend/`.

## Choosing a Location

- **Backend skeletons** go in `skeletons/backend/<name>-skeleton/`
- **Frontend skeletons** go in `skeletons/frontend/<name>-skeleton/`

## Required Files

Every skeleton MUST include the following files:

### 1. Application Entry Point

**Backends** — A minimal HTTP server with a single `GET /health` endpoint that returns JSON:
```json
{ "status": "healthy", "message": "<Framework> REST API application is running" }
```
- Use the framework's idiomatic health check mechanism when one exists (e.g. Spring Boot Actuator at `/actuator/health`, Quarkus SmallRye Health at `/q/health/ready`). Otherwise, implement a simple handler at `GET /health`.
- Include a `// TODO: Add your routes here` placeholder comment where new routes would be added.
- Read the port from an environment variable with a sensible default (e.g. `PORT`).
- Log a startup message: `🚀 <Framework> server starting on port <port>...`

**Frontends** — A minimal UI that renders:
- A header with the application name and a subtitle like "Built with <Framework> + TypeScript".
- A **Welcome** component that accepts a `message` prop and contains an interactive **click counter** button using the framework's idiomatic state primitive (React `useState`, Vue `ref`/`computed`, Angular `signal`, etc.).
  - The button text: `"You clicked N time(s)"`.
  - A conditional message: `"Keep clicking..."` when count < 10, `"Wow, you really like clicking!"` when count >= 10.
- A "Ready to Build" info card.
- A footer noting that live reload / HMR is available.
- Global CSS with CSS custom properties for theming, using the framework's brand color as the primary color. Include dark mode support via `@media (prefers-color-scheme: dark)`.

### 2. Makefile

Every Makefile MUST include at least these targets:

| Target    | Purpose |
|-----------|---------|
| `dev`     | **Required.** Launch a local dev server with hot-reload/watch mode. This is the primary entry point for developers. |
| `build`   | Compile / bundle the project for production. |
| `test`    | Run tests. If no test framework is configured yet, print a helpful message and `exit 1`. |
| `install` | Install dependencies (npm install, pip install, go mod download, mvn dependency:resolve, etc.). |
| `clean`   | Remove build artifacts, dependencies, and caches. |

Additional recommended targets: `lint`, `format`, `run` (build then execute).

Makefile conventions:
- Set `.DEFAULT_GOAL := help`.
- Include a `help` target that auto-documents targets using: `@awk 'BEGIN {FS = ":.*##"} /^[a-zA-Z_-]+:.*##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 }' $(MAKEFILE_LIST)`.
- Add `## description` comments to each target for self-documenting help output.
- Declare `.PHONY` for all non-file targets.

### 3. README.md

Follow this structure:
1. **Title & one-line description** — what the skeleton is and which framework/language it uses.
2. **Features** — bullet list of what's included (health endpoint or click counter, hot reload, Docker support, etc.).
3. **Prerequisites** — runtime/toolchain requirements with minimum versions.
4. **Quick Start** — numbered steps for both:
   - **Local development**: install deps → `make dev` → verify endpoint/URL.
   - **Docker**: `docker compose up --build` → verify.
5. **Project Structure** — ASCII tree of the directory layout with short descriptions.
6. **Adding New Endpoints / Components** — brief guidance on where to add code.
7. **Development Tips** — hot reload behavior, useful commands.

### 4. Dockerfile

- Use an appropriate slim/alpine base image for the language.
- For compiled languages (Go, Rust, Java), prefer **multi-stage builds** to keep the runtime image small.
- Expose the application port.
- The container should run the application in a dev-friendly mode (hot reload where possible).

### 5. docker-compose.yml

- Define a single service for the application.
- Map the default port to the host.
- Mount source directories as volumes for live-reload during development.
- Set `restart: unless-stopped`.
- Set any needed environment variables (PORT, log level, etc.).

### 6. .gitignore

Include standard ignores for the language/framework (build output, dependencies, IDE files, OS files).

## Conventions

- Use **TypeScript** for all Node.js-based projects (both backend and frontend).
- Use the **latest stable/LTS** version of the language runtime.
- Keep dependencies minimal — only include what is needed for the skeleton to run.
- Structure source code idiomatically for the framework:
  - Express: `src/server.ts`, `src/routes/`, `src/handlers/`
  - FastAPI: `app/main.py`
  - Go: `cmd/server/main.go`, `internal/handlers/`, `internal/router/`
  - Quarkus/Spring Boot: `src/main/java/com/example/skeleton/`, `src/main/resources/`
  - Rust: `src/main.rs`, `src/routes.rs`, `src/handlers.rs`
  - React/Vue: `src/components/`, `src/styles/`, `src/main.tsx`
  - Angular: `src/app/`, `src/app/components/`
- Do NOT include databases, authentication, or any external service dependencies — skeletons are standalone.
- The `make dev` target must work immediately after `make install` with no additional configuration.

## Port Conventions

Use these default ports to avoid collisions when running multiple skeletons:

| Type     | Range       |
|----------|-------------|
| Express  | 3000        |
| FastAPI  | 8000        |
| Go / Rust / Java backends | 8080 |
| Angular  | 4200        |
| React    | 5173        |
| Vue      | 5174        |

For new frameworks, pick an unused port that is conventional for that ecosystem.