#
# Setup Umbrella Makefile for K8s installation
#

default : help

check :
	./sbin/check-cluster.sh

clean-cluster :
	./bin/clean-cluster.sh

clean-node :
	./bin/clean-node.sh

clean : clean-cluster

prepare-node :
	./bin/prepare-node.sh

prepare :
	./bin/prepare-cluster.sh
	./sbin/reboot-cluster.sh

install : prepare install-master join-nodes install-network

install-master : 
	./bin/install-master.sh

join-nodes :
	./bin/join-nodes.sh

install-network :
	./bin/install-network.sh

reboot :
	./sbin/reboot-cluster.sh

shutdown :
	./sbin/shutdown-cluster.sh

help:
	clear
	@echo "--------------------------------------------------------------------------------------------------------"
	@echo " Cloudkoffer setup script for Kubernetes installation on CentOS 7 nodes.                                "
	@echo "--------------------------------------------------------------------------------------------------------"
	@echo " usage: make <target>"
	@echo "--------------------------------------------------------------------------------------------------------"
    @echo "                               "
	@echo " valid targets are:            "
	@echo "                               "
	@echo " Install Tasks        "
	@echo "  - prepare             - Install docker, kubectl, kubeadm on all nodes listed in the cluster-nodes file."
	@echo "                          WARNING: Reboot required!"
	@echo "  - install-master      - Install the k8s master node by using cubeadm init."
	@echo "                          Installation token is stored in the ./log/kubeadm-init.log file."
	@echo "  - join-nodes          - Join all nodes after the master is ready."
	@echo "  - install-network     - Installs a network plugin."
	@echo "                          WARNING: Make sure install-master settings are consistent and some nodes are joined."
	@echo "  - clean              - cleans complete cluster and removes all docker, kubernetes and kubeadm components."
	@echo "                      "
	@echo " Admin Tasks         "
	@echo "  - reboot              - reboot all nodes"
	@echo "  - shutown             - halt all nodes"
	@echo "  - check               - tests if all nodes in the conf/cluster-nodes configuration file can be accessed."
	@echo "--------------------------------------------------------------------------------------------------------"
