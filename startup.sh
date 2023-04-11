#!/bin/bash

service ssh start
tail -f /dev/null

ansible-galaxy collections install community.docker

ansible-playbook -i inventory.ini ./build.yml

ansible-playbook -i inventory.ini ./save.yml

ansible-playbook -i inventory.ini ./load.yml 