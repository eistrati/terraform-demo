Install Xvfb and fluxbox
========================

As root, run the following commands:

```shell
# yum install xorg-x11-server-Xvfb

# vi /etc/yum.repos.d/epel.repo and set 'enabled' to '1'
# yum -y update

# wget https://li.nux.ro/download/nux/dextop/el7/x86_64/nux-dextop-release-0-5.el7.nux.noarch.rpm
# rpm -Uvh nux-dextop-release*rpm
# yum install pyxdg

# yum -y install fluxbox
```