FROM node:13-alpine

WORKDIR /usr/src/app

COPY package*.json ./
COPY app.json ./
COPY Procfile ./
COPY public/ ./
 
RUN npm install

COPY . .
EXPOSE 5000
CMD [ "node", "index.js" ]
