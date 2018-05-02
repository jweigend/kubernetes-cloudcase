#!/bin/bash
clear

echo "checking SSH login on all cluster nodes ..."
pssh -i -h ${0%/*}/../conf/cluster-nodes uptime

echo "checking k8s pod health ..."
source ${0%/*}/../conf/set-env.sh
kubectl get pods --all-namespaces

echo "done."
