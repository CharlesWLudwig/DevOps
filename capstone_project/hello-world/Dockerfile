FROM node:alpine
RUN apk add --no-cache git
RUN apk add --no-cache npm
RUN apk add --no-cache openssh
WORKDIR /data

RUN git clone https://github.com/itjuana-bootcamp/DevOps.git /data/app

WORKDIR /data/app

COPY capstone_project/hello-world/package.json ./App

COPY capstone_project/hello-world/package-lock.json ./App

COPY . ./App

EXPOSE 3000

CMD ["node", "./App"] 

WORKDIR /data/app/capstone_project/hello-world/src

RUN npm install -g serve && npm test && serve -s build  && npm start ng serve --host 0.0.0.0 -p 3000 -c-1
