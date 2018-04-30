# 5 Node Cluster Setup with LXC
LXC is the lightest and fastest way to start virtual machines on Linux. The setup scripts start a LXC 5 node cluster, identical to
the Intel NUC cluster. 

LXC is not a part of the official CentOS distribution. If you try to install LXC with the epel repository, you will install an old 1.x version. A very good description for installing the new version 3 of LXC/LXD you have to do the following steps:

https://discuss.linuxcontainers.org/t/lxd-on-centos-7/1250

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
