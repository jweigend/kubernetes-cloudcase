#!/usr/bin/env bash

NODES=5
for i in $(seq 0 `expr $NODES - 1`); do
   echo Stopping Container VM for $i
   lxc stop node$i
   lxc delete node$i
done

echo "All nodes stopped and deleted: "
lxc list