# Use secure, updated base image
FROM node:20-alpine3.19

# Set working directory
WORKDIR /app

# Copy only required files first
COPY package*.json ./

# Install only production deps
RUN npm install --only=production && npm cache clean --force

# Copy app code
COPY . .

# Use non-root user (security best practice)
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
USER appuser

# Expose port
EXPOSE 3000

# Run app
CMD ["node", "app.js"]