#!/bin/sh

#
# join nodes
#
#

JOIN_COMMAND=`grep "kubeadm join"  ../logs/kubeadm-init.log`

pssh -h ${0%/*}/../conf/join-nodes -t 600 -o ${0%/*}/../logs -i `echo $JOIN_COMMAND`


