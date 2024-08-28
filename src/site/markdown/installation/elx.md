# ENM IDE : Installation - ELX

## Introduction

These instructions detail how to install and configure the ENM IDE on an ELX laptop.

> **ENM IDE Survey**<br/>
> Please take a few minutes to complete the [ENM IDE survey](http://webpoll.rnd.ericsson.se/poll.asp?ID=104201).

## Native ELX Installation

To install the IDE packages directly on an ELX laptop, copy this one line command and paste into a terminal window:

        curl 'https://gerrit.ericsson.se/gitweb?p=OSS/com.ericsson.de/ide.git;a=blob_plain;f=install.sh' | bash

## Install the IDE as a VM

> **Before you start**
>
>Before you install anything, please verify with your Scrum Master / team / tribe which optional packages apply to your scenario.
>
> Not all teams require the same packages for their build environment.

1. **Enable Virtualization**
    1. On bootup, press ESC key twice as soon as you see the HP welcome screen to enter the BIOS.
    2. Navigate to System Configuration → Device Configuration → Virtualization Technology toggle both check-boxes to [on].
    3. Save changes and exit.

2. **Git & SSH Keys**

Git must be pre-installed and you must have SSH keys generated. If your a new user and you don't have SSH Keys or Git setup please go to this page. [Git & SSH Keys setup for ELX](https://arm1s11-eiffel004.eiffel.gic.ericsson.se:8443/nexus/content/sites/tor/IDE/snapshot/installation/elx-ssh-git-config.html)

4. **Ericsson User Accounts**
 - Ericsson user accounts created and enabled for access to gerrit and Ericsson git repo's.

## Installation - Steps
1. **VirtualBox**
> **Note**:
> Install the latest 4.3.x version only!
> Do not install version 5.x as it's _not compatible_ with the IDE VM.

        sudo apt-get update

        sudo apt-get install virtualbox

2. **VirtualBox Add-ons : Download Extension Pack**
    1. Open : https://www.virtualbox.org/wiki/Download_Old_Builds_4_3_pre24
    2. Search for version as installed :
        1. Launch VirtualBox.
        2. Open Help menu, About VirtualBox menu.
        3. The About dialog opens, this includes the version applicable
        4. 'VirtualBox Graphical User Interface version 4.3.10 ....'
    3. Download the associated **Extension Pack → All Platforms**.

3. **VirtualBox Add-ons**
    1.  Installation will continue through VirtualBox. Click on **Install** &amp; follow instructions :<br/>
    ![VB](../images/vb1.png)
    2. Scroll through resulting License and click **I Agree** button once enabled
    3. Provide LAN password for authentication when requested and click on **Authenticate** to continue.
    4. Once installation is completed, close VirtualBox and restart your laptop.
4. **Vagrant**
    1. Go to : http://www.vagrantup.com/downloads.html
    2. Download latest vagrant for Ubuntu 14.04 64-bit.
    3. Choose to install via Software Centre :<br/>
    ![VT](../images/vt1.png)
    4. Provide LAN password when requested and click **Authenticate** to install.

5. **Create gitrepos folder in your home directory, this folder will be shared with your vm.**

        $ mkdir ~/gitrepos

6. **Clone the ENM IDE repo :**

        $ cd ~/gitrepos
        ~/gitrepos$ git clone ssh://gerritmirror.lmera.ericsson.se:29418/OSS/com.ericsson.de/ide

7. **Change directory and start vagrant :**
> **Note:** By default the VM starts in headless mode but if you set the variable VAGRANT_DESKTOP=true the VM will start in full desktop mode.

        # cd to vagrant home
        ~/gitrepos$ cd ide/vagrant

        # Downloads the vagrant VM  and provision the IDE (10 mins)
        ~/gitrepos/ide/vagrant$ vagrant up

        # Reboot the vagrant VM  (30 secs)
        ~/gitrepos/ide/vagrant$ vagrant reload

        # Connect to vagrant VM
        ~/gitrepos/ide/vagrant$ vagrant ssh -p`
