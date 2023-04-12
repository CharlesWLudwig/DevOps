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

# Access temporary subfolder
WORKDIR /data/app/capstone_project/hello-world

# Replace file content (for the client-facing website)
RUN sed -i "s|hello-world|hello-devops|g" package.json
# Verify file changes to App.js
RUN cat package.json

# Access temporary subfolder
WORKDIR /data/app/capstone_project/hello-world/src

# Replace file content (for the client-facing website)
RUN sed -i "s|Hello World!|Hello DevOps!|g" App.js
# Verify file changes to App.js
RUN cat App.js

# Replace file content of App.test.js (to pass the tests)
RUN sed -i "s|Hello World!|Hello DevOps!|g" App.test.js
# Verify file changes to App.test.js
RUN cat App.test.js

# Copy all files to temporary App folder
COPY . ./App

# Move to git repo section for source files to NPM against
WORKDIR /data/app/capstone_project/hello-world/src

# Per capstone project instructions, 'npm install' and 'npm test' and 'npm run build' before Dockerfile packaging
RUN npm install; npm test; npm run build

# Expose (in Docker) the port to access React app from
EXPOSE 3000

# Run the /App folder
CMD ["npm", "start"]