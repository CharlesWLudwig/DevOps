FROM node:16.13.1-alpine

RUN apk --no-cache add ca-certificates npm

COPY ["package.json", "package-lock.json", "src/", "public/", "./App/"]

EXPOSE 3000