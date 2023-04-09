FROM node:16.13.1-alpine

RUN apk --no-cache add ca-certificates npm

COPY package*.json ./

COPY . .

EXPOSE 3000

RUN npm start