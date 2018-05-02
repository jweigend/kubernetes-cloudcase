#!/bin/sh

#
# Cleanup all kubernets / kubeadm and docker components
#
#

pssh -h ${0%/*}/../conf/cluster-nodes -o ${0%/*}/../logs -I<${0%/*}/clean-node.sh
