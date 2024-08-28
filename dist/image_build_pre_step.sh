#!/bin/bash

printf '========================================\n'
printf '======= Remove any exisiting VMs =======\n'
printf '========================================\n\n'

for v in $( vboxmanage list vms | cut -d' ' -f2 ); do
    vboxmanage unregistervm $v
done
rm -rf ~/VirtualBox\ VMs/* && echo OK: Existing VMs Removed || { echo Failed ; exit 1; }

printf '\n========================================\n'
printf '========== Create Vagrant VM ===========\n'
printf '========================================\n'

cd $WORKSPACE/dist
vagrant up && echo OK: vagrant up success || { echo Failed: vagrant up unsuccessful ; exit 1; }

printf '\n========================================\n'
printf '===== Package the VM as box image ======\n'
printf '========================================\n'

[ -e $WORKSPACE/ENM_IDE_Base.box ] && rm $WORKSPACE/ENM_IDE_Base.box
vagrant package --output $WORKSPACE/ENM_IDE_Base.box && echo OK: Box image created || { echo Failed: Box image not created ; exit 1; }

printf '========================================\n'
printf '=========== Release box image ==========\n'
printf '========================================\n'
