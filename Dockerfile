FROM node:18-alpine

WORKDIR /app

# Copy package files
COPY package*.json ./
COPY server/package*.json ./server/
COPY client/package*.json ./client/

# Install dependencies
RUN npm install
RUN cd server && npm install && cd ..
RUN cd client && npm install && cd ..

# Copy application code
COPY . .

# Build client
RUN cd client && npm run build && cd ..

EXPOSE 5000

ENV NODE_ENV=production

CMD ["npm", "start"]
