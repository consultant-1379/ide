# Git & SSH Keys : Installation - ELX

## Introduction

These instructions detail how to install and configure your ssh key and Git on a ELX.

## Install GIT
	
	sudo apt-get install git

## Generate your ssh keys

1. **Install OpenSSH SSH client (remote login program) **

        sudo apt-get install ssh

2. **List existing files in your .ssh directory  **

        ls -al ~/.ssh

3. **Create a new ssh key, using the provided email as a label. **
       
        ssh-keygen -t rsa -C "your_email@ericsson.com"
	
        Generating public/private rsa key pair.
        #Enter file in which to save the key (/home/you/.ssh/id_rsa):
	
4. **Next, you'll be asked to enter a passphrase. Leave blank if you don't want to enter a passphrase. **

Once complete it should give you something like this:

	Your identification has been saved in /home/your-signum/.ssh/id_rsa.
	# Your public key has been saved in /home/your-signum/.ssh/id_rsa.pub.
	# The key fingerprint is:
	# 01:0f:f4:3b:ca:85:d6:17:a1:7d:f0:68:9d:f0:a2:db your_email@example.com

5. **Start the ssh-agent in the background **

        eval "$(ssh-agent -s)"

6. **Finally add your new key into your file **

        ssh-add ~/.ssh/id_rsa

## .gitconfig configuration

>The first thing you should do when you install Git is to set your user name and email address. This is important because every Git commit uses this information, and it’s immutably baked into the commits you start creating:

        git config --global user.name "Your Name"
        git config --global user.email your.email@ericsson.com


## Adding ssh key to Gerrit Central

6. **Enter your SSH key in Gerrit **
	- Sign in to the [Gerrit Central](https://gerrit.ericsson.se/login/%23%2Fq%2Fstatus%3Aopen)
	- Click Settings,
	- Click SSH Public Keys
	- Click Add Key
	- Open a terminal and type: cat ~/.ssh/id_rsa.pub
	- Copy the whole text (including ssh-rsa) and paste this into the pane of gerrit.
	- Click Add
	- Run the following command from a shell to verify ssh key is setup correctly

        ssh -T -p 29418 gerrit.ericsson.se
	

