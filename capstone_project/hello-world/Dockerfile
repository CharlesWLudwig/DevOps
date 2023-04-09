FROM node:16.13.1-alpine 

RUN apk --no-cache add ca-certificates npm

COPY package*.json ./

WORKDIR capstone_project/hello-world/src

COPY . ./App

WORKDIR ./App

EXPOSE 3000

RUN npm install

CMD ["./App"]

RUN npm start 