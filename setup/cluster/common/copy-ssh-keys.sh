#!/bin/bash
for ip in `cat ./all-nodes`; do
    ssh-copy-id -i ~/.ssh/id_rsa.pub $ip
done
