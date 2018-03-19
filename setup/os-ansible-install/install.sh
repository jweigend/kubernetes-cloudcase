#!/bin/sh
echo Ansible Playbook installation of a BYI cluster
echo Make sure you got the correct Ansible version. 

ansible --version

ansible-playbook -e openshift_disable_check=docker_storage -e openshift_disable_check=package_version -i ./inventory ../../../openshift-ansible/playbooks/byo/config.yml 
