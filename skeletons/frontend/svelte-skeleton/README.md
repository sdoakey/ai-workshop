# Svelte Skeleton Application

A minimal SvelteKit application built with Svelte 5 and TypeScript. This serves as a starting point for building modern Svelte applications, ideal for demonstrating how to use AI-assisted development tools to add new functionality.

## Features

- ✅ Svelte 5 with runes (`$state`, `$props`) and TypeScript
- ✅ SvelteKit for file-based routing and SSR
- ✅ Vite for fast development and optimized builds
- ✅ Hot Module Replacement (HMR) enabled
- ✅ Scoped CSS with CSS custom properties for theming
- ✅ Dark mode support via `prefers-color-scheme`
- ✅ Sample components demonstrating Svelte 5 patterns
- ✅ Docker and Docker Compose configuration
- ✅ Ready to add components using AI-assisted development

## Prerequisites

- Node.js 20+ (for local development)
- npm or yarn package manager
- Docker and Docker Compose (for containerized deployment)

## Setup and Installation

### Option 1: Local Development

#### 1. Navigate to Project Directory

```bash
cd skeletons/frontend/svelte-skeleton
```

#### 2. Install Dependencies

```bash
npm install

# Or with yarn
yarn install
```

#### 3. Run the Development Server

```bash
npm run dev

# Or using Make
make dev
```

The application will start at `http://localhost:5173`

#### 4. Access the Application

Open your browser and navigate to `http://localhost:5173` to see the application running.

### Option 2: Docker Deployment

#### 1. Build and Run with Docker Compose

```bash
# Navigate to the project directory
cd skeletons/frontend/svelte-skeleton

# Build and start the container
docker-compose up --build

# Or run in detached mode
docker-compose up -d
```

The application will start at `http://localhost:5173`

#### 2. Stop the Container

```bash
docker-compose down
```

## Project Structure

```
svelte-skeleton/
├── src/
│   ├── lib/
│   │   └── components/
│   │       └── Welcome.svelte      # Sample component with state (runes)
│   ├── routes/
│   │   ├── +layout.svelte          # Root layout (imports global styles)
│   │   └── +page.svelte            # Main page component
│   ├── styles/
│   │   └── global.css              # Global styles and CSS variables
│   ├── app.d.ts                    # App-level type definitions
│   └── app.html                    # HTML template
├── static/
│   └── svelte.svg                  # Svelte logo
├── .gitignore                      # Git ignore rules
├── docker-compose.yml              # Docker Compose configuration
├── Dockerfile                      # Docker image definition
├── Makefile                        # Build and dev targets
├── package.json                    # Node.js dependencies and scripts
├── README.md                       # This file
├── svelte.config.js                # SvelteKit configuration
├── tsconfig.json                   # TypeScript configuration
└── vite.config.ts                  # Vite configuration
```

## Adding New Components

This skeleton application is ready for you to add components. Use AI-assisted development tools to:

1. Create new component files in `src/lib/components/`
2. Add new routes in `src/routes/`
3. Import and use components in your pages

### Example: Creating a New Component

Create a new file `src/lib/components/HelloWorld.svelte`:

```svelte
<script lang="ts">
  interface Props {
    name: string;
    age?: number;
  }

  let { name, age }: Props = $props();
</script>

<div class="hello">
  <h2>Hello, {name}!</h2>
  {#if age}
    <p>You are {age} years old.</p>
  {/if}
</div>

<style>
  .hello {
    padding: 1rem;
    border: 1px solid var(--color-border);
    border-radius: 8px;
  }
</style>
```

### Using the Component

Import and use it in `src/routes/+page.svelte`:

```svelte
<script lang="ts">
  import HelloWorld from '$lib/components/HelloWorld.svelte';
</script>

<HelloWorld name="Developer" age={25} />
```

### Adding a New Route

Create a new file `src/routes/about/+page.svelte`:

```svelte
<h1>About Page</h1>
<p>This is a new route!</p>
```

It will automatically be available at `http://localhost:5173/about`.

## Development Tips

- **Hot Reload**: Changes to `.svelte`, `.ts`, and `.css` files are immediately reflected in the browser.
- **Svelte 5 Runes**: This skeleton uses the new Svelte 5 runes API (`$state`, `$props`, `$derived`, `$effect`) instead of the legacy reactive declarations.
- **File-based Routing**: SvelteKit maps files in `src/routes/` to URL paths automatically.
- **Scoped Styles**: Styles in `<style>` blocks are scoped to the component by default.
- **Type-safe Props**: Use `$props()` with TypeScript interfaces for type-safe component properties.

## Available Make Targets

Run `make help` to see all available targets:

| Target    | Description                             |
|-----------|-----------------------------------------|
| `dev`     | Run development server with hot reload  |
| `build`   | Build production bundle                 |
| `test`    | Run tests (not yet configured)          |
| `install` | Install npm dependencies                |
| `lint`    | Run Svelte and TypeScript type checking |
| `clean`   | Remove build artifacts and dependencies |
| `preview` | Preview production build locally        |
