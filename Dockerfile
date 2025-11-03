# syntax=docker/dockerfile:1
FROM node:20-alpine

# Define the working directory inside the container
WORKDIR /app

# Copy dependency manifests and install packages first
COPY package.json package-lock.json* ./
RUN npm install

# Copy the rest of the application source code
COPY . .

# Expose the default Vite development server port
EXPOSE 5173

# Declare a mount point so the container can consume the host source tree
VOLUME ["/app"]

# Start the development server, binding to all interfaces
CMD ["npm", "run", "dev", "--", "--host", "0.0.0.0", "--port", "5173"]
