FROM node:16-slim

WORKDIR /app

COPY package.json ./
RUN npm install

COPY . .

EXPOSE 80
CMD ["npm", "run", "dev"]
