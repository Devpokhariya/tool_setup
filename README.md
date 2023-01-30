# tool_setup
DevOps tools installation &amp; Setup
```
fdisk /dev/sda
p
d --> 2
p
n
p
next 
next
p
w
reboot
pvsize /dev/sda3
lvdisplay
lvextend -l +100%FREE /dev/rhel/root 
parted -l 
xfs_grows /dev/rhel/root 
```

### packer CLI

```
packer build -force -on-error=ask -var-file variables.pkrvars100GBdisk.hcl -var-file vsphere.pkrvars.hcl ubuntu-20.04.pkr.hc
```
