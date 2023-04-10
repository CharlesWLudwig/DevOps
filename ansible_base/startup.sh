#!/bin/bash

service ssh start

cd ansible_files/build_local_Dockerfile

ansible-galaxy collections install community.docker

ansible-playbook -i inventory.ini build.yml

docker image ls

ansible-playbook -i inventory.ini save.yml

ansible-playbook -i inventory.ini load.yml
