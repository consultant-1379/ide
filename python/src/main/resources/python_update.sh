#!/bin/bash

Ver=$( sudo apt-cache policy python | grep Installed | awk 'BEGIN {FS="Installed: "}{print $2}' )
if [ -z $Var ]; then
  echo '\nY' | sudo apt-get install python
else
  echo "Python is already installed, with version: [$Ver]"
fi
