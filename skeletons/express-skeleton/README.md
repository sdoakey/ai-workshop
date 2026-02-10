# Express.js Skeleton Application

A minimal Express.js application built with TypeScript. This serves as a starting point for building Express.js REST APIs, ideal for demonstrating how to use AI-assisted development tools to add new functionality.

## Features

- ✅ Express.js with TypeScript
- ✅ Health check endpoint included
- ✅ Hot-reload enabled for development (tsx watch)
- ✅ Docker and Docker Compose configuration
- ✅ Ready to add endpoints using AI-assisted development

## Prerequisites

- Node.js 20+ (for local development)
- npm or yarn package manager
- Docker and Docker Compose (for containerized deployment)

## Setup and Installation

### Option 1: Local Development

#### 1. Navigate to Project Directory

```bash
cd skeletons/express-skeleton
```

#### 2. Install Dependencies

```bash
npm install
```

#### 3. Run the Development Server

```bash
npm run dev

# Or use Make
make dev
```

The application will start at `http://localhost:3000`

#### 4. Build for Production

```bash
npm run build
npm start
```

### Option 2: Docker Deployment

#### 1. Build and Run with Docker Compose

```bash
# Navigate to the project directory
cd skeletons/express-skeleton

# Build and start the container
docker-compose up --build

# Or run in detached mode
docker-compose up -d
```

The application will start at `http://localhost:3000`

#### 2. Stop the Container

```bash
docker-compose down
```

## Project Structure

```
express-skeleton/
├── src/
│   ├── server.ts              # Application entry point
│   ├── routes/
│   │   └── index.ts           # Route definitions
│   └── handlers/
│       └── health.ts          # Health check handler
├── docker-compose.yml         # Docker Compose configuration
├── Dockerfile                 # Docker build configuration
├── Makefile                   # Development shortcuts
├── package.json               # Node.js dependencies and scripts
├── tsconfig.json              # TypeScript configuration
└── README.md                  # This file
```

## Available Make Targets

```bash
make help      # Show all available targets
make dev       # Start development server with hot reload
make build     # Build for production
make test      # Run tests
make lint      # Run TypeScript type checking
make install   # Install dependencies
make clean     # Remove build artifacts and dependencies
```

## API Endpoints

### Health Check
- **GET** `/health` - Returns application health status

```bash
curl http://localhost:3000/health
```

Response:
```json
{
  "status": "healthy",
  "message": "Express.js REST API application is running"
}
```

## Adding New Endpoints

1. Create a new handler file in `src/handlers/`
2. Add a route in `src/routes/index.ts`
3. The development server will auto-reload with your changes

## Troubleshooting

### Port Already in Use
```bash
# Find process using port 3000
lsof -i :3000
# Kill the process
kill -9 <PID>
```

### TypeScript Compilation Errors
```bash
# Check for type errors
npm run lint

# Rebuild from scratch
make clean && make build
```

## Next Steps

- Add new REST endpoints for your application
- Set up a database connection (e.g., PostgreSQL, MongoDB)
- Add authentication middleware
- Configure CORS for frontend integration
- Add request validation with a library like Zod
- Set up testing with Vitest or Jest
- Add API documentation with Swagger

## Official Documentation

- [Express.js Documentation](https://expressjs.com/)
- [TypeScript Documentation](https://www.typescriptlang.org/docs/)
- [tsx - TypeScript Execute](https://github.com/privatenumber/tsx)
