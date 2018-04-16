# Cloudcase running K8s
Setup instructions and tools for a Bare Metal Nuc Mini PC Cluster running Kubernets.

## CentOS 7 Installation
For this case we used a normal CentOS7 unautomated installation. 

![Koffer|2x](KofferV2.jpg)

OS Installation (CentOS 7 Full Software with UI ==> Workstation)

| Setting       | Value                            | 
| ------------- | ---------------------------------|  
| Hostname      |  node0 - node4                   |
| Domain        |                                  |
| IP-Addressen  | 192.168.1.100 - 192.168.1.104    |
| Subnetz       | 255.255.255.0                    |
| Gateway       | 192.168.1.1                      |
| DNS           | 192.168.1.1 (DNS Forward Router) |
| ---                                              |
| User          | cloud                            |
| Group         | wheel                            |
| Password      | xxxxx                            |
| ---                                              |
| User          | root                             |
| Password      | xxxxx                            |

It is important that DNS is fully functional.

We use the OpenShift Ansible advanced installation method which is documented here:
https://docs.openshift.org/latest/install_config/install/advanced_install.html


## OpenShift Origin 3.7 - Preperations
#### Install neccessary Software Packages
```
# yum install wget git net-tools bind-utils iptables-services bridge-utils \
              bash-completion kexec-tools sos psacct
# yum update
# systemctl reboot
```


