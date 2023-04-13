# DevOps Bootcamp Capstone Project Instructions

[![Docker Image CI](https://github.com/CharlesWLudwig/DevOps/actions/workflows/docker-image.yml/badge.svg)](https://github.com/CharlesWLudwig/DevOps/actions/workflows/docker-image.yml)

- [DevOps Bootcamp Capstone Project](#devops-bootcamp-capstone-project)
  - [Description](#description)
  - [Features and Requirements](#features-and-requirements)
  - [Guidelines](#guidelines)
  - [Resources](#resources)
  - [Pre-requisites](#pre-requisites)
  - [1. Setup your development environment](#1-setup-your-development-environment)
    - [Repository](#repository)
    - [Application](#application)
  - [2. Containerize the application](#2-containerize-the-application)
  - [3. Create a CI Pipeline](#3-create-a-ci-pipeline)
  - [4. Update "Hello World!" to "Hello DevOps!"](#4-update-hello-world-to-hello-devops)

## Description
In this project, you will be using some of the tools and technologies you have learned during the bootcamp.

## Features and Requirements
- Node Js application will be provided
- Containerization using docker
- CI pipeline using Github Actions (Including automated testing,build)
- Update the Node JS application content using Ansible

## Guidelines
- Instruction for the project will be available on Thursday, April 6th
- One week to deliver the project. Please deliver the project no later than Monday, April 17.
- Send the repo link or project to talent@itjuana.com
- After delivering the trainers will review the content, if you pass you’ll get a badge recognizing your knowledge as DevOps Engineer.
- You’ll know the results via email from the ITJ Talent Team.
- Any questions or comments, please post it in the [WhatsApp group](https://chat.whatsapp.com/KiirrKYAJ3SINrDn1pLZ7C)

## Resources
[Bootcamp Presentations](https://github.com/itjuana-bootcamp/DevOps/tree/main/Presentations)

## Pre-requisites

* [Docker](https://docs.docker.com/desktop/) installed
  * `docker --version` should show the docker version
* [Git](https://github.com/git-guides/install-git) installed
  * `git --version` should show the git version
* [Node JS](https://nodejs.org/en/download/package-manager/)
  * `npm version` should show the node version
* Have a [github account](https://github.com/join)
* Code editor of your preference - [VS Code](https://code.visualstudio.com/download) recommended

## 1. Setup your development environment

### Repository
- Go to the github repository https://github.com/itjuana-bootcamp/DevOps
- Fork the repository
NOTE: From here on, whenever we say repository , that refers to your forked repository.
- Clone the repository : `git clone git@github.com:<githubaccount>/DevOps.git`

### Application
- Go to folder `hello-world`
- Run `npm install` .
- Run `npm test` . All tests need to pass.
- Run `npm start` to run the application.
- Check http://localhost:3000 is reachable and displaying "Hello World!"

## 2. Containerize the application
- Using docker, containerize the application.
- Build the container and run it to make the application available on http://localhost:3000

## 3. Create a CI Pipeline 
- Create a CI pipeline which 
     - will trigger on push and on pull request
     - Run the tests
     - Only if tests are success, build the container

## 4. Update "Hello World!" to "Hello DevOps!"
- Update the node js application to display "Hello DevOps!" instead of "Hello World!" using ansible.


# DevOps Bootcamp Capstone Project Solutions

## CI pipeline using Github Actions (Including automated testing,build)
## Containerization using docker

Roadmap of Github Actions Workflow:

- On checkout, set up python architecture (version 3.11, x64)
- Install Python dependencies (pip, setuptools, wheel, pip-install-test, tox)
- Setup GitHub Actions for Docker Buildx and QEMU
- Login to DockerHub
- Build and Upload original Hello-World Dockerfile image to Docker Hub (showcasing working application)
	- Clone repo from ITJ and run npm tests
	- Build production server if tests pass
	- Expose port 3000
	- npm start (if everything is successful)
	- If successful, containerize / build / upload Dockerfile to Dockerhub as "Hello-World:latest"
	- Hello-World Dockerfile will be accessible at: https://hub.docker.com/r/charleswludwig/hello-world

- Utilize Ansible Galaxy (Community) Collection to download Community.Docker extensions (for the Playbook requirements).
- Run the Ansible Playbook to update the original Hello-World Dockerfile to Hello-Devops

## Update the Node JS application content using Ansible

Roadmap of Ansible Playbook:

- using the localhost, becomes temporary root
	- Localhost (IPV4 address 127.0.0.1) isn't a real physical address
	- No packets will be generated on the network interface / secure vector for testing
- installs the latest version of aptitude
- installs system packages and updates the cache
            - apt-transport-https
            - ca-certificates
            - curl
            - sshpass
            - sudo
            - pipx
            - ssh
            - software-properties-common
            - python3-pip
            - vim
            - stress
            - apt-utils
            - virtualenv
            - python3-setuptools

- adds the docker GPG apt key, adds the Docker repo, installs docker-ce and ansible / ansible-core
- logs into my Dockerhub account (again)
- creates a temporary build repository for the "Hello-Devops" Dockerfile

- Update the original code with "ansible.builtin.blockinfile" to:
	- Update package.json to reflect name for "hello-devops"
	- Update App.test.js to reflect "npm test" for "Hello Devops!"
	- Update App.js to reflect "npm start" for "Hello Devops!" (what the public viewer will see)

- copy the Dockerfile to a temp root directory
- build container images
- archive container image as a tarball
- fetch archived image
- copy tarball to host
- load container from tarball
- Tag and push to Docker Hub
- Ensure the "Hello-Devops!" container is uploaded / running

- Hello-Devops Ansible Dockerfile will be accessible at: 
https://hub.docker.com/r/charleswludwig/hello-devops

To start up Dockerfiles, type in the following commands:

### Docker Pull:
docker pull charleswludwig/hello-world:latest

docker pull charleswludwig/hello-devops:latest

### Docker Run:
- docker run -p 3000:3000 charleswludwig/hello-world:latest
- Go to "localhost:3000" to see the containerized "Hello-World" image

 - docker run -p 4000:3000 charleswludwig/hello-devops:latest
- Go to "localhost:4000" to see the containerized "Hello-Devops" image
