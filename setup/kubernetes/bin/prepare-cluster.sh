#!/bin/sh

#
# install basic kubernets / kubeadm and docker components
#
#

pssh -h ${0%/*}/../conf/cluster-nodes -t 600 -o ${0%/*}/../logs -I<${0%/*}/prepare-node.sh
