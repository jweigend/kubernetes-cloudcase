#!/usr/bin/env bash

NODES=5

for i in $(seq 0 `expr $NODES - 1`); do
   echo Setting up ssh for node$i
   lxc exec node$i -- /bin/bash -c "yum -y install openssh-server && systemctl enable sshd && systemctl start sshd"
   echo Chaing root password for node$i
   lxc exec node$i -- /bin/bash -c "echo root:12qwasyx | chpasswd"
done

echo create and copy ssh keys on node0

lxc exec node0 -- /bin/bash -c "ssh-keygen"
lxc exec node0 -- /bin/bash -c "yum -y install git"
lxc exec node0 -- /bin/bash -c "git clone https://github.com/jweigend/kubernetes-cloudcase"
lxc exec node0 -- /bin/bash -c "./kubernetes-cloudcase/lxc/bin/copy-ssh-keys.sh"

