FROM node:16.13.1-alpine 

RUN apk --no-cache add ca-certificates npm

COPY package*.json ./

WORKDIR capstone_project/hello-world/src

RUN npm install

COPY . ./App

WORKDIR ./App

EXPOSE 3000

CMD ["./App"]

RUN npm start 