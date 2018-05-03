#!/usr/bin/env bash

#
# Install LXD / LXC 3 on CentOS7
# See https://discuss.linuxcontainers.org/t/lxd-on-centos-7/1250
#

# Install snapd
yum install yum-plugin-copr epel-release
yum copr enable ngompa/snapcore-el7
yum install snapd
systemctl enable --now snapd.socket

# Install ZFS (skip if you don't want it)
yum install http://download.zfsonlinux.org/epel/zfs-release.el7_4.noarch.rpm
yum-config-manager --disable zfs
yum-config-manager --enable zfs-kmod
yum install zfs

# Configure the kernel
grubby --args="user_namespace.enable=1" --update-kernel="$(grubby --default-kernel)"
grubby --args="namespace.unpriv_enable=1" --update-kernel="$(grubby --default-kernel)"
echo "user.max_user_namespaces=3883" > /etc/sysctl.d/99-userns.conf
reboot

# Install the LXD snap
snap install lxd

# Configure LXD
lxd init

echo "Add user_namespace.enable=1 and namespace.unpriv_enable=1 them to the GRUB_CMDLINE_LINUX variable in "
     "/etc/default/grub and then generate the new grub conf with grub2-mkconfig "
     ">/boot/grub2/grub.cfg so they apply to all kernels and reboot!"
