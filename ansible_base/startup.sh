#!/bin/bash

service ssh start

cd ../ansible_files

ansible-galaxy collections install community.docker

ansible-playbook -i inventory.ini build.yml

ansible-playbook -i inventory.ini save.yml

ansible-playbook -i inventory.ini load.yml