# Cloudcase running OpenShift Origin
Setup instructions and tools for a OpenShift Origin cluster on Bare Metal Nuc Mini PCs.

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

#### You have to generate an SSH Key for passwordless SSH access
Bei der Schlüsselgenerierung muss die Passphrase leer bleiben
```
# ssh-keygen
# ssh-add
# for host in node0 node1 node2 node3 node4; \
    do ssh-copy-id -i ~/.ssh/id_rsa.pub $host; \
    done `
```

#### Use pssh to easy cluster operations (PSSH)
```
$ sudo yum install epel-release
$ sudo yum install pssh
```

With the pssh command, you can run a single command against all machines in the cluster.
A simple test - The file cluster-nodes contains all filenames
```
[root@node0 setup]# pssh -h cluster-nodes uptime
[1] 10:14:59 [SUCCESS] node0
[2] 10:14:59 [SUCCESS] node3
[3] 10:14:59 [SUCCESS] node1
[4] 10:14:59 [SUCCESS] node2
[5] 10:14:59 [SUCCESS] node4
```

ACHTUNG: Ich hatte Probleme mit yum -y update per pssh. Hier gibt es wohl Probleme, 
wenn die eigene Maschine durchstartet. Vermutlich hat der anschliessende Reboot, die
noch laufenden PSSH Jobs im Hintergrund auf den anderen Maschinen abgebrochen???

Die folgenden Installationsanweisungen können auch per pssh auf allen Knoten parallel ausgeführt werden.

#### Installiere Docker (node0 - node4)
Install Package
`# yum install docker-1.12.6` für Origin 3.7

Enable Docker as Service and start Docker
```
# systemctl enable docker
# systemctl start docker
# systemctl status docker
```

Add user cloud to Docker Group
`# sudo usermod -aG docker cloud`

Check Docker Installation
`# docker info`


### Installiere Ansible (nur auf node0 oder externen Provisionierungsknoten)
```
# yum install -y ansible pyOpenSSL python-cryptography python-lxml
# yum update`
```

### Installiere OpenShift Ansible Installation
```
git clone https://github.com/openshift/openshift-ansible.git
git checkout release-3.7
```

### Erzeuge Ansible hosts Datei
```
# Create an OSEv3 group that contains the masters, nodes, and etcd groups
[OSEv3:children]
masters
nodes
etcd

# Set variables common for all OSEv3 hosts
[OSEv3:vars]
# SSH user, this user should allow ssh based auth without requiring a password
ansible_ssh_user=root

openshift_deployment_type=origin

[masters]
node0

[etcd]
node0 

[nodes]
node0
node1
node2
node3
node4
```

## OpenShift Installation mit Ansible
```
# ansible-playbook [-i /path/to/hostsfile] \
    ~/openshift-ansible/playbooks/deploy_cluster.yml
```

Die Installation läuft dann immer noch in zwei Fehler bei den Pre-Checks.
1. Der Docker Storage ist nicht konfiguiert
2. Die Docker Version ist angeblich neuer (was nicht stimmt!)

Beide Fehler lassen sich abschalten
