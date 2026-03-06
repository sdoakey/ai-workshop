FROM node:22-alpine AS builder

WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm ci

# Copy application code
COPY . .

# Build TypeScript
RUN npm run build

FROM node:22-alpine

WORKDIR /app

# Copy package files for production install
COPY package*.json ./
RUN npm ci --omit=dev

# Copy compiled application
COPY --from=builder /app/dist ./dist

# Expose port 3000
EXPOSE 3000

# Run the application
CMD ["node", "dist/server.js"]
