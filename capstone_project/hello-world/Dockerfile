FROM node:16.13.1-alpine

RUN apk --no-cache add ca-certificates npm

COPY capstone_project/hello-world/package*.json ./

COPY . .

EXPOSE 3000

RUN npm start