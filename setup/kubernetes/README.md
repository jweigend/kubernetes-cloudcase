# Cloudcase K8s Installation

## Makefile
- make clean : cleanup everything

- make prepare : installs docker, kubeadm 

- make install-master : installs the master node with kubeadm

- make join-nodes : joins all configured nodes.

- make install-network : installs the network plugin

- make check : does a simple healthcheck on all nodes with ssh
