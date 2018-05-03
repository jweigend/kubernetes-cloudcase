#
# Setup Umbrella Makefile for LXC installation
#

default : help



help:
	clear
	@echo "--------------------------------------------------------------------------------------------------------"
	@echo " LXC cluster setup script                                                                               "
	@echo "--------------------------------------------------------------------------------------------------------"
	@echo " usage: make <target>"
	@echo "--------------------------------------------------------------------------------------------------------"
	@echo " valid targets are:                                                                                     "
	@echo "  - install-lxc         - Install LXC - WARNING: Reboot required!"
	@echo "  - create-nodes        - Create nodes"
	@echo "  - setup-ssh           - Setup passwordless SSH on all nodes"
	@echo "  - destroy-nodes       - Destroy nodes"
	@echo "  - clean               - Uninstall everything"
	@echo "                                                                                                        "
	@echo "--------------------------------------------------------------------------------------------------------"


#### Targets

# Install LXC / LXD 3 on CentOS 7
install-lxc3 :
	./bin/install-lxc3.sh

# Creates LXC containers running CentOS 7
create-nodes :
	./bin/create-nodes.sh

# Installs and configures SSH
setup-ssh :
	./bin/setup-ssh.sh

# Remove all LXC containers
destroy-nodes :
	./bin/destroy-nodes.sh

# Removes everything
clean :
	./bin/clean.sh

