help:
	@echo "--------------------------------------------------------------------------------------------------------"
	@echo "***         Cloudkoffer setup script for setup a bare metal k8s cluster with kubeadm                 ***"  
	@echo "--------------------------------------------------------------------------------------------------------"
	@echo " usage: make <target>"
	@echo " valid targets are:"
	@echo "                   "
	@echo " Install Tasks     "
	@echo " =============     "
	@echo " - check           - tests if all nodes in the conf/cluster-nodes configuration file can be accessed."
	@echo " - prepare         - installs docker, kubectl, kubeadm on all nodes listed in the cluster-nodes file." 
	@echo " - prepare-node    - installs docker kubectl, kubeadm and do basic configuration."
	@echo " - install-master  - install the master node."
	@echo " - clean           - cleans complete cluster and removes all docker, kubernetes and kubeadm components."
	@echo "                   "
	@echo " Showcase Tasks    "
	@echo " ==============    "	
	@echo " - tbd 1           - Monitoring showcase with Prometheus and Grafana“
	@echo " - tbd 2           - Logging showcase with Elastic Search and Kibana“
	@echo " - tbd 3           - Tracing showcase with Jaeger„
	@echo " - tbd 4           - Monitoring showcase with Software-EKG and Chronix“
	@echo "                   "
	@echo " Admin Tasks       "
	@echo " ===========       "
	@echo " - reboot          - reboot all nodes"
	@echo " - shutown         - halt all nodes"
	@echo " - check           - tests if all nodes in the conf/cluster-nodes configuration file can be accessed."
	@echo "--------------------------------------------------------------------------------------------------------"
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

install-master : 
	./bin/install-master.sh

reboot :
	./sbin/reboot-cluster.sh

shutdown :
	./sbin/shutdown-cluster.sh
