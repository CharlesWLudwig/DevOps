# Base DOcker OS
FROM node:alpine

# Add in dependencies to download git rep / install npm
RUN apk add --no-cache git
RUN apk add --no-cache npm
RUN apk add --no-cache openssh

# Create temporary directory
WORKDIR /data

# Clone git repo and save to temporary directory subfolder
RUN git clone https://github.com/itjuana-bootcamp/DevOps.git /data/app

# Move to git repo section for source files to NPM against
WORKDIR /data/app/capstone_project/hello-world

# Copy all files to temporary App folder
COPY . ./App

# Move to git repo section for source files to NPM against
WORKDIR /data/app/capstone_project/hello-world/src

# Per capstone project instructions, 'npm install' and 'npm test' and 'npm run build' before Dockerfile packaging
RUN npm install; npm test; npm run build

# Run the /App folder
CMD ["node", "./App/src/App.js"] 

# Expose (in Docker) the port to access React app from
EXPOSE 3000
