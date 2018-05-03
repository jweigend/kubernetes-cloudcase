# Kubernetes Cloudcase
#### Automated K8s Setup with kubeadm for CentOS 7


At QAware we built a device called "Cloudcase" which consists of five Intel Nuc PCs. All PCs are packed inside a business briefcase including a small GB Switch and a Mini Router. We use this device for the demonstration of all kinds of Cloud Native Software. Real Hardware make it easy to test scalability of Software like Elastic Search or Apache Spark.

This project contains scripts to setup a Bare Metal-, KVM- or LXC-Cluster. 

Requirements:

### Usage

#### Setup Bare Metal Cluster
First: Edit conf/nodes to match the full hostnames of your cluster nodes.
make prepare-cluster

#### Setup Bare Metal Cluster

make setup-lxd-cluster 
make setup-baremetal-cluster
make install-k8s



