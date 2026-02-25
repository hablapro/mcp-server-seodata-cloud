FROM node:22-alpine
WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm install --ignore-scripts

# Copy source files
COPY tsconfig.json ./
COPY src/ ./src/

# Copy field configuration if exists
COPY field-config*.json ./

# Build the application
RUN npm run build

# Expose port (Railway will set PORT env variable)
EXPOSE 3000

# Set production environment
ENV NODE_ENV=production

# Use the CLI to start the SSE server for N8N compatibility
ENTRYPOINT ["node", "build/main/main/cli.js"]
CMD ["sse"]