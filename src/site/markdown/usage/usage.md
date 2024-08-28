# ENM IDE : Usage - Windows & ELX

## Introduction

This page details how to use the ENM IDE components in a Windows or ELX development environment.

### Launch Vagrant VM - ELX
> **Note:** By default the VM starts in headless mode but if you set the variable VAGRANT_DESKTOP=true the VM will start in full desktop mode.

        # cd to vagrant directory in ENM IDE :
        cd <path_to_gitrepos>/ide/vagrant

        # Start vagrant :
        ~/<path_to_gitrepos>/ide/vagrant$ vagrant up

        # connect to vagrant
        ~/<path_to_gitrepos>/ide/vagrant$ vagrant ssh -p

        # in vagrant VM - launch application
        vagrant@vagrant-ubuntu-trusty-64:~$ eclipse &

### Launch Vagrant VM - Windows
> **Note:** By default the VM starts in headless mode but if you set the variable VAGRANT_DESKTOP=true the VM will start in full desktop mode.

        # cd to vagrant directory in ENM IDE :
        cd <path_to_gitrepos>\ide\vagrant

        # Start vagrant :
        c:\<user>\<path_to_gitrepos>\ide\vagrant> vagrant up

        # connect to vagrant
        c:\<user>\<path_to_gitrepos>\ide\vagrant> vagrant ssh -p

        # in vagrant VM - launch application
        vagrant@vagrant-ubuntu-trusty-64:~$ eclipse &

### Development Environment - Usage

#### Installed IDE Packages

The installed versions of the ENM IDE packages can be displayed using this command:

        $ dpkg-query -W $( apt-cache depends enm-ide | sed "s/^  Depends: //" )

#### Shared Directories

A few directories are shared between the laptop and the IDE Vagrant VM to provide a convenient way to share files:

| Windows | ELX | Vagrant VM |
| --- | --- | --- |
| Vagrantfile location      | Vagrantfile location | /vagrant |
| C:\\&lt;user&gt;          | ~                    | /mnt/&lt;user&gt; (read only) |

#### Team Specific Configurations

Teams can add their own configuration scripts to the OSS/com.ericsson.de/ide-config git repository.

This repository is cloned into $HOME/gitrepos/ide-config during provisioning of the Vagrant guest VM.

The idea is that teams create a directory in this repository containing scripts and configuration files for further customising their IDE configuration.


#### Common Tools
**Git**

Your SSH keys are copied from your laptop when Vagrant provisions the VM so you can use git in the normal fashion.

The recommended location for git repositories is ~/gitrepos because this directory is shared between the VM and your laptop.

**Maven**

The Maven installation is already customised with the ENM settings.xml so no further configuration is necessary.

**Eclipse**

Eclipse is pre-installed with most common plugins from the LMI-TOR feature group and can be started using:

Start Eclipse :

        $ eclipse &

**PyCharm**

PyCharm is installed by default and can be started using:

        $ pycharm.sh

Note that the Initial Configuration may prompt for a password with the message:

        Authentication is needed to run `.PyCharm50/system/tmp/launcher_installer0.sh' as the super user
Just dismiss this password prompt and ignore the error message and the setup will continue just fine.

**Important**
> The Eclipse pom editor is broken and needs to be removed as default editor.<br/>
> Window → Preferences → Maven → User Interface → Enable "Open XML page in the POM editor by default"<br/>
> Yes, _Enable_ - Even the toggle is the wrong way around!

_**Hint** - Using an ampersand (&) at the end of the command launches the application and returns to the command prompt so you can continue easily._

**JBoss**

The JBoss service is deliberately not started automatically.<br/>
It can be started using `$ sudo service jboss-as start`.

The JBoss web UI is available through Firefox or Chrome using:

`$ firefox http://localhost:8080 &`<br/>
or<br/>
`$ firefox http://localhost:9990 &`

The default username and password for the JBoss admin console is jboss / Jboss#123.

> **Please note** that there are no databases created when installing Versant or PostgreSQL.
