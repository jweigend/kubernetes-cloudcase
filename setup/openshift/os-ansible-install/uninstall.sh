ansible-playbook -i inventory -e openshift_disable_check=docker_storage,package_version ../../../openshift-ansible/playbooks/adhoc/uninstall.yml 
