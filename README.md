# ansible-workstation

## Install

    sudo apt-get install software-properties-common
    sudo apt-add-repository ppa:ansible/ansible
    sudo apt-get update
    sudo apt-get install ansible

## Quick start

Run as sudo, we are changing the system.

    sudo ansible-pull -U https://github.com/Joostvanderlaan/ansible-workstation

Test on localhost

    sudo ansible-playbook local.yml