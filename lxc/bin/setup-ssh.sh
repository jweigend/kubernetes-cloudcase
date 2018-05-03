#!/usr/bin/env bash

NODES=5

for i in $(seq 0 `expr $NODES - 1`); do
   echo Setting up ssh for node$i
   lxc exec node$i -- /bin/bash -c "yum -y install openssh-server && systemctl enable sshd && systemctl start sshd"
done