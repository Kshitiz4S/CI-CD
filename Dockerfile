FROM node:22-alpine

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN rm -rf node_modules

EXPOSE 3000

CMD ["npm", "run", "dev"]

