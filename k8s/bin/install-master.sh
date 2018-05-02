kubeadm init --pod-network-cidr=10.244.0.0/16 | tee ./logs/kubeadm-init.log
echo "Make sure to export the KUBECONFIG variable in your shell to access the cluster: export KUBECONFIG=/etc/kubernetes/admin.conf"

