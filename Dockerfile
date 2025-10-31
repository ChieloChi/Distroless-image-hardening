# ---- Builder stage ----
FROM node:18-slim AS builder
WORKDIR /app

COPY package*.json ./
RUN npm ci --only=production

COPY . .
RUN npm run build || echo "No build step defined"

# Create writable directory for SQLite DB
RUN mkdir -p /app/data && chown -R node:node /app/data

# ---- Runtime stage ----
FROM gcr.io/distroless/nodejs18:latest
WORKDIR /app

COPY --from=builder /app /app


# Environment variable for DB path
ENV DB_PATH=/app/data/database.sqlite

EXPOSE 3000
CMD ["src/index.js"]



