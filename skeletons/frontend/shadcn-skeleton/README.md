# shadcn Skeleton

A minimal, ready-to-run frontend skeleton built with **Next.js**, **shadcn/ui**, **Tailwind CSS**, and **TypeScript**.

## Features

- Interactive click counter using React `useState` with shadcn/ui `Button`, `Card`, and `Badge` components
- Dark mode support via `prefers-color-scheme`
- Tailwind CSS v4 with shadcn/ui theming
- Hot reload with Next.js Fast Refresh
- Docker support for containerized development

## Prerequisites

- **Node.js** >= 22 (LTS)
- **npm** >= 10
- **Docker** and **Docker Compose** (optional, for containerized development)

## Quick Start

### Local Development

```bash
# 1. Install dependencies
make install

# 2. Start the dev server
make dev

# 3. Open http://localhost:3001 in your browser
```

### Docker

```bash
# Build and start the container
docker compose up --build

# Open http://localhost:3001 in your browser
```

## Project Structure

```
shadcn-skeleton/
├── src/
│   ├── app/
│   │   ├── globals.css        # Global styles & shadcn/ui theme
│   │   ├── layout.tsx         # Root layout with dark mode
│   │   └── page.tsx           # Home page
│   ├── components/
│   │   ├── ui/                # shadcn/ui components (Button, Card, Badge)
│   │   └── Welcome.tsx        # Interactive welcome component
│   └── lib/
│       └── utils.ts           # Utility functions (cn helper)
├── public/                    # Static assets
├── components.json            # shadcn/ui configuration
├── Dockerfile                 # Container image definition
├── docker-compose.yml         # Docker Compose services
├── Makefile                   # Build & dev targets
├── next.config.ts             # Next.js configuration
├── postcss.config.mjs         # PostCSS configuration
└── tailwind.config.ts         # Tailwind CSS configuration (if present)
```

## Adding New Components

### shadcn/ui Components

Add pre-built components from the shadcn/ui registry:

```bash
npx shadcn@latest add dialog    # Example: add a Dialog component
npx shadcn@latest add table     # Example: add a Table component
```

Components are installed to `src/components/ui/`.

### Custom Components

Create custom components in `src/components/`:

```tsx
// src/components/MyComponent.tsx
export default function MyComponent() {
  return <div>My new component</div>;
}
```

### New Pages

Create new pages using the Next.js App Router in `src/app/`:

```
src/app/about/page.tsx    → /about
src/app/api/hello/route.ts → /api/hello
```

## Development Tips

- **Fast Refresh** is enabled — editing components updates the browser instantly without losing state.
- Run `make help` to see all available Make targets.
- The dev server runs on port **3001** by default.
- shadcn/ui components are fully customizable — edit files in `src/components/ui/` directly.
