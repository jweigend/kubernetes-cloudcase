help:
	@echo "--------------------------------------------------------------------------------------------------------"
	@echo "*** Cloudkoffer setup script for setup a bare metal k8s cluster with kubeadm ***"  
	@echo " usage: make <target>"
	@echo " valid targets are:"
	@echo " - prepare         - installs docker, kubectl, kubeadm on all nodes listed in the cluster-nodes file." 
	@echo " - prepare-node    - installs docker kubectl, kubeadm and do basic configuration."
	@echo " - install-master  - install the master node."
	@echo " - clean clean-up  - complete cluster and removes all docker, kubernetes and kubeadm components."
	@echo " - clean-node      - clean-up a single node by removing all docker, kubernets and kubeadm components."
	@echo "--------------------------------------------------------------------------------------------------------"

clean-cluster :
	./bin/clean-cluster.sh

clean-node :
	./bin/clean-node.sh

clean : clean-cluster

prepare-node :
	./bin/prepare-node.sh

prepare :
	./bin/prepare-cluster.sh

install-master : 
	./bin/install-master.sh

reboot :
	./bin/reboot-cluster.sh

