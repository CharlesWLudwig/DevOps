FROM node:16.13.1-alpine

RUN apk --no-cache add ca-certificates npm

COPY ./src/ .
COPY ./public/ .

COPY ["package.json", "package-lock.json", "./App/"]

EXPOSE 3000