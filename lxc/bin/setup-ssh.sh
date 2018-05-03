#!/usr/bin/env bash

NODES=5

for i in $(seq 0 `expr $NODES - 1`); do
   echo Setting up ssh for node$i
   lxc exec node$i -- /bin/bash -c "yum -y install openssh-server && systemctl enable sshd && systemctl start sshd"
   echo Chaing root password for node$i
   lxc exec node$i -- /bin/bash -c "echo root:12qwasyx | chpasswd"
done

echo copy keys
lxc exec node0 -- /bin/bash -c "ssh-keygen"

yum -y install git

git clone https://github.com/jweigend/kubernetes-cloudcase

./kubernetes-cloudcase/util/copy-ssh-keys.sh

