FROM node:16.13.1-alpine AS build

RUN apk add --no-cache git
RUN apk add --no-cache npm
RUN apk add --no-cache openssh
WORKDIR /data

RUN git clone https://github.com/itjuana-bootcamp/DevOps.git /data/app

WORKDIR /data/app

COPY capstone_project/hello-world/package.json ./App

COPY capstone_project/hello-world/package-lock.json ./App

WORKDIR capstone_project/hello-world/src

COPY . .

EXPOSE 3000

RUN npm i -g npm; npm i; npm run build; ng serve --host 0.0.0.0 -p 3000 -c-1

FROM nginx AS final

WORKDIR /usr/share/nginx/html

COPY --from=build /tmp/data/app .