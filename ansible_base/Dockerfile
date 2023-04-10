FROM ubuntu

RUN apt-get update  -y \
    && apt-get upgrade -y \ 
    && apt-get install -y \
    pipx \
    ssh \
    docker \
    sshpass \
    sudo \
    software-properties-common

RUN add-apt-repository --yes --update ppa:ansible/ansible \
    && apt-get install -y ansible ansible-core

RUN pip install ansible-galaxy pytest tox

RUN python -m pip install --upgrade pip setuptools wheel pip-install-test 
RUN pip freeze > capstone_project/hello-world/requirements.txt if [ -f capstone_project/hello-world/requirements.txt ]; then pip install -r capstone_project/hello-world/requirements.txt; fi
RUN tox -e py
RUN sudo apt-get install packaging
RUN sudo pipx inject jmespath

WORKDIR /home/ansible_controller

COPY ansible_base/startup.sh .

RUN useradd -rm -d /home/ansible_controller -s /bin/bash -g root -G sudo -u 1001 ansible_controller
RUN echo ansible_controller:12345 | chpasswd
RUN echo "ansible_controller ALL=(ALL:ALL) NOPASSWD: ALL" |  EDITOR="tee -a"  visudo

RUN mkdir -p /home/ansible_controller/.ssh

CMD ["/bin/bash", "/home/ansible_controller/startup.sh"]
