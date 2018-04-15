#!/bin/sh

#
# Cleanup all kubernets / kubeadm and docker components
#
#

kubectl drain `hostname` --delete-local-data --force --ignore-daemonsets 
kubectl delete node `hostname`
kubeadm reset

systemctl stop kublet docker 

yum remove -y kubelet kubeadm kubectl docker

rm -rf /var/lib/docker*
rm -rf /var/lib/kube*
rm -rf /etc/kube*
rm -rf /var/lib/etcd

echo node `hostname` completly cleaned.
