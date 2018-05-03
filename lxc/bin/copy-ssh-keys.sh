#!/bin/bash
ssh-keygen

NODES=5

for i in $(seq 0 `expr $NODES - 1`); do
    ssh-copy-id -i ~/.ssh/id_rsa.pub node$i
done
