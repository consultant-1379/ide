# ENM IDE : Solution Overview

## What is the ENM IDE?

The IDE is a set of pre-configured packages that make up a standard environment for developing products in PDU NAM.<br />
The main goal is to simplify and speed up the process of installing software for designing and testing our products.<br />
The packages are maintained as Ubuntu .<br />
The IDE can be installed natively on [ELX](https://wiki.lmera.ericsson.se/wiki/ELX) or through [Vagrant](https://www.vagrantup.com/) / [VirtualBox](https://www.virtualbox.org/) on Windows®.

![Overview](images/Overview.png)

**(!) Note :** The IDE can also be installed in [VirtualBox](https://www.virtualbox.org/) through Vagrant on [ELX](https://wiki.lmera.ericsson.se/wiki/ELX) laptops for prototyping or to facilitate multiple environments.

The IDE ensures consistent configuration between environment by distributing the same set of packages.

Updates are facilitated through the Ubuntu [APT](https://en.wikipedia.org/wiki/Advanced_Packaging_Tool) tool.

## Why do we need an IDE?

Using a pre-configured IDE makes it quick and easy for new designers to get started.

The IDE is intended to replace the many Confluence pages used to install and configure the necessary tools for developing ENM components.

Using a common environment also ensures consistent tool versions for team members and simplifies troubleshooting.

## IDE Architecture

The IDE is distributed as Ubuntu packages to facilitate both Windows® and ELX users.
A minimal default set of packages are grouped as dependencies of the enm-ide [meta package](https://help.ubuntu.com/community/MetaPackages) to simplify manual installations.
Some of the packages are just standard Ubuntu packages, like git, others include custom settings, like maven.

Performing an installation through Vagrant also populates the VM with the current users login ID, SSH keys and shares the local git repositories with the guest OS.

![Architecture](images/Architecture.png)

## IDE Content
### Standard Packages
| Package | Name     | Version    |
|
### Custom Packages
| Package | Name                       | Version    |
| ------- | -------------------------- | ----------:|
| <img src="images/Maven_Logo.png" alt="Maven" height="28"/>     | Maven                         | 3.0.5      |
| <img src="images/Eclipse_Logo.png" alt="Eclipse" height="28"/> | EECS Eclipse                  | Luna       |
| <img src="images/Plugins_Logo.png" alt="Plugins" height="28"/> | Eclipse LMI-TOR Feature Group | ~          |
| <img src="images/JBoss_Logo.png" alt="JBoss" height="28"/>     | JBoss EAP                     | 6.2.4      |
| <img src="images/PyCharm_Logo.png" alt="PyCharm" height="28"/> | PyCharm                       | 5.0.3      |
| <img src="images/Ansible_Logo.png" alt="Ansible" height="28"/> | Ansible                       | 2.0.0.2    |
### Optional Packages
| Package | Name                         | Version  |
| --- | ------------------------------- | --------:|
| <img src="images/Versant_Logo.png" alt="Versant" height="28"/> | Versant                         | 8.0.2.38 |
| <img src="images/PostgreSQL_Logo.png" alt="PostgreSQL" height="28"/> | PostgreSQL | 9.3.9 |
| <img src="images/YmerSDK_Logo.png" alt="YmerSDK" height="28"/> | YMER SDK                        | 1.0.27   |
| <img src="images/Netbeans_Logo.png" alt="Netbeans" height="28"/> | Netbeans                        | 8.0.2    |
| <img src="images/Intellij_Idea_Logo.png" alt="IDEA" height="28"/> | IntelliJ IDEA Community Edition | 14.1.3   |
| <img src="images/Jenkins_Logo.png" alt="Jenkins" height="28"/> | Jenkins                         | 1.596.2  |

## Future of the IDE

Automating many parts of the installation process.

Provision the IDE environment on terminal servers in the Linköping HUB.
