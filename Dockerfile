FROM ubuntu

RUN apt-get update  -y \
    && apt-get upgrade -y \ 
    && apt-get install -y \
    packaging \
    pipx \
    ssh \
    docker \
    sshpass \
    sudo \
    software-properties-common

RUN add-apt-repository --yes --update ppa:ansible/ansible \
    && apt-get install -y ansible

RUN pip install ansible-galaxy

WORKDIR /home/ansible_controller

COPY ansible_base/startup.sh .

RUN useradd -rm -d /home/ansible_controller -s /bin/bash -g root -G sudo -u 1001 ansible_controller
RUN echo ansible_controller:12345 | chpasswd
RUN echo "ansible_controller ALL=(ALL:ALL) NOPASSWD: ALL" |  EDITOR="tee -a"  visudo


RUN mkdir -p /home/ansible_controller/.ssh


CMD ["/bin/bash", "/home/ansible_controller/startup.sh"]
