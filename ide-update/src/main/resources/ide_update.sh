#!/bin/bash

Ver=$( sudo apt-cache policy eclipse | grep Installed | awk 'BEGIN {FS="Installed: "}{print $2}' )
if [ -z $Var ]; then
  echo '\nY' | sudo apt-get install eclipse
else
  echo "Eclipse is already installed, with version: [$Ver]"
fi
Ver=$( sudo apt-cache policy eclipse-testing | grep Installed | awk 'BEGIN {FS="Installed: "}{print $2}' )
if [ -z $Var ]; then
  echo '\nY' | sudo apt-get install eclipse-testng
else
  echo "Eclipse-testing is already installed, with version: [$Ver]"
fi
Ver=$( sudo apt-cache policy eclipse-taf | grep Installed | awk 'BEGIN {FS="Installed: "}{print $2}' )
if [ -z $Var ]; then
  echo '\nY' | sudo apt-get install eclipse-taf
else
  echo "Eclipse-taf is already installed, with version: [$Ver]"
fi
Ver=$( sudo apt-cache policy eclipse-slf4j-api | grep Installed | awk 'BEGIN {FS="Installed: "}{print $2}' )
if [ -z $Var ]; then
  echo '\nY' | sudo apt-get install eclipse-slf4j-api
else
  echo "Eclipse-slf4j-api is already installed, with version: [$Ver]"
fi
Ver=$( sudo apt-cache policy eclipse-pydev | grep Installed | awk 'BEGIN {FS="Installed: "}{print $2}' )
if [ -z $Var ]; then
  echo '\nY' | sudo apt-get install eclipse-pydev
else
  echo "Eclipse-pydev is already installed, with version: [$Ver]"
fi
Ver=$( sudo apt-cache policy eclipse-pmd | grep Installed | awk 'BEGIN {FS="Installed: "}{print $2}' )
if [ -z $Var ]; then
  echo '\nY' | sudo apt-get install eclipse-pmd
else
  echo "Eclipse-pmd is already installed, with version: [$Ver]"
fi
Ver=$( sudo apt-cache policy eclipse-mylyn | grep Installed | awk 'BEGIN {FS="Installed: "}{print $2}' )
if [ -z $Var ]; then
  echo '\nY' | sudo apt-get install eclipse-mylyn
else
  echo "Eclipse-mylyn is already installed, with version: [$Ver]"
fi
Ver=$( sudo apt-cache policy eclipse-mylyn-git | grep Installed | awk 'BEGIN {FS="Installed: "}{print $2}' )
if [ -z $Var ]; then
  echo '\nY' | sudo apt-get install eclipse-mylyn-git
else
  echo "Eclipse-mylyn-git is already installed, with version: [$Ver]"
fi
Ver=$( sudo apt-cache policy eclipse-m2e | grep Installed | awk 'BEGIN {FS="Installed: "}{print $2}' )
if [ -z $Var ]; then
  echo '\nY' | sudo apt-get install eclipse-m2e
else
  echo "Eclipse-m2e is already installed, with version: [$Ver]"
fi
Ver=$( sudo apt-cache policy eclipse-jcat | grep Installed | awk 'BEGIN {FS="Installed: "}{print $2}' )
if [ -z $Var ]; then
  echo '\nY' | sudo apt-get install eclipse-jcat
else
  echo "Eclipse-jcat is already installed, with version: [$Ver]"
fi
Ver=$( sudo apt-cache policy eclipse-jboss-tools | grep Installed | awk 'BEGIN {FS="Installed: "}{print $2}' )
if [ -z $Var ]; then
  echo '\nY' | sudo apt-get install eclipse-jboss-tools
else
  echo "Eclipse-jboss-tools is already installed, with version: [$Ver]"
fi
Ver=$( sudo apt-cache policy eclipse-guava | grep Installed | awk 'BEGIN {FS="Installed: "}{print $2}' )
if [ -z $Var ]; then
  echo '\nY' | sudo apt-get install eclipse-guava
else
  echo "Eclipse-guava is already installed, with version: [$Ver]"
fi
Ver=$( sudo apt-cache policy eclipse-groovy | grep Installed | awk 'BEGIN {FS="Installed: "}{print $2}' )
if [ -z $Var ]; then
  echo '\nY' | sudo apt-get install eclipse-groovy
else
  echo "Eclipse-groovy is already installed, with version: [$Ver]"
fi
Ver=$( sudo apt-cache policy eclipse-lmitor | grep Installed | awk 'BEGIN {FS="Installed: "}{print $2}' )
if [ -z $Var ]; then
  echo '\nY' | sudo apt-get install eclipse-lmitor
else
  echo "Eclipse-lmitor is already installed, with version: [$Ver]"
fi
Ver=$( sudo apt-cache policy firefox-firebug | grep Installed | awk 'BEGIN {FS="Installed: "}{print $2}' )
if [ -z $Var ]; then
  echo '\nY' | sudo apt-get install firefox-firebug
else
  echo "firefox-firebug is already installed, with version: [$Ver]"
fi
Ver=$( sudo apt-cache policy firefox-firepath | grep Installed | awk 'BEGIN {FS="Installed: "}{print $2}' )
if [ -z $Var ]; then
  echo '\nY' | sudo apt-get install firefox-firepath
else
  echo "firefox-firepath is already installed, with version: [$Ver]"
fi
Ver=$( sudo apt-cache policy firefox-firequery | grep Installed | awk 'BEGIN {FS="Installed: "}{print $2}' )
if [ -z $Var ]; then
  echo '\nY' | sudo apt-get install firefox-firequery
else
  echo "firefox-firequery is already installed, with version: [$Ver]"
fi
# echo '\nY' | sudo apt-get install firefox-restclient
Ver=$( sudo apt-cache policy firefox-restclient | grep Installed | awk 'BEGIN {FS="Installed: "}{print $2}' )
if [ -z $Var ]; then
  echo '\nY' | sudo apt-get install firefox-restclient
else
  echo "firefox-restclient is already installed, with version: [$Ver]"
fi
# echo '\nY' | sudo apt-get install firefox-selenium-ide
Ver=$( sudo apt-cache policy firefox-selenium-ide | grep Installed | awk 'BEGIN {FS="Installed: "}{print $2}' )
if [ -z $Var ]; then
  echo '\nY' | sudo apt-get install firefox-selenium-ide 
else
  echo " firefox-selenium-ide is already installed, with version: [$Ver]"
fi
# echo '\nY' | sudo apt-get install idea
Ver=$( sudo apt-cache policy idea | grep Installed | awk 'BEGIN {FS="Installed: "}{print $2}' )
if [ -z $Var ]; then
  echo '\nY' | sudo apt-get install idea
else
  echo "Idea-IntelliJ is already installed, with version: [$Ver]"
fi
# echo '\nY' | sudo apt-get install jboss
Ver=$( sudo apt-cache policy jboss | grep Installed | awk 'BEGIN {FS="Installed: "}{print $2}' )
if [ -z $Var ]; then
  echo '\nY' | sudo apt-get install jboss
else
  echo "jboss is already installed, with version: [$Ver]"
fi
# echo '\nY' | sudo apt-get install jenkins
Ver=$( sudo apt-cache policy jenkins | grep Installed | awk 'BEGIN {FS="Installed: "}{print $2}' )
if [ -z $Var ]; then
  echo '\nY' | sudo apt-get install jenkins
else
  echo "jenkins is already installed, with version: [$Ver]"
fi
# echo '\nY' | sudo apt-get install pycharm
Ver=$( sudo apt-cache policy pycharm | grep Installed | awk 'BEGIN {FS="Installed: "}{print $2}' )
if [ -z $Var ]; then
  echo '\nY' | sudo apt-get install pycharm
else
  echo "pycharm is already installed, with version: [$Ver]"
fi
# echo '\nY' | sudo apt-get install python-tools
Ver=$( sudo apt-cache policy python-tools | grep Installed | awk 'BEGIN {FS="Installed: "}{print $2}' )
if [ -z $Var ]; then
  echo '\nY' | sudo apt-get install python-tools
else
  echo "python-tools is already installed, with version: [$Ver]"
fi
# echo '\nY' | sudo apt-get install ymersdk-cli
Ver=$( sudo apt-cache policy ymersdk-cli | grep Installed | awk 'BEGIN {FS="Installed: "}{print $2}' )
if [ -z $Var ]; then
  echo '\nY' | sudo apt-get install ymersdk-cli
else
  echo "ymersdk-cli is already installed, with version: [$Ver]"
fi
# echo '\nY' | sudo apt-get install versant
Ver=$( sudo apt-cache policy versant | grep Installed | awk 'BEGIN {FS="Installed: "}{print $2}' )
if [ -z $Var ]; then
  echo '\nY' | sudo apt-get install versant
else
  echo "versant is already installed, with version: [$Ver]"
fi
# echo '\nY' | sudo apt-get install postgres
Ver=$( sudo apt-cache policy postgres | grep Installed | awk 'BEGIN {FS="Installed: "}{print $2}' )
if [ -z $Var ]; then
  echo '\nY' | sudo apt-get install postgres
else
  echo "postgres is already installed, with version: [$Ver]"
fi
# echo '\nY' | sudo apt-get install motd
Ver=$( sudo apt-cache policy motd | grep Installed | awk 'BEGIN {FS="Installed: "}{print $2}' )
if [ -z $Var ]; then
  echo '\nY' | sudo apt-get install motd
else
  echo "motd is already installed, with version: [$Ver]"
fi
Ver=$( sudo apt-cache policy cdt2 | grep Installed | awk 'BEGIN {FS="Installed: "}{print $2}' )
if [ -z $Var ]; then
  echo '\nY' | sudo apt-get install cdt2
else
  echo "cdt2 is already installed, with version: [$Ver]"
fi
# echo '\nY' | sudo apt-get install enm-ide
Ver=$( sudo apt-cache policy enm-ide | grep Installed | awk 'BEGIN {FS="Installed: "}{print $2}' )
if [ -z $Var ]; then
  echo '\nY' | sudo apt-get install enm-ide
else
  echo "enm-ide is already installed, with version: [$Ver]"
fi
# echo '\nY' | sudo apt-get install netbeans
Ver=$( sudo apt-cache policy netbeans | grep Installed | awk 'BEGIN {FS="Installed: "}{print $2}' )
if [ -z $Var ]; then
  echo '\nY' | sudo netbeans-get install eclipse
else
  echo "netbeans is already installed, with version: [$Ver]"
fi
Ver=$( sudo apt-cache policy docker-engine | grep Installed | awk 'BEGIN {FS="Installed: "}{print $2}' )
if [ -z $Var ]; then
  echo '\nY' | sudo apt-get install docker-engine
else
  echo "docker-engine is already installed, with version: [$Ver]"
fi
Ver=$( sudo apt-cache policy docker-compose | grep Installed | awk 'BEGIN {FS="Installed: "}{print $2}' )
if [ -z $Var ]; then
  echo '\nY' | sudo apt-get install docker-compose
else
  echo '\nY' | sudo apt-get remove docker-compose
  echo '\nY' | sudo apt-get install -y docker-compose
fi
Ver=$( sudo apt-cache policy nodejs | grep Installed | awk 'BEGIN {FS="Installed: "}{print $2}' )
if [ -z $Var ]; then
  echo '\nY' | sudo apt-get install nodejs
else
  echo "nodejs is already installed, with version: [$Ver]"
fi
