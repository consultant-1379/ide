# Git & SSH Keys : Installation - Windows®

## Introduction

These instructions detail how to install and configure your ssh key and Git on a Windows laptop.

## Install GIT Client

1. **Go to http://git-scm.com/ **
2. **Download the git installer for windows**
3. **Run the installer.**
4. **Installation Wizard Steps**
	1. Select Destination Location
		- Use default location provided.
	2. Select Components        	
		- Tick the check boxes for "Windows Explorer Integration"
		- Also tick the check box for Desktop shortcut "On the Destop"
	3. Select Start Menu Folder
		- Use default name provided.
	4. Adjusting your PATH environment
		- Select "Use Git from the Windows Command Prompt"
	5. Configuring the line endings conversions
		- Select "Checkout window-style, commit Unix-style line endings"
	6. Configuring the terminal emulator to use with Git Bash
		- Select "Use MinTTY"
	7. Configuring experimental performance tweaks
		- leave unticked
	8. Finish

## Configure Git

> Git should now be installed. Perform the following steps to configure it. The default home directory points to H:\. You should change this to C:\Users\<signum>, so that your settings are available when you are offline. To do that, create/set an environment variable with that value called HOME:

1. **Go to the Control Panel in the start menu **
2. **Select System & Security **
3. **Selct System **
4. **Select Advanced system settings **
5. **Select Environment variables **
6. **In the User variables section, select variable HOME and ensure that it is set to C:\Users\<signum>. **
        

> You will need to Update our git bash shortcut and use %HOME% to set the start up directory.

1. **Right click your git bash shortcut in your Desktop **
2. **Select Properties **
3. **Change the value of ‘Start in:’ field to %HOME%. **
4. **Click OK. **

## .gitconfig configuration 

>The first thing you should do when you install Git is to set your user name and email address. This is important because every Git commit uses this information, and it’s immutably baked into the commits you start creating:

        git config --global user.name "Your Name"
        git config --global user.email your.email@ericsson.com


## Generate your ssh keys

>The Git server (Gerrit) uses SSH keys for authentication. To be able to push your commits to the server, your public SSH key will need to be registered on the server.


1. **Start Git Bash **
2. **Execute ssh-keygen -t rsa **
3. **Press enter when prompted with: Enter file in which to save the key **
4. **The next prompt is: Enter passphrase (empty for no passphrase) - If you want, just hit enter here for passwordless login. **
5. **The SSH public key will be generated in .ssh/ directory under your home directory, typically C:\Users\<username>\.ssh\id_rsa.pub **
6. **Enter your SSH key in Gerrit **
	- Sign in to the [Gerrit Central](https://gerrit.ericsson.se/login/%23%2Fq%2Fstatus%3Aopen)
	- Click Settings,
	- Click SSH Public Keys
	- Click Add Key
	- Use Windows Explorer to open the .ssh folder
	- Right-click the id_rsa.pub file and select "Open With" to open the file with notepad or wordpad
	- Copy the whole text (including ssh-rsa) and paste this into the pane of gerrit.
	- Click Add
	

