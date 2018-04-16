#!/bin/sh
echo Ansible Playbook installation of a BYI cluster
echo Make sure you got the correct Ansible version. 

echo - Ansible Version ------------------------------ 
ansible --version
echo - OpenShift Ansible Branch ---------------------

( cd ../../../openshift-ansible; git describe )

#ansible-playbook  \
#                 -i ./inventory ../../../openshift-ansible/playbooks/prerequisites.yml

ansible-playbook -e openshift_repos_enable_testing=True \
                 -e openshift_deployment_type=origin -e containerized=true \
                 -e openshift_disable_check=docker_storage \
                 -i ./inventory ../../../openshift-ansible/playbooks/deploy_cluster.yml
