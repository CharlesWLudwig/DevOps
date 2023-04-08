FROM node:16.13.1-alpine AS build
RUN apk --no-cache add ca-certificates
WORKDIR /tmp/build

COPY /capstone_project/hello-word/package.json .
COPY /capstone_project/hello-word/package-lock.json .
 
COPY . .
RUN npm i -g npm; npm i; npm run build

FROM nginx AS final
RUN apt-get update && apt-get install -y npm
WORKDIR /usr/share/nginx/html
COPY --from=build /tmp/build/build .
CMD ["./app"]  