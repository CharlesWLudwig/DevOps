FROM node:alpine
RUN apk add --no-cache git
RUN apk add --no-cache openssh
WORKDIR /data
RUN git clone https://github.com/itjuana-bootcamp/DevOps.git /data/app

WORKDIR /data/app

COPY capstone_project/hello-world/package.json ./App

COPY capstone_project/hello-world/package-lock.json ./App

WORKDIR /data/app/capstone_project/hello-world/src

COPY . ./App

EXPOSE 3000

CMD ["node", "./App"]