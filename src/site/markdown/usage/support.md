# ENM IDE : Getting Support

## Introduction

This page details how to request support for the ENM IDE.

### Check with your team

The first stop for any questions or problems with anything should always be your own team or someone you know who is using the same thing.

### Submit a Jira

To create a ticket, please use the button below and configure the following fields:

* Project: Continuous Integration Services
* Component/s: IDE
* Please make sure you do NOT include a fix version, as the ticket will not appear on the board
* Please create a ticket of type Support, Task or Bug

[![alt Request Support](../images/Request_Support.png)](http://jira-nam.lmera.ericsson.se/secure/CreateIssue!default.jspa?selectedProjectId=17431)

### Manual cleanup of Vagrant boxes

In some cases it might be necessary to clean up partial and broken VirtualBox VMs.  
For example, if a network disruption leaves a partially downloaded image or an old base image conflicts with a new one.

#### First try to let Vagrant do it's thing using the commands:

List any existing vagrant boxes using  

    vagrant box list
Remove any listed boxes using  

    vagrant box remove -f <box name>
For example:  

    $ vagrant box list
    ENM/16B (virtualbox, 0)
    $ vagrant box remove -f ENM/16B
#### To completely clean out all VirtualBox VMs and Vagrant boxes.
There are four directories that contain images and meta-data.  
Remove:

* C:\\Users\\&lt;signum&gt;\\VirtualBox VMs
* C:\\Users\\&lt;signum&gt;\\.VirtualBox
* C:\\Users\\&lt;signum&gt;\\.vagrant.d
* C:\\Users\\&lt;signum&gt;\\gitrepos\\ide\\vagrant\\.vagrant
