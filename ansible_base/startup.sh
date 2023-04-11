#!/bin/bash

service ssh start

ansible-galaxy collections install community.docker

ansible-playbook -i inventory.ini ansible_base/build.yml

ansible-playbook -i inventory.ini ansible_base/save.yml

ansible-playbook -i inventory.ini ansible_base/load.yml