FROM node:20-alpine

WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy application code
COPY . .

# Build TypeScript
RUN npm run build

# Expose port 3000
EXPOSE 3000

# Run the application
CMD ["node", "dist/server.js"]
