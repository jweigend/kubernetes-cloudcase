* Cloudcase K8s Installation *

- make clean : cleanup everything

- make prepare : installs docker, kubeadm 

- make install-master : installs the master node with kubeadm

- make install-network : installs the network plugin

- make check : does a simple healthcheck on all nodes with ssh
