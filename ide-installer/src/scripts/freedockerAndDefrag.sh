#!/bin/sh

docker rmi $(docker images -f "dangling=true" -q)
echo "Sto rimuovendo emptyfile...." > /tmp/outCleanSpaces.log
sudo dd if=/dev/zero of=/emptyfile bs=1M >> /tmp/outCleanSpaces.log 2>&1
sudo rm -rf /emptyfile
