# 5 Node Cluster Setup with LXC 3
LXC is the lightest and fastest way to start virtual machines on Linux. The setup scripts start a LXC 5 node cluster, identical to
the Intel NUC cluster. 

LXC 3 is not a part of the official CentOS distribution. If you try to install LXC 3 with the epel repository, 
you will install an old 1.x version. A very good description for installing the new version 3 of LXC/LXD you have to do the following steps:

https://discuss.linuxcontainers.org/t/lxd-on-centos-7/1250

Make sure you have read the comment at the end otherwise the required kernel parameters for LXC/LXD do not match.

After installation you can download and start a CentOS 7 Linux Container with the following command:

```shell
lxd init 

lxc launch images:centos/7/amd64 node$i -c security.nesting=true -c security.privileged=true;
```

You use this in a loop to get five nodes
```shell
## Create nodes for k8s setup ...
LAST_NODE=4
for i in $(seq 0 $LAST_NODE); do 
   echo Creating Container VM for $i
   lxc launch images:centos/7/amd64 node$i -c security.nesting=true -c security.privileged=true;
done



 lxc list
+-------+---------+---------------------+-----------------------------------------------+------------+-----------+
| NAME  |  STATE  |        IPV4         |                     IPV6                      |    TYPE    | SNAPSHOTS |
+-------+---------+---------------------+-----------------------------------------------+------------+-----------+
| node0 | RUNNING | 10.65.34.61 (eth0)  | fd42:a87e:5024:5ace:216:3eff:fe42:603e (eth0) | PERSISTENT | 0         |
+-------+---------+---------------------+-----------------------------------------------+------------+-----------+
| node1 | RUNNING | 10.65.34.175 (eth0) | fd42:a87e:5024:5ace:216:3eff:fec9:648a (eth0) | PERSISTENT | 0         |
+-------+---------+---------------------+-----------------------------------------------+------------+-----------+
| node2 | RUNNING | 10.65.34.64 (eth0)  | fd42:a87e:5024:5ace:216:3eff:fe8d:8ff4 (eth0) | PERSISTENT | 0         |
+-------+---------+---------------------+-----------------------------------------------+------------+-----------+
| node3 | RUNNING | 10.65.34.233 (eth0) | fd42:a87e:5024:5ace:216:3eff:fe08:7f14 (eth0) | PERSISTENT | 0         |
+-------+---------+---------------------+-----------------------------------------------+------------+-----------+
| node4 | RUNNING | 10.65.34.47 (eth0)  | fd42:a87e:5024:5ace:216:3eff:fe67:bb6f (eth0) | PERSISTENT | 0         |
+-------+---------+---------------------+-----------------------------------------------+------------+-----------+
```

The default CentOS7 LXC containers are minimalistic.  
To make things easier I packed everything together in a single Makefile:

## Makefile
#### Targets
- make install-lxc3    - Install LXC / LXD 3 on CentOS 7 
- make create-nodes    - Creates LXC containers running CentOS 7
- make ssh             - Installs and configures SSH
- make destroy-nodes   - Remove all LXC containers
- make clean           - Removes everything
     