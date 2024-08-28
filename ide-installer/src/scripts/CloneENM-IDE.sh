#!/bin/sh

vagrant box remove -f ENM/16B
sed -i s/2000/2001/g ~/gitrepos/ide/vagrant/Vagrantfile
sed -i s/'config.vm.box_url = \"https:\/\/arm1s11-eiffel004.eiffel.gic.ericsson.se:8443\/nexus\/service\/local\/repositories\/releases\/content\/com\/ericsson\/de\/ENM_IDE_Base\/1.0.19\/ENM_IDE_Base-1.0.19.box\"'/'config.vm.box_url = \"file:\/\/\/c:\/Users\/yoursignum\/gitrepos\/ide\/vagrant\/package.box\"'/g ~/gitrepos/ide/vagrant/Vagrantfile
vagrant up
