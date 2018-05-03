#!/bin/bash
ssh-keygen
for ip in `cat ../conf/cluster-nodes`; do
    ssh-copy-id -i ~/.ssh/id_rsa.pub $ip
done
