#!/bin/bash
for ip in `cat ../cluster-nodes`; do
    ssh-copy-id -i ~/.ssh/id_rsa.pub $ip
done
