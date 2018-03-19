#!/bin/bash
for ip in `cat cluster-nodes`; do
   ssh -t cloud@$ip "sudo /usr/sbin/poweroff" 
done
