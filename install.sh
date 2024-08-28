#!/bin/bash
set -e

do_install() {
    echo "Adding ENM-IDE GPG key..."
    sudo sh -c 'wget -O - https://cifwk-oss.lmera.ericsson.se/static/staticRepos/ide.gpg.key | apt-key add -'

    echo "Adding ENM-IDE PPA repository..."
    sudo sh -c 'echo "deb https://cifwk-oss.lmera.ericsson.se/static/staticRepos/ENM-IDE/IDE1_0/ trusty main" > /etc/apt/sources.list.d/enm.list'

    echo "Disable proxy for IDE repo..."
    sudo sh -c 'cat > /etc/apt/apt.conf.d/99ide_proxy <<EOF
Acquire {
  http {
    Proxy "http://www-proxy.ericsson.se:8080";
    Proxy::cifwk-oss.lmera.ericsson.se "DIRECT";
  }
}
EOF'

    echo "Adding Oracle Java 7 PPA repository..."
    sudo add-apt-repository -y ppa:webupd8team/java

    echo "Adding Google GPG key..."
    sudo sh -c 'wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -'

    echo "Adding Google Chrome PPA repository..."
    sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list'

    echo "Adding legacy Python PPA repository..."
    sudo add-apt-repository -y ppa:fkrull/deadsnakes

    echo "Configuring Oracle Java installer..."
    echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections
    echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections

    echo "Adding Ansible PPA repository..."
    sudo apt-add-repository -y ppa:ansible/ansible

#    echo "Adding Default Docker Configuration"
#    mkdir -p /etc/defaults
#    echo 'DOCKER_OPTS="--dns 8.8.8.8 --dns 8.8.4.4 --dns 193.181.14.10 -H tcp://0.0.0.0:2375 --insecure-registry atvts755.athtem.eei.ericsson.se:5000 -g /docker"' > /etc/defaults/docker

    echo "Adding Docker GPG key..."
    sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

    echo "Adding Docker Repository..."
    sudo sh -c echo 'deb "https://apt.dockerproject.org/repo ubuntu-trusty main" > /etc/apt/sources.list.d/docker.list'

    echo "Updating list of available packages..."
    sudo apt-get update

    echo "Installing packages..."
    sudo apt-get -y install enm-ide

    echo "Cloning ide-config git repo..."
    if [ ! -d ${HOME}/gitrepos/ide-config ]; then
        git clone ssh://gerritmirror.lmera.ericsson.se:29418/OSS/com.ericsson.de/ide-config ${HOME}/gitrepos/ide-config
        pushd ${HOME}/gitrepos/ide-config
        git remote set-url --push origin ssh://gerrit.ericsson.se:29418/OSS/com.ericsson.de/ide-config
        popd
    fi

    curl --silent -X POST https://fem101-eiffel004.lmera.ericsson.se:8443/jenkins/job/IDE_Record_Install/build --form json='{"parameter": [{"name":"IDE_USER","value":"'${USER}'"}]}' || true
}

# wrapped up in a function so that we have some protection against only getting
# half the file during "curl | sh"
do_install
