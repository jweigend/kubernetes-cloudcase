ansible-playbook -i /home/cloud/cloud/setup/ansible/inventory -e openshift_disable_check=docker_storage,package_version ../../../openshift-ansible/playbooks/adhoc/uninstall.yml 
