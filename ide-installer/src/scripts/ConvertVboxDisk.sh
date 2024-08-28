#!/bin/bash

: '
This script is able to convert vbox disk from .vmdk to .vdi format.
 '

user=$(whoami)
vboxmanage_path="C:/Program Files/Oracle/VirtualBox/" 
vboxdisk_path="C:/Users/${user}/VirtualBox VMs/ENM_IDE_Base/"

cd C:/Users/${user}/VirtualBox\ VMs/ENM_IDE_Base
 
if [ -f "${vboxdisk_path}box-disk1.vdi" ]
then
	echo "box-disk1.vdi already existing!"
else
	echo "Converting vbox disk from .vmdk to .vdi format..."
    "${vboxmanage_path}"VBoxManage clonehd "box-disk1.vmdk" "box-disk1.vdi" --format vdi
fi

# replacement of current hard disk with the .vdi one
"${vboxmanage_path}VBoxManage" storageattach "ENM_IDE_Base" --storagectl "SATAController" --device 0 --port 0 --type hdd --medium "box-disk1.vdi"
