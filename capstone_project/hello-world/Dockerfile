FROM node:16.13.1-alpine AS build
RUN apk --no-cache add ca-certificates npm

WORKDIR /tmp/build

COPY capstone_project/hello-world/package*.json ./
  
COPY . ./app

RUN npm i -g npm; npm i; npm run build

FROM nginx AS final
WORKDIR /usr/share/nginx/html
COPY --from=build /tmp/build/build .
CMD ["./app"]  