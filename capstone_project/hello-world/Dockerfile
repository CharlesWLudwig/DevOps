FROM node:16.13.1-alpine

RUN apk --no-cache add ca-certificates npm

COPY package*.json ./App

WORKDIR capstone_project/hello-world/src

COPY . .

EXPOSE 3000

CMD ["sh", "-c", "node ./App"]