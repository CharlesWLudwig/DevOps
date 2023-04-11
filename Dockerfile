### THIS IS THE DOCKERFILE TO ANSIBLE-CHANGE

# Base DOcker OS
FROM node:ubuntu

RUN apt-get update  -y \
    && apt-get upgrade -y \ 
    && apt-get install -y \
    pipx \
    ssh \
    docker \
    sshpass \
    sudo \
    apt-utils \
    stress \
    curl \
    vim \
    software-properties-common

RUN add-apt-repository --yes --update ppa:ansible/ansible \
    && apt-get install -y ansible ansible-core

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

# Move to git repo section for source files to NPM against
WORKDIR /data/app/capstone_project/hello-world

# Copy all files to temporary App folder
COPY . ./App

# Move to git repo section for source files to NPM against
WORKDIR /data/app/capstone_project/hello-world/src

# Per capstone project instructions, 'npm install' and 'npm test' and 'npm run build' before Dockerfile packaging
RUN npm install; npm test; npm run build

# Expose (in Docker) the port to access React app from
EXPOSE 3000

WORKDIR /home/ansible_controller

COPY startup.sh .

RUN useradd -rm -d /home/ansible_controller -s /bin/bash -g root -G sudo -u 1001 ansible_controller
RUN echo ansible_controller:12345 | chpasswd
RUN echo "ansible_controller ALL=(ALL:ALL) NOPASSWD: ALL" |  EDITOR="tee -a"  visudo

RUN mkdir -p /home/ansible_controller/.ssh
# CMD ["/bin/bash", "-c", "echo npm start;echo /home/ansible_controller/startup.sh"]

# Run the /App folder
CMD ["npm", "start", "/bin/bash", "/home/ansible_controller/startup.sh"]