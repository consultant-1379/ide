# ENM IDE : What's included?

## Introduction

This page details the packages included and any configuration requirements.

> **Before installing anything**
> Before you install anything, please verify with your Scrum Master / team / tribe which optional packages apply to your scenario.
Not all teams require the same packages for their build environment.

## Default Packages
> **Note :** To run any application in ELX just open in the usual manner through the ELX launcher or use the following command on the terminal.

| Package                                                           | Product                       | Package name   | Version    |
| ----------------------------------------------------------------- | ----------------------------- | -------------- | ----------:|
| <img src="../images/Git_Logo.png" alt="Git" height="28"/>         | Git                           | git            | 3.0.5      |
| <img src="../images/Java-Logo.png" alt="Java" height="28"/>       | Oracle Java                   | java           | latest 1.7 |
| <img src="../images/RPM_Logo.png" alt="RPM" height="28"/>         | rpm                           | rpm            | 4.11.10    |
| <img src="../images/Maven_Logo.png" alt="Maven" height="28"/>     | Maven                         | maven          | 3.0.5      |
| <img src="../images/Eclipse_Logo.png" alt="Eclipse" height="28"/> | EECS Eclipse                  | eclipse        | Luna       |
| <img src="../images/Plugins_Logo.png" alt="Plugins" height="28"/> | Eclipse LMI-TOR Feature Group | eclipse-lmitor | ~          |
| <img src="../images/JBoss_Logo.png" alt="JBoss" height="28"/>     | JBoss EAP                     | jboss          | 6.2.4      |
| <img src="../images/Docker_Logo.png" alt="Docker" height="28"/>   | Docker                        | docker-engine  | 1.8.2      |
| <img src="../images/IKE_Logo.png" alt="IKE" height="28"/>         | Shrew Soft IKE                | ike            | 2.2.1      |
| <img src="../images/PyCharm_Logo.png" alt="PyCharm" height="28"/> | PyCharm                       | pycharm        | 5.0.3      |
| <img src="../images/Ansible_Logo.png" alt="Ansible" height="28"/>    | Ansible                       | ansible        | 2.0.0.2    |
### Optional Packages
| Package                                                                 | Product                         | Package name | Version  |
| ----------------------------------------------------------------------- | ------------------------------- | ------------ | --------:|
| <img src="../images/Versant_Logo.png" alt="Versant" height="28"/>       | Versant                         | versant      | 8.0.2.38 |
| <img src="../images/PostgreSQL_Logo.png" alt="PostgreSQL" height="28"/> | PostgreSQL                      | postgres     | 9.3.9    |
| <img src="../images/YmerSDK_Logo.png" alt="YmerSDK" height="28"/>       | YMER SDK                        | ymersdk-cli  | 1.0.27   |
| <img src="../images/Netbeans_Logo.png" alt="Netbeans" height="28"/>     | Netbeans                        | netbeans     | 8.0.2    |
| <img src="../images/Intellij_Idea_Logo.png" alt="IDEA" height="28"/>    | IntelliJ IDEA Community Edition | idea         | 14.1.3   |
| <img src="../images/Jenkins_Logo.png" alt="Jenkins" height="28"/>       | Jenkins                         | jenkins      | 1.596.2  |

## Installing packages

      $ sudo apt-get update
      $ sudo apt-get install <package name> [package name]
