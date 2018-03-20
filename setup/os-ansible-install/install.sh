#!/bin/sh
echo Ansible Playbook installation of a BYI cluster
echo Make sure you got the correct Ansible version. 

echo - Ansible Version ------------------------------ 
ansible --version
echo - OpenShift Ansible Branch ---------------------

( cd ../../../openshift-ansible; git describe )

ansible-playbook -e openshift_disable_check=docker_storage,package_version \
                 -i ./inventory ../../../openshift-ansible/playbooks/byo/config.yml --flush-cache
