# Vue Skeleton Application

A minimal Vue application built with Vite and TypeScript. This serves as a starting point for building modern Vue applications, ideal for demonstrating how to use AI-assisted development tools to add new functionality.

## Features

- ✅ Vue 3 with TypeScript and Composition API
- ✅ Vite for fast development and optimized builds
- ✅ Hot Module Replacement (HMR) enabled
- ✅ Plain CSS with organized structure
- ✅ Sample components demonstrating Vue patterns
- ✅ Docker and Docker Compose configuration
- ✅ Ready to add components using AI-assisted development

## Prerequisites

- Node.js 22+ (for local development)
- npm or yarn package manager
- Docker and Docker Compose (for containerized deployment)

## Setup and Installation

### Option 1: Local Development

#### 1. Navigate to Project Directory

```bash
cd skeletons/vue-skeleton
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

# Or with yarn
yarn dev
```

The application will start at `http://localhost:5174`

#### 4. Access the Application

Open your browser and navigate to `http://localhost:5174` to see the application running.

### Option 2: Docker Deployment

#### 1. Build and Run with Docker Compose

```bash
# Navigate to the project directory
cd skeletons/vue-skeleton

# Build and start the container
docker-compose up --build

# Or run in detached mode
docker-compose up -d
```

The application will start at `http://localhost:5174`

#### 2. Stop the Container

```bash
docker-compose down
```

## Project Structure

```
vue-skeleton/
├── public/
│   └── vite.svg                # Vite logo
├── src/
│   ├── components/
│   │   ├── App.vue             # Main application component
│   │   └── Welcome.vue         # Sample component with state
│   ├── styles/
│   │   ├── App.css             # Component-specific styles
│   │   └── index.css           # Global styles and CSS variables
│   └── main.ts                 # Vue application entry point
├── .gitignore                  # Git ignore rules
├── docker-compose.yml          # Docker Compose configuration
├── Dockerfile                  # Docker image definition
├── env.d.ts                    # Vue/Vite type definitions
├── index.html                  # HTML entry point
├── package.json                # Node.js dependencies and scripts
├── README.md                   # This file
├── tsconfig.json               # TypeScript configuration (app code)
├── tsconfig.node.json          # TypeScript configuration (build tools)
└── vite.config.ts              # Vite configuration
```

## Adding New Components

This skeleton application is ready for you to add components. Use AI-assisted development tools to:

1. Create new component files in `src/components/`
2. Add corresponding CSS files in `src/styles/`
3. Import and use components in `App.vue`

### Example: Creating a New Component

Create a new file `src/components/HelloWorld.vue`:

```vue
<script setup lang="ts">
interface Props {
  name: string
  age?: number
}

const props = defineProps<Props>()
</script>

<template>
  <div class="hello-world">
    <h2>Hello, {{ props.name }}!</h2>
    <p v-if="props.age">You are {{ props.age }} years old.</p>
  </div>
</template>
```

Then import and use it in `App.vue`:

```vue
<script setup lang="ts">
import HelloWorld from './HelloWorld.vue'
</script>

<template>
  <!-- In your template: -->
  <HelloWorld name="Alice" :age="30" />
</template>
```

## Verifying the Application

Once the application is running, you should see:

1. A welcome message with the Vite logo
2. An interactive counter button
3. Information cards about getting started
4. All text and styling properly rendered

Test the interactive features:

```bash
# Click the counter button
# You should see the count increment and messages appear
```

## Development Tips

- **Hot Module Replacement (HMR)**: Changes to `.vue`, `.ts`, and `.css` files automatically update in the browser without page refresh
- **TypeScript**: Strict mode is enabled to catch type errors during development. Check types with `npm run lint`
- **Vue DevTools**: Install the Vue DevTools browser extension for debugging components and state
- **Component Organization**: Keep related components together. Create subdirectories for feature-specific components
- **CSS Organization**: Use `index.css` for global styles and CSS variables. Create separate CSS files for component-specific styles
- **Composition API**: Use `<script setup>` syntax for concise, type-safe component logic
- **Type Safety**: Always define TypeScript interfaces for component props using `defineProps<T>()`

## Building for Production

```bash
# Build optimized production bundle
npm run build

# The build output will be in the dist/ directory
# Production files are minified and optimized

# Preview production build locally
npm run preview
```

The production build:

- Minifies JavaScript and CSS
- Optimizes images and assets
- Applies tree-shaking to remove unused code
- Generates source maps for debugging
- Creates optimized chunks for better caching

### Deploying Production Build

The `dist/` directory contains static files that can be served with any static file server:

```bash
# Example with a simple static server
npx serve dist

# Or deploy to Vercel, Netlify, AWS S3, etc.
```

## Common npm Commands

```bash
# Install dependencies
npm install

# Start development server with HMR
npm run dev

# Build for production
npm run build

# Preview production build
npm run preview

# Type check without emitting files
npm run lint

# Update dependencies
npm update

# Check for outdated packages
npm outdated
```

## Troubleshooting

### Port Already in Use

If port 5174 is already in use, you can change it in `vite.config.ts`:

```typescript
export default defineConfig({
  server: {
    port: 3000, // Change to your preferred port
  }
})
```

### Hot Reload Not Working in Docker

Ensure the following in your `vite.config.ts`:

```typescript
export default defineConfig({
  server: {
    watch: {
      usePolling: true  // Required for Docker file watching
    }
  }
})
```

Also check that your docker-compose.yml has the correct volume mounts:

```yaml
volumes:
  - ./src:/app/src
  - ./public:/app/public
```

### TypeScript Errors

Run type checking to see all errors:

```bash
npm run lint
```

Common fixes:

- Ensure all dependencies are installed: `npm install`
- Check that prop interfaces are correctly defined with `defineProps<T>()`
- Verify import paths are correct
- Make sure `tsconfig.json` settings are appropriate

### Node Version Issues

Check your Node.js version:

```bash
node --version
```

This project requires Node.js 22 or higher. Update Node.js if needed:

- Use [nvm](https://github.com/nvm-sh/nvm): `nvm install 22 && nvm use 22`
- Use [volta](https://volta.sh/): `volta install node@22`
- Download from [nodejs.org](https://nodejs.org/)

### Module Not Found Errors

If you see "Cannot find module" errors:

1. Delete `node_modules/` and `package-lock.json`
2. Reinstall dependencies: `npm install`
3. Restart the development server: `npm run dev`

### Build Fails

If the production build fails:

1. Check for TypeScript errors: `npm run lint`
2. Ensure all imports are correct
3. Verify that all dependencies are properly installed
4. Check for circular dependencies

## Next Steps

1. **Add Routing**: Install Vue Router for navigation between pages
   ```bash
   npm install vue-router
   ```

2. **State Management**: Choose a state management solution
   - Pinia (official, recommended for Vue 3)
   - Vuex (legacy, for Vue 2 compatibility)

3. **API Integration**: Add data fetching
   - Use built-in `fetch` API
   - Install axios: `npm install axios`
   - Consider TanStack Query for advanced data fetching

4. **UI Component Library**: Add a component library
   - Vuetify: `npm install vuetify`
   - PrimeVue: `npm install primevue`
   - Naive UI: `npm install naive-ui`

5. **Form Handling**: Add form validation
   - VeeValidate: `npm install vee-validate`
   - FormKit: `npm install @formkit/vue`

6. **Testing**: Add test infrastructure
   - Vitest: `npm install -D vitest @vue/test-utils happy-dom`
   - Playwright: `npm install -D @playwright/test`

7. **Code Quality**: Add linting and formatting
   - ESLint: `npm install -D eslint eslint-plugin-vue @typescript-eslint/parser @typescript-eslint/eslint-plugin`
   - Prettier: `npm install -D prettier eslint-config-prettier`

8. **Environment Variables**: Configure environment-specific settings
   - Create `.env.local` for local development
   - Prefix variables with `VITE_` to expose to client: `VITE_API_URL=https://api.example.com`
   - Access in code: `import.meta.env.VITE_API_URL`

9. **Composables**: Create reusable logic
   - Create composable functions in `src/composables/`
   - Use Vue's reactivity system for shared state

10. **Performance Optimization**: Improve loading times
    - Lazy load components with `defineAsyncComponent()`
    - Optimize images and assets
    - Use code splitting with dynamic imports

## Resources

- [Vue Documentation](https://vuejs.org/)
- [Vite Documentation](https://vitejs.dev/)
- [TypeScript Documentation](https://www.typescriptlang.org/docs/)
- [Vue TypeScript Guide](https://vuejs.org/guide/typescript/overview.html)

## License

This is a template/example project for educational purposes.
