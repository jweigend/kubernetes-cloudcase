#!/usr/bin/env bash

## Create nodes starting with node0.
NODES=5
for i in $(seq 0 `expr $NODES - 1`); do
   echo Creating Container VM for $i
   lxc launch images:centos/7/amd64 node$i -c security.nesting=true -c security.privileged=true;
done
