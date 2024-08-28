# ENM IDE : Installation - Windows®

This is an handbook on how to install, configure and troubleshoot the ENM IDE for Windows.

#<a name="Menu"></a> Table of Contents
1. [Introduction](#Introduction)
2. [Prerequisites](#Prerequisites)

	2.1. [EnableVirtualization](#EnableVirtualization)
	
	2.2. [Memory](#Memory) 
	
	2.3. [Git&SSH](#Git_SSH)
	
	2.4. [WindowsEnvironment](#WindowsEnvironment)

       2.5. [Prepare to Run The ENM IDE Windows® Installer](#Install)

       2.6. [Quick Porting from PIEDE to IDE](#FromPIEDEtoIDE) 

       2.7. [Prepare to Install IDE from scratch. New Windows PC](#InstallFromScratch)

3. [Install ENM-IDE step by step](#DownloadIDE-INSTALLER)

	3.1. [Run  in Desktop Mode](#DesktopMode)
	
	3.2. [Run in HeadLess Mode](#HeadLessMode)

4. [After Installation](#AfterInst)

	4.1. [UserNames and Passwords](#UserAndPwd)
	
	4.2. [Install additional components](#InstallAddOns)
	
	4.3. [Install additional components](#InstallAddOns)

       4.3.1. [Update apt list and install packages](#apt-getUpdate)

5. [How to and FAQ](#HOW-TO)

       5.1. [How to restore a new ENM_IDE-Base without reinstall all ENM-IDE](#ENM-IDE_Restore)

       5.2. [How to install nodejs and cdt2 on IDE (for ENM-GUI developers)](#NodeJs)
        
      5.3. [How to install python-pip and following python libraries on IDE (for ENM-Python developers)](#PythonPIP)

       5.4. [How to use Eclipse/Netbeans on IDE](#EclipseNetbUsage)
	
	5.5. [How to add npm plugin into Netbeans/Eclipse/Intellij](#AddNPM)
	
	5.6. [How to create a new Versant databse on IDE](#CreateVersantDB)
		
	5.7. [How to configure and use Dockers on IDE](#DockerConfig)
	
	5.8. [How to extend RAM size on IDE](#ExtendRAMSpace)

	5.9. [How to Increase/Decrease upper memory limit on IDE](#IncrDecrUpperMemLimit)
	
	5.10. [How to make the Amount of memory for IDE automatically calculated ](#AutoCalcRAMforIDE)
	
	5.11. [How to configure dynamic or static memory allocation on IDE](#DynamicOrStaticRAMforIDE)
	
	5.12. [How to save your ENM-IDE VM and/or copy/move on another PC or VirtualBox HyperV](#MoveYourMachine)
	
	5.13. [How to extend disk space on IDE](#ExtendDiskSpace)
	
	5.14. [How to safety reduce disk space on IDE](#ReduceDiskSpace)
	
	5.15. [How to easy save and restore your ENM-IDE if crashes](#SaveRestoreDiskImage)
	
	5.16. [How to set and use VPN tunnel to reach ITTE NetSim network with ENM-ID](#UseVPNFromENMIDE)

	5.17. [How to easy compact ENM-IDE box-disk1 file disk size](#CompactDiskImage)	
	
6. [Upgrade IDE and packages](#UpgradeIDE)

	6.1. [How to upgrade Docker on IDE](#UpgradeDocker)

	6.2. [How to upgrade Eclipse on IDE](#UpgradeEclipse)

       6.3. [How to get new Vagrantfile and apply changes](#GetNewVagrantfile)	

7. [Troubleshooting](#TroubleShoot)

	7.1. [Alternative mode to install additional packages](#UseAddOns)
	
	7.2. [Errors on access to Versant database during Acceptance tests on IDE](#ErrorsAccessVersant)
	
	7.3. [IDE becomes slow due to abnormal increase of used disk space](#NoLeftSpace)
	
	7.4. [IDE Boot Failures](#IDEDoNotStart)
	
	7.4.1. [Generic failure during boot up](#GenericIDEBootFail)
	
	7.4.2. [Couldn't open file....](#CantOpenFile)
	
	7.4.3. [Boot failed: STATUS_NO_SUCH_DEVICE (rc=-101)](#NOSuchDev)
	
	7.4.4. [Boot Error: "couldn't remount RDWR because of unprocessed orphan inode list..."](#CantRemountRDWR)
	
	7.4.5. [IDE Don't start: new VM is created](#IDENotVisibleInVBox)

       7.4.6. [IDE Don't start: any effect by clicking more time on ENM_IDE desktop icon nor running "vagrant up"](#IDENotVisibleInVBox)
	
	7.4.7. [IDE Don't start: stuck on "Ubuntu" user prompt](#IDEStuckOnUbuntuUser)

       7.4.8. [CDT2 Install Failure: npm ERR! Error: EACCES: permission denied, mkdir '/home/egiomor/.npm/cdt-serve'](#IDE_InstallCDT2ERR)

       7.4.9. [ENM-IDE don't start: double click on desktop icon does not have any effect](#IDE_NotStartChangeBatch)

       7.4.10. [ENM-IDE don't start: the desktop of your ENM-IDE's VM is dark and no commands/click have any effects](#IDE_DarkDesktop)

       7.4.11. [Boot failed: "sudo: parse error in /etc/sudoers near line... "](#SudoersError)

      7.5. [OTHER Common Troubles](#OtherTroubles)
        
      7.5.1. [Windows home dir not mounted on IDE](#HomeDirNotMounted)
        
      7.5.2. [Trouble installing Eclipse plugins](#TrbleEclipsePlugin)

       7.5.3. [Couldn't resolve host using docker-compose](#TrbleDNS)

       7.5.4. [Package Install Failure:  resolve host using docker-compose](#TrbleDNS)

8. [Uninstall Instructions](#Uninst)

 8.1. [Uninstall Virtual Box](#UninstVirtBox)
	
 8.2. [Uninstall ENM-IDE from your Windows PC](#UninstallIDE)
 
9. [Create Vagrant machine clone](#clone)


#<a name="Introduction"></a>**1. Introduction** 


These instructions detail how to install and configure the ENM IDE on a Windows laptop.

Please follow carefully following "Prerequisites" chapter to prepare your Windows PC to the installation of IDE.

**IMPORTANT:**

	IDE is not a normal VirtualBox machine. 

ENM-IDE is an "open system":  a machine that, starting from a base-image (that is a standard base Ubuntu trusty machine) can be configured on the fly each time you boot them.
 
ENM-IDE is not an isolated system as normal VirtualBox image machines, becasue you can clone your Windows user's configuration into the ENM_IDE, totally or partially as you prefer.

Into ENM-IDE in fact you will be logged with the same user you are normally logge into your Windows PC (that normally is your E/// signum), and in that home dir you will have for example automatically cloned the same .m2 maven dir and your .ssh dir.

This means that to work fine, you must not run IDE in classic mode, pressing the "Start"  button that is on the top menu of VirtualBox.

To run ENM-IDE you have to use the ENM_IDE desktop icon, or, open a Git Bash on your PC and type 

       $ cd /c/Users/<yoursignum>/gitrepos/ide/vagrant
       $ vagrant up
	

	
[back to menu](#Menu)

#<a name="Prerequisites"></a>**2. Installation - Prerequisites**

> **Before you start**
>
>Before you install anything, please verify with your Scrum Master / team / tribe which optional packages apply to your scenario (cdt2, netbeans, intellij, docker,  eclipse,  etc.).
>
>Not all teams require the same packages for their build environment.

[back to menu](#Menu)

##<a name="EnableVirtualization"></a>**2.1. Enable Virtualization on your Windows PC**

    1. On your PC bootup, press ESC key twice as soon as you see the HP welcome screen to enter the BIOS.
    2. Navigate to System Configuration → Device Configuration → Virtualization Technology toggle both check-boxes to [on].
    3. Save changes and exit.

[back to menu](#Menu)

##<a name="Memory"></a> **2.2. Memory on your Windows PC**

   RAM >= 8GB (12GB recommended. IDE uses 4GB by default, but this amount can be increased following instructions [here](#ExtendRAMSpace) )
    
   Hard Disk >= 15GB of free disk space (max 40GB by default but this upper limt can be increased following carefully instructions [here](#ExtendDiskSpace), or reduced following instructions [here](#ReduceDiskSpace)).
> **Note:** 
> IDE uses 4GB of the available physical memory for itself and work with a virtual ".vmdk" disk with a space that is dynamically allocated among 10GB (min) and 40GB (max).
> So your physical hard disk on Windows PC could need to have up to 40GB free depending on what you have to store on IDE.
> You can in any case work fine with minimum requirements if:
>>1) You might need to reduce the number of running applications in Windows, especially browsers, so the installation will run smoothly.
> 2) Is suggested to leave free on your Windows PC hard disk a much higher amount of disk space  than the required reported above (>= 40GB). This because IDE mounts on its file system under /mnt/`<signum>` your local windows C:\Users\ `<signum>` home directory. So, if you kept enough space there, you could use your Windows PC physical home directory to store there your development "workspace" of Eclipse or Netbeans.

[back to menu](#Menu)

##<a name="Git_SSH"></a>**2.3. Git & SSH Keys on your Windows PC**  (**VERY IMPORTANT**)

   Git must be pre-installed and you must have SSH keys generated. If your a new user and you don't have SSH or Git setup please go to this page. [Git & SSH Keys setup for Windows](https://arm1s11-eiffel004.eiffel.gic.ericsson.se:8443/nexus/content/sites/tor/IDE/snapshot/installation/windows-ssh-git-config.html)

[back to menu](#Menu)

##<a name="WindowsEnvironment"></a>**2.4. Windows Environment **

    You can successfully install the IDE only if you start from a correct  windows environment on your PC.

Here below the compatibility table among main components for ENM-IDEv1.0. 
Other versions of O.S. specified in that table are not tested, so if you using different O.S types or different O.S. versions than specied in this table you do that at your risk. 

     O.S.	    Oracle VirtualBox    Vagrant        
    Windows 7       <= 5.0           1.8.1          
    Windows 7       >= 5.1           1.9.3          
    
For example a successfully tested schema is this:

     O.S.	        Oracle VirtualBox           Vagrant        
     Windows 7  	5.1.28r117968 + ExtPack 	1.9.3

####**IMPORTANT NOTE**:   *Windows 10 users*

      a partial test of ENM-IDE using Windows 10 has been done with following confguration:
      
     O.S.	        Oracle VirtualBox           Vagrant        
     Windows 10 	5.1.28r117968 + ExtPack 	1.9.3
    
    If Windows 10 is important to disable native Dockers becasue they activate by default Hyper-V and so locks Vagrant to read BIOS VT-x status as "disabled"  even if it has been enabled.

   


    
First thing to check is, if you have an already installed IDE version, completely uninstall that following [Uninstall](#UninstallIDE)  procedure at the end of this manual.


If you never installed IDE on your PC,  for a correct installation it is mandatory to be sure that:
    
    1. if you have an already installed VirtualBox more recent than containd into ide-installer packet, ide-installer itself will ask you if you want to overwrite that, warning you that in case you decide to keep the already installed one, IDE couldn't start. 
	This could happen if some specific personalized configuration present on the already installed VirtualBox could don't match with the expected one by IDE.  
    
    2. check in your your C:\Users\ `<signum>`\"your-Directory-Where-You-Have-VMs" if is present the directory with name "ENM_IDE_Base" and if yes, remove that.
    
    3. check if this directory is present the C:\Users\ `<signum>`\.VirtualBox\VirtualBox.xml, if yes, open it and, if present, you have to remove the row that contains the file "MachineEntry" with ENM_IDE_Base like as following: 
>     "`<MachineRegistry>`"
      <MachineEntry uuid="{7d7aa04d-ea6e-4ead-8506-8dd103fb2fed}" src="C:\Users\eenrall\VirtualBox VMs\ENM_IDE_Base\ENM_IDE_Base.vbox"/>
    " `</MachineRegistry>` " 
    
    4. check if this directory is present the C:\Users\ `<signum>`\.vagrant.d directory and eventually 
       remove that
    
> <a name="EnvVariablesToBeRem"></a>**Important:** If you have previously defined the VAGRANT_DETECTED_OS environment variable you have to remove it.  
> If you have into the PATH environmenet variable the path of cygwin (i.e. something like this:  ... ;C:\cygwin64\bin; ...) you have to remove it.
> You can restore it after the installation but the installer won't do it automatically.

[back to menu](#Menu)    

##<a name="Install"></a>**2.5. Prepare to run The ENM IDE Windows® Installer**

The ENM Installer is a self contained Windows® executable that installs the required Virtualization tools to run the ENM IDE:
* Oracle VirtualBox and Extension pack
* VcXsrv Windows X Server
* Vagrant environment configurator

**Note:** Before running the installer for the first time it's a good idea to remove any previous installations of the tools listed above.

[back to menu](#Menu)


##<a name="FromPIEDEtoIDE"></a>**2.6. Quick Porting from PIEDE to IDE**

For developers that are using previous version of development environment on VM, named P.I.E.D.E.,  this chapter is a guide to want to easy move to ENM-IDE VM.

IMPORTANT:   after you installed new ENM-IDE never copy the .ssh that you created into the oldest P.I.E.D.E.  into the ENM-IDE. you must to have a .ssh on your home dir in Windows PC or leave that ide-installer will create a new one.
So:
1) if you never installed Git on your Windows PC and/or you don't have a .ssh you should follow steps since next par 3.2, but important

2) if you have already installed Git on your Windows PC and you have also a .ssh dir into your "C:\Users\ `<yoursignum>`"  directory you can follow steps starting since 3.3.

Please keep in mind that P.I.E.D.E is a "closed system", that means a machine that have a predefined disk size, memory usage, and and its own interna configuration, with any correlation with your Windows host configuration, for example any relationship with your Windows E/// user's configuration.
Instead ENM-IDE is an "open system"  that means a system that is configured on the fly at each boot, and that import into itself each part as you whant of your Windows PC user's configuration.
This is possibile becasue ENM-IDE VM is not an ISO precofigured machine, imported in VirtualBox, but is created on-the-fly by using a program  named "Vagrant" that is able to create Virtual machines on the fly starting from a base image. 
ENM-IDE is an "open system":  a machine that, starting from a base-image (that is a standard base Ubuntu trusty machine) can be configured on the fly each time you boot them. 
ENM-IDE is not an isolated system as normal VirtualBox image machines, becasue you can clone your Windows user's configuration into the ENM_IDE, totally or partially as you prefer.
Into ENM-IDE in fact you will be logged with the same user you are normally logge into your Windows PC (that normally is your E/// signum), and in that home dir you will have for example automatically cloned the same .m2 maven dir and your .ssh dir.
All these customizations are possible only if you boot your machine with  "Vagra personalizing and configuring your VM at each boot according to configuration instructinos written into a configuration file named "Vagranfile", that can be changed by user to personalize and adapt the VM for his specific scopes.

[back to menu](#Menu)

##<a name="InstallFromScratch"></a>**2.7. Prepare to Install IDE from scratch. New Windows PC**
	

###To install ENM-IDE into a brand new PC you should read carefully the  [Prerequisites](#Prerequisites) section chapter 2, and in detail, you have to focus on the 2.3 Git&SSH paragraph 
###To use IDE is mandatory to previously install and configure in your brand new Windows PC, the "Git" package, and then create your ssh keys on your Windows PC following the instructions in that 2.3 paragraph [Git&SSH](#Git_SSH)

But in any case if you cannot reach the link with Git&SSH instructions, or you haven't time to read that, you can try to rus ide-installer's "Setup.bat" and leave to ide-installer itself to install Git in your PC and create there your new ssh keys.
But in this case, you have to be careful that:

	a) ide-installer has really installed "Git"  on your PC

	b) ide-installer has really created your new private and public keys in your Windows PC home dir under ~\.ssh dir

	c) when ide-installer will prompt you with Notepad the content of the public key that it have generated for you, you have to don't proceed until you do following actions:
	-  copy that key and added that in Gerrit into the set of SSH keys in your user's "Gerrit->Settings"
	- open a git bash on your Windows PC, 
	- go into your home directory "cd /c/Users/ `<yoursignum>`
	- type following command, where "`yoursignum`" mut be your E/// signum: 
	- "git clone ssh://yoursignum@gerrit.ericsson.se:29418/OSS/com.ericsson.de/ide-config" 

If for any reason your IDE won't  be started, take a look into the TroubleShooting section or open a ticket to CI-Infra Gitmo board like this: https://jira-nam.lmera.ericsson.se/browse/CIS-49354


#<a name="DownloadIDE-INSTALLER"></a>**3. Install ENM-IDE step by step.**

####1) Download the [ENM_IDE](https://arm1s11-eiffel004.eiffel.gic.ericsson.se:8443/nexus/service/local/artifact/maven/redirect?r=releases&amp;g=com.ericsson.de&amp;a=ide-installer&amp;p=zip&amp;v=RELEASE) zip file, unpack it and run the "Setup.bat".

. Before do to anything it is mandatory to be sure that you have done all in "Prerequisites" section above.
. Take a look if you have in your Windows PC home directory: C:\Users\ `<signum>`\ .ssh the public key file.

1. Stop all installed and running VirtualBox processes (check using Resource Monitor and eventually kill all "VBoxSVC.exe" and  "VirtualBox.exe" processes)

2. Is if the first time that you run this installer on your PC, following input box will appear asking to add the installer certificate on your PC. 

	![Installer cert](../images/AddCertWin.png)

	Press "Yes" to continue. If you press "No"  any cartificate will be add and your IDE will be an "unhautorized" copy.

3. It then asks you to verify your signum. If it's not correct you can stop installation and exit.  

	![Installer signum](../images/Installer-signum.png)

4. The Installer then shows your where the IDE will be installed. If this is not correct you can exit from installation.  

	![Installer path](../images/Installer-path.png)

5. You can choose whether to use the IDE in Desktop or Headless mode.  
Using the IDE in Headless mode causes applications to open on your Windows® desktop.  
Using Desktop mode opens a separate desktop for the IDE environment.  
You can also select if you want a desktop shortcut for starting the IDE.  
You can also choose if you want to install the Git client for Windows PC. 
Please consider that git is already installed in the IDE VM.

![Installer desktop](../images/Installer-shortcut-And-desktop.png)


6. During installation ide-installer is able to verify if a more recent version of VirtualBox is already installed on your Windows PC and in this case it show following messagebox:

![VBAlreadyInstalled](../images/VBoxAlreadyInstalled.png)

**It is recommended in this case to answer "No",** and leave the more recent already installed VirtualBox as it is, but please in this case take a look to the following NOTE1.
NOTE1: **If you answer "No"** the more recent version of VirtualBox + ExtentionPack that is already installed on your Windows PC will be leaved installed as it is.
But in this case please be careful because it could be possibile that for some specific your own configuration of the already installed VirtualBox your IDE could not start (sse the [point 2](#IDEDoNotStart) of the related TroubleShooting section).

Instead, if **you answer "Yes"** the already present version will be overwrited with the VirtualBox+ExtentionPack version that is delivered with ide-installer.
NOTE2:  normally it works fine but please be careful that in this case could happen sometimes that VirtualBox won't more start and to solve this you have to restart your Windows PC or uninstall manually the VirtualBox using ControlPanel and run again the ide-installer or manually install another VirtualBox version you desire.


7. At the end of the installation you will have an option to run "vagrant up" immediately.  

	![Installer vagrant up](../images/Installer-vagrantup.png)

	a. **If you choose "Yes"**  the ide-installer will try to perform the "Vagrant up" configuring your IDE with your personal info that are on you windows home (ssh keys, environment, variables, and so on) creating your own configured VM on C:\Users\ `<signum>` \VirtualBox VMs\ENM_IDE_Base" directory .
During this procedure the ide-installer wil check if another "C:\Users\ `<signum>`\VirtualBox VMs\ENM_IDE_Base" is already present and if yes, it will alert you to confirm if it could remove that before continue with "vagrant up" command.

   ![Installer vagrant up](../images/IDE_BaseAlreadyPresentWarning.png)
 
		**if you answer "Yes"** the ide-installer will automatically remove your already present Vagrant IDE and will create another one brand new.
		otherwise, **if you answer "No"** ide-installer will try to boot the already installed Vagrant IDE.
If the VM won't start means that you need to reboot your PC and proceed after restart completed with these instructions at following step n. 7 where you can start IDE manually.

b. **If you choose "No"** in the box where ide-installer asked if you want to automatically run IDE:

![Installer vagrant up](../images/Installer-vagrantup.png)

the ide-installer will finish soon leaving you to run manually the "vagrant up"  command.
In any case before preoceed is recommended, if you don't have already done, to restart your Windows PC.
You can run the "vagrant up"  command in two ways:
>1) open a git bash or a dos cmd terminal 
        >> change directory and moving to 
	>>"C:\Users\ `<signum>`\gitrepos\ide\vagrant" 
           then type 
   	   "vagrant up"
   	   and press [enter]
   	   
	>2) or click on the ENM_IDE icon created (if you choosed) by the ide-installer on your desktop.


**IMPORTANT FINAL STEPS: convert your new virtual hard disk in VDI format**

By default the ENM-IDE virtual hard disk created after a new installation have a ".vmdk"  format.
Unfortunately this format cannot be extendend nor compacted and this could cause several problems expecially if you are using dockers in ENM-IDE, that fills quickly your disk. Removal of dangling images could not stop this increasing size of box-disk1.vmdk.
So this disk could reach in short time its upper default limit (40GB). After that the ENM-IDE machine cannot be more  started up.
The solution of this is to convert the box-disk1 to a VDI format, that allow the resizing, but this can require a large amount of free disk space that, when your disk reached the upper limit,  you could no more have (see paragraph 7.3).
So is recommended to convert now your disk to VDI format, soon after you installed or re-installed ENM-IDE
1) Open your OracleVirtualBox, select ENM-IDE_base that with right-click mouse button and select "Settings...->Storage"  option, and take a look to the extention of your "box-disk1". 
Remove the "box-disk1.vmdk" that appears in that window selecting the "-" symbol as in figure:

 ![RemoveDisk1](../images/RemoveDisk1VBoxBaseIDE_Screenshot.png)


2) copy your last ENM-IDE's hard disk "box-disk1.vmdk" into a safe place with enough spage (i.e.  external disk/pendrive or another directory in your PC). 

3) convert the disk to VDI format that using following command:

    $ VBoxManage clonehd "box-disk1.vmdk" "box-disk1.vdi" --format vdi
    0%...10%...20%...30%...40%...50%...60%...70%...80%...90%...100%
    Clone hard disk created in format 'vdi'. UUID: 482654d4-3a4d-4552-b07b-ce5ce8d8becd

4) **load this new .vdi disk into the ENM_IDE_Base** 

select "chose existing disk":

![ChoseExistingDisk](../images/ChoseExistingDiskVBoxBaseIDE_Screenshot.png)

and then select the just converted .vdi disk

![SelectNewExtDisk](../images/SelectNewExtendedDiskVBoxBaseIDE_Screenshot.png)



 - **IMPORTANT NOTE:**
don't run the ide-installer using the VirtualBox run buttons, but use always "vagrant up". 
If you run IDE using VB you won't be able in your IDE VM to connect to Nexus and Gerrit and you won't have rights to access to any other E/// sites and you also could not see your local windows file system host from IDE.

**In any case before preoceed is recommended, if you don't have already done, to restart your Windows** 




[back to menu](#Menu)

##<a name="DesktopMode"></a>**3.1. Desktop Mode**

If at the beginning of ide-installer's run you selected the option 
"Start vagrant IDE in desktop mode" 
you haven't  to configure nothing else to run and access on your IDE VM.

If you have chosen also the "Create a desktop shortcut" option in the first steps of ide-installer's run, you simply have to double-click on the ENM-IDE icon that is on your desktop

Desktop Icon: 
![IDE Icon](../images/ENM_IDE.png)
	
Otherwise you can run the ENM-IDE using both a Git Bash and a CMD prompt.

#### CMD.EXE

1. Open CMD.EXE
2. Change directory and start vagrant:  
	
		# cd to vagrant directory
        c:\Users\ `<signum>`\gitrepos> cd ide\vagrant

        # This downloads the vagrant VM and provisions the IDE (~10 mins)
        c:\Users\ `<signum>`\gitrepos\ide\vagrant> vagrant up


#### GitBash

1. Open GitBash
2. Change directory and start vagrant:  
        # cd to vagrant directory
        $ cd ~/gitrepos/ide/vagrant

        # This downloads the vagrant VM and provisions the IDE (~10 mins)
        $ vagrant up


Once you launched the "vagrant up"  command or double click on ENM-IDE icon, the VM should start and in your desktop should appear the desktop of the IDE Ubuntu login. 
**Don't do anything:  IDE boot is still proceeding and you risk stopping that.** 
**Wait till the desktop becomes as in figure below:**

![IDE InitialScreen](../images/IDEInitialScreen.png)


At this point you have to press "ok". 
(if you press "Cancel" the VM will reboot but without using "vagrant" command and will not works fine for your development scope).

**Important: you have to avoid to answer "Yes"  to the automatic update request of Ubuntu**. 
You have to answer "No"  to the following messageBox that ask you if you want to upgrade Ubuntu.

After that you have finished and your IDE is ready for installing all the ["additional packages"](#AdditionalPkgs) you need according to what is the policy and packages used by your development team.
All the packaged are available into the official repository area on CI Portal https://cifwk-oss.lmera.ericsson.se/ENM-IDE/drops/IDE1.0/   that is pointed by default by apt-get on your IDE. 

If you have some issue you can take a look to the "TroubleShooting" section below or open a ticket to CI-Inftastructure DE-Gitmo team.

If you correctly run the ENM-IDE using the desktop icon or "vagrant up""  command, you should see from the internal file system of IDE that into the following path 

	/mnt/`<signum>`/home 

you must check that all the files in "C:\Users\ `<signum>`" directory are also in "/mnt/`<signum>`/home" directory on IDE. If you are not able to see that see at ["Troubleshooting"](#HomeDirNotMounted) paragraph below.

[back to menu](#Menu)


##<a name="HeadLessMode"></a>**3.2. HEADLess Mode**

If you are using IDE in Desktop mode, you can jump this chapter and go to the ["After Installation"](#AfterInst) chapter below.
If you do not selected the default option to run the IDE in Desktop Mode, ide-installer will prepare environment variables to run IDE in Headless mode.
In this case you need to configure the display and you have to use IDE connecting to that using a terminal emulator (putty, MobaXTerm, Exceed, etc) as client and VcXsrv as a server X.
For this scope ide-installer install by default also VcXsrv and XLaunch.

### Configure the Display

To connect to IDE if it runs in HeadLess mode, as first thing you need to configure the display.

1. Run **xLaunch.exe** found in the VcXsrv install folder.
2. Choose "Multiple windows" and set the "Display number" to 10.  
![X11-1](../images/X11-win-1.png)
3. Choose the "Start no client" option.  
![X11-2](../images/X11-win-2.png)
4. Tick the "Disable access control" box in the pop-up dialog (third tick-box option).  
![X11-3](../images/X11-win-3.png)
> X11 must be enabled and configured so that all applications will open on the laptop and not on any other machine.

### Launching the IDE

You can start and connect to the IDE using CMD.EXE or GitBash or connect using PuTTY.

**IMPORTANT:**
Be careful that ENM_IDE for Windows is not a normal VM, but it is a Vagrant VM, this means that **to run this VM is mandatory to use the following options:**
		
	- "C:\Users\ `<signum>`\gitrepos\ide\vagrant\vagrant up"  

	- Double click on ENM-IDE icon if you have configured that on desktop

instead to always use the desktop icon that ide-installer can create on your desktop.
If you are interested to read more about Vagrant here you are the official page link:
> https://www.vagrantup.com/docs/why-vagrant/


#### CMD.EXE

1. Open CMD.EXE
2. Change directory and start vagrant:  
	
		# cd to vagrant directory
        c:\Users\ `<signum>`\gitrepos> cd ide\vagrant

        # This downloads the vagrant VM and provisions the IDE (~10 mins)
        c:\Users\ `<signum>`\gitrepos\ide\vagrant> vagrant up

        # Connects to the vagrant VM
        c:\Users\ `<signum>`\gitrepos\ide\vagrant> vagrant ssh -p
> **Note:** These and the other vagrant commands are described in the [vagrant documentation](http://docs.vagrantup.com/v2/getting-started/).

#### GitBash

1. Open GitBash
2. Change directory and start vagrant:  
        # cd to vagrant directory
        $ cd ~/gitrepos/ide/vagrant

        # This downloads the vagrant VM and provisions the IDE (~10 mins)
        $ vagrant up

        # Connects to the vagrant VM
        $ vagrant ssh -p

#### PuTTY

> Note that the IDE can not be started using PuTTY and must already be running.

1. Run putty.exe
2. Enter "localhost" or "127.0.0.1" as Host Name
3. Enter Port 2222  

 ![PuTTY.png](../images/PuttySSH.png)
 ![PuTTY.png](../images/PuttyLogin.png)
 ![PuTTY](../images/Putty.png)




[back to menu](#Menu)


# <a name="AfterInst"></a>**4. After Installation**

#### <a name="UserAndPwd"></a>**4.1. Usernames and passwords**
Here below you are a list of most useful user's password that are preconfigured on your ENM_IDE.
For your signum the default password configured internally in IDE is "ericsson", but you can change it if you want.
Other users here below:  ["link"](#VersantPwd)

        root password:   vagrant

        vagrant password:  vagrant

        versant password:  shversant 

        ubuntu password: to be set using root user 
                  # sudo - 
                  # passwd ubuntu

NOTE: if you are not able to connect as versant unser using "shversant" password, see below at following ["link"](#VersantPwd) 

[back to menu](#Menu)


## <a name="AdditionalPkgs"></a>**4.2. Install Additional Packages**

Once the default packages are installed and confirmed that each works with no errors - see , additional packages may be installed depending on team / development environment requirements.
Remeber that your IDE is an Ubuntu machine, that means a "Debian" based kernel
So no .RPM packages are managed but only .DEB, and no "yum" nor "rpm -[iqev...]" commands are avalilable, because all the packaging is managed on Ubuntu using APT  (Advanced Packaging Tool ).
So to check/install/uninstall you have always to use "sudo apt....." command

	$ sudo apt<somthing else>

**Before all** you have to update on your IDE the list of repositories that are configured to enable APT management:

    # update internal APT repo list
    ~$ sudo apt-get update
 
Here below a short list of the main basic useful commands:

    # list of installed packages
    ~$ sudo apt list --installed

    # information details on one specific package
    ~$ sudo apt-cache policy <package name>
    or
    # dpkg -l |grep <package name>

Depending on the result of the last command, three different actions and procedures are available for IDE:

1) First, if the package is already installed you should see something like this

![aprPckgAlreadyInst](../images/apt_pckgAlreadyInstalled.png)

where you have following fields to check:
   "Installed: "   is the version of installed package
   "Candiodate: "  is the more recent version available among all the APT repositories configured
   "Version table: "  is the list of packages names associated with their APT repository address

There is only one official APT repository for ENM-IDE:

    https://cifwk-oss.lmera.ericsson.se/static/staticRepos/ENM-IDE/IDE1_0/ trusty/main amd64 Packages

and all the packages stored there can be easy seen in CIFWK using this link:
https://cifwk-oss.lmera.ericsson.se/ENM-IDE/drops/IDE1.0/


2) Second, if the package is not yet installed you should see something like this

![aprPckgNotInstalled](../images/apt_pckgNotYetInstalled.png)

where the "Installed" field is empty but, if exists on some APT repo, a Candidate version available for installation is prompted


3) Third, if the package is installed but a more recent version is available on APT repos:

![aprPckgInstalledButNotLast](../images/apt_pckgInstalledButMoreRecentAvailable.png)

where the "Installed" field is not empty but, if exists on some APT repo, a more recent Candidate version available for installation is prompted.


Here you are commands to install or uninstall installed packages on IDE:

    # uninstall an already installed package   
    ~$ sudo apt-get -y remove <package name>

    #install a not yet installed package
    ~$ sudo apt-get -y install <package name>


[back to menu](#Menu)


##<a name="InstallAddOns"></a> **4.3. Install additional components**

If you use IDE in desktop mode you can jump to the ["apt-get update"](#apt-getUpdate) paragraph
Instead, if you use IDE in headless mode follow these steps to connect tho that:

        # cd to vagrant directory in ENM IDE :
        cd c:\Users\ `<signum>`\gitrepos\ide\vagrant

        # Start vagrant :
        c:\Users\ `<signum>`\gitrepos\ide\vagrant> vagrant up

        # connect to vagrant
        c:\Users\ `<signum>`\gitrepos\ide\vagrant> vagrant ssh -p
        
       

#### 4.3.1. <a name="apt-getUpdate"></a>**Update apt list and install packages**

First thing to be done is to update the apt list of delivered storage areas for packages: 

	# in vagrant VM - update apt list to latest
        vagrant@vagrant-ubuntu-trusty-64:~$ sudo apt-get update

Then you can install your specific packages required by your development environment.
The general command valid for all is:

	# in vagrant VM - install required package
        vagrant@vagrant-ubuntu-trusty-64:~$ sudo apt-get install <package-name>


     # Can install multiple packages simultaneously --> space separated
        vagrant@vagrant-ubuntu-trusty-64:~$ sudo apt-get install <package-name> [package-name]

     # examples
        vagrant@vagrant-ubuntu-trusty-64:~$ sudo apt-get update
        vagrant@vagrant-ubuntu-trusty-64:~$ sudo apt-get install netbeans
        vagrant@vagrant-ubuntu-trusty-64:~$ sudo apt-get install versant idea postgres.

Then you can clone your repo (for example the pm-gui) from Gerrit 
•         cd pm_gui
and compile the GUIwithout change local file /root/pom.xml : 
•         mvn clean install -Dnode=node -Dnpm=npm -Dcdt2-path=/usr/local/bin/cdt-build


[back to menu](#Menu)

# <a name="HOW-TO"></a>**5. How to and FAQ**


##<a name="ENM-IDE_Restore"></a>**5.1. - How to restore a new ENM_IDE-Base without reinstall all ENM-IDE**

Each time that your ENM-IDE_Base machine become corrupted or you want to refresh, Vagrant allow you to easy restore a new fresh ENM-IDE_Base machine avoiding you to uninstall and install again all.




##<a name="NodeJs"></a>**5.2. - How to install nodejs and cdt2 on IDE**

For developers that are going to use ENM-IDE for ENM-Gui developments, here below some informations: 
The reference page for CDT is [here](https://arm1s11-eiffel004.eiffel.gic.ericsson.se:8443/nexus/content/sites/tor/cdt2/latest/gettingStarted.html)
Please be informed that in any case the version of nodejs that is kept aligned on Nexus between all development teams.
This last common authorized version can be installed on IDE sumply using apt-get becasue is automatically referred to CI-FWK Advanced Package Tool archive for IDE, using following command:

	~$ sudo apt-get update
	~$ sudo apt-get install nodejs

If teh second command will fail,  you have to follow another procedure, showed below step by step:

	0) go in  "Settings" menu in your  ENM_IDE and open "Software&Updates"

	1) In folder "Other Software" uncheck the repo with name that starts with  "https://cifwk-oss...."
	(it will require  passwd of Ubuntu)

	2) open a shell and type "sudo apt-get update"

	3) sudo apt-get install nodejs

	4) sudo apt-get install npm

	5) return in the Software&Updates check again the repo with name thjat starts with "https://cifwk-oss...."

	6) sudo apt-get update

	7) sudo apt-get install cdt2

	8) sudo apt-get install nodejs
	
	9) export PATH="/usr/bin/nodejs/bin":$PATH

	END

Another way to install nodejs and cdt2 for your specific usage is to have that packages installed locally under your home directory on ENM-IDE into the path: 

	 "/home/yoursignum/.nvm/...."
	 
This option make you more easy and free to update cdt2 and nodejs version to the best one to be used for your project.

To do this you have to install "nvm" ( Node Version Manager ) on your ENM-IDE. Here you are the steps:

	$ whoami
	(to verify that you are connected as your signum user)
	
	$ sudo apt-get update
	
	$ sudo apt-get install build-essential libssl-dev
	
	$ curl https://raw.githubusercontent.com/creationix/nvm/v0.25.0/install.sh | bash
	
	$ nvm install <version>
	where "<version>" is your nodejs desired version number 
	(i.e.: "nvm install 0.10.26" or "nvm install 7.1.0" ) >
	
	$ nvm alias default <version>
	where "<version>" is your nodejs desired version number used before
	
	$ npm install -g cdt2 --registry http://presentation-layer.lmera.ericsson.se/registry --proxy null
	
The last command is the same that is used to install the "cdt2"  using the official command "sudo apt-get install cdt2", but has been forced to be installed also this under ~/.nvm path, and to use the "nodejs" rel 7.1.0 because of "nvm alias default"  command given before.

cdt2 is the same installed with previous official "sudo apt-get install cdt2"   command, in fact if you soon after will type "cdt2 --version"  you will see the same "cdt-build @ 2.5.7".
But, because soon before the 7.1.0 version has been set as alias using nvm, in this case will be installed under your home directory in the same path ~/.vnm where were installed the nodejs when you used the "nvm install ....." command.
So, if you chose to install be careful that the official cdt2 were not yet installed or that your path for cdt2 and nodejs is referred to your "~/.nvm" directory and not to the system path /usr/local/..... where ususallt these packages are installed whe you use official "sudo apt-get install.... "  command.


[back to menu](#Menu)

##<a name="PythonPIP"></a>**5.2. - How to install python-pip and following python libraries on IDE (for ENM-Python developers)**

Python is native on ENM-IDE.
But, to make you able to import specific python modules on IDE to make able your pythion scripts to work you have to install the "pip"  installer modules for python.

	~$ sudo apt-get update
	~$ sudo apt-get install -y python-pip
	~$ sudo pip install <python-module-to-be-inmported-in-scripts>

Here below some examples:

    	1) install module "scp" to allow scripts to use "import scp"  directive
		~$ sudo pip install scp   
	 
        2) install "nose" to use "nosetests"
		~$ sudo pip install distribute
		~$ sudo pip install nose
		~$ sudo pip install virtualenv

        



[back to menu](#Menu)

##<a name="EclipseNetbUsage"></a>**5.3. - How to use Eclipse/Netbeans on IDE**


If you correctly run the ENM-IDE using the desktop icon or "vagrant up""  command, you should see from the internal file system of IDE that into the following path 

	/mnt/ `<signum>`/home 
you must see the all the file system that is in your Windows PC at your home directory there C:\Users\ `<signum>`

So it is recommended to use this are as per workspace for your project in Eclipse or Netbeans that you are using on IDE.
This in case the IDE virtual machine bocomes corrupted, you can keep saved your temporary code work and create a new IDE brand new removing the ENM_IDE_Base directory and starting again using the IDE using icon or "vagrant up".

[back to menu](#Menu)

##<a name="AddNPM"></a>**5.4. - How to add npm plugin into Netbeans/Eclipse/Intellij.**

To add npm plugin first you have to search the npm plugin it at this official page of npm: https://sourceforge.net/projects/pmd/files/

then select the pmd plugin you need (i.e.   for netbeans select the pmd-netbeans link)
select the right version you want to use
get the "pmd-netbeans......-bin.zip" 
folow instructions at the related page (i.e.:  for netbeans is https://pmd.github.io/pmd-4.3.0/integrations.html#netbeans)

[back to menu](#Menu)

##<a name="CreateVersantDB"></a>**5.5. - How to create a new Versant databse on IDE**


        Versant access to create a new database. 
        After installed versant using 
        #> sudo apt-get install versant,  
        the problem is to find which is the way to access to versant db to manage 
        and create new tables. 
        
        The answer is to create the database as "versant" user with following sequence:  

<a name="VersantPwd"></a>
        
        $ su –
          (will requested to type root password that is "vagrant")
          Then at the root prompt type following command:
        $ passwd versant
              <set your desired password for "versant" user>
        $ exit
              (exit from root)
        $ su - versant
           Password: <your-choosed-password>
           No directory, logging in with HOME=/
        $ cd /usr/local/versant/bin
        $ ./makedb -nofeprofile dps_integration
        
        - Verify that dps_integration has been created (as versant):
        $ cd /usr/local/versant/databases
        $ ls -la
		drwxrwxrwx  4 versant versant 4096 Jan 30 10:54 .
		drwxr-xr-x 10 versant versant 4096 Jan 19 09:42 ..
		drwx------  2 versant versant 4096 Jan 30 10:02 dps_integration
		
		Note: must not be present folowing entry:
	
	            -rw-------  1 versant versant 1028 Jan 30 10:02 osc-dbid
            
			  	if is present, please remove that.
     		
       Create osc-dbid:
     
        $ cd /usr/local/versant/bin
		$ ./dbid -N
		
		Create the database and start that:

	    $ ./createdb dps_integration

		Finally you must verify if you can access to the database:

		$ dbtool -config -get dps_integration

If any issue with this procedure, try to find if some solution is present starting fron [this](#CreateVersantDBError) paragraph in truble-shooting area.

[back to menu](#Menu)


##<a name="DockerConfig"></a>**5.6. - How to configure and use Dockers on IDE**

Docker is native on IDE, and you have nothing to do to configure that.
But sometimes could happen that you could see an abnormal increasing in file system used space on your IDE taht could easy reach the limt of 40GB.
To avoid this please take a look in TroubleShooting section [below](#NoLeftSpace).
But if you have installed a brand new ENM_IDE_Base VM, and you need to use dockers for ENM development, you have to check if "docker-engine"  and "docker-compose" are correct, as first step.
To check and eventually upgrade docker versions instructions are in  [paragraph 8.1](#UpgradeIDE) to be followed.
Here there are some detailed instructions on how to use [Dockers to run AcceptanceTest](https://confluence-nam.lmera.ericsson.se/display/ATH/Run+Acceptance+Test+using+Docker)
Some other useful instructions on how to use dockers are [in this page](https://confluence-nam.lmera.ericsson.se/display/Mavericks/Running+your+Docker+Environment) 

Here below the most common useful commands to clean

[back to menu](#Menu)

##<a name="ExtendRAMSpace"></a>**5.7. - How to customize RAM size on IDE**

   It is possible to customize the amount of RAM of your Windows PC that Vagrant can reserve to ENM_IDE.
It is possibile both simply increase RAM size and make able IDE to get for itself all that memory amount, or configure a more elastic and adaptive usage of the available memory.

Customize the amount and usage of RAM allocated for ENM_IDE it is easy.
To do this you have to keep in mind that this machine is not a normal VirtualBox machine, but is a Vagrant VM.
This means that to configure/change/manage averything on your IDE you haven’t to use the most part of VirtualBox options, but instead you have to change the configuration in your "Vagrantfile" that for ENM-IDE is copied by ide-installer in your PC in this directory:

	C:\Users\`<signum>`\gitrepos\ide\vagrant\

Vagrantfile  is working for Vagrant as a .ini file is working for any Windows application.
So “Vagrant.exe” is reading that Vagrantfile config file, applying changes to your ENM-IDE.
But it is also possible to use "Vagrant.exe" by command line using for example a dos or GitBash prompt on your Windows PC.

[back to menu](#Menu)


##<a name="IncrDecrUpperMemLimit"></a>**5.8. - How to Increase/Decrease upper memory limit on IDE**

  In this case here is what you interest:  to increase your memory amount on IDE you have to open the Vagrantfile and go the row where there is this section:

	  vb.name = "ENM_IDE_Base"
	  vb.memory = 4096
	  vb.cpus = 2
	  if ENV['VAGRANT_DESKTOP']
	    vb.gui = true
	  end

You can increase the value of “vb.memory”  up to your desired value and then restart your Vagrant machine VM with "vagrant up" or clicking the desktop icon as usual.

[back to menu](#Menu)

##<a name="AutoCalcRAMforIDE"></a>**5.9. - How to make the Amount of memory for IDE automatically calculated **

Instead of set a fixed value for the amount of memory to be reserved for your IDE, it is possibile to tell Vagrant.exe to calculate it in based on physical memory that is installe on the host PC.
This allow to always leave an evaluable percentage of memory free for user's PC,  whatever it is the amount of free memory avaiable for IDE when it will boot up.
Also this time is the Vagranfile that must be changed.
The section of Vagrantfile where configure this customization is thisafter the stament that tell Vagrant to set parameters that can customize VirtualBox, that is: 

	config.vm.provider :virtualbox do |vb|

The amount of memory to be reserved for your IDE is a portion of the free RAM available in  your PC the moment of IDE is booted is this:

    mem = `wmic os get FreePhysicalMemory | grep '^[0-9]'`.to_i / 1024 / 1.3  
                                                                          ^
                                                                         Key

This command means that is reading the Physical Memory amount using "wmic" (command line interface for Windows Management Instrumentation) directly from the operative system. 
This operation can return together with the searched value, a number of headers. You have to remove that eventual headers, and to do this can be used the grep to that command "^[0-9]", and then converted the remained value to an integer using Ruby command ".to_i".
But because this value is returned in Bytes, we need to convert that in KBytes to be used in VirtualBox setting parameters, so that is the reason because is divided by 1024. 
The "Key" value, that in this example is  "1.3", means that you want to reserve for your IDE only the "FreeMem"/1.3 part of the total free memory available when IDE boot up.                                                                                                                             
This is the field that you can change to customize the amount of free physical memory to be reserved for IDE.
If you increase this value the amount of your free memory reserved for your IDE decreased, instead decreasing that the same amount will grow up.
To restart your IDE after each change, if your IDE is running, you have to type

	cd C:\Users\<signum>\gitrepos\ide\vagrant
	vagrant reload --provision

or you can stop your IDE, and simply double-click on your desktop's icon to boot up again IDE with new memory reserved for that.
[back to menu](#Menu)

##<a name="DynamicOrStaticRAMforIDE"></a>**5.10. - How to configure dynamic or static memory allocation on IDE**

In this chapter 5, till now, is showed the procedure on how to con
You can also easy customize in which mode you want to use the upper limit that can be set as in previous two paragraphs 5.1 and 5.2: static or dynamic.

- static allocation it means that when IDE will starts, it reserves for itself all the available (set or calculated) free memory at once.
To set IDE to use the amount of memory in static mode, is must be set a vb.customize "setextradata" flag "VBoxInternal/RamPreAlloc" into the Vagranfile as follows:

    vb.customize ["setextradata", :id, "VBoxInternal/RamPreAlloc", "1" ]

   This flag "VBoxInternal/RamPreAlloc" set to "1" forces VirtualBox to "grab" all of the guest's memory at startup if possible.

- dynamic allocation means that IDE will consider the set or calculated amount of free PC RAM only as an upper limit for its usage. 
So when IDE will starts, could use only a little portion of that calculated or se memory, increasing this usage percentage during the user's IDE usage, increasing up to the previously set or calculated upper limit.
It is enough to modify the RamPreAlloc flag from "1" to "0" in the Vagrantfile, 

    vb.customize ["setextradata", :id, "VBoxInternal/RamPreAlloc", "0" ]

   now the IDE gets the RAM when it is needed, letting more RAM available for the applications running on the host OS (which is what I needed).
  Only the portion that is necessary for startup and during usage caould increase uses the memory size assigned to them, using dynamic or static allocation.
Static allocation means that the amount of RAM reserved for your IDE 



##<a name="MoveYourMachine"></a>**5.11. - How to save your ENM-IDE VM and/or copy/move on another PC or VirtualBox HyperV**

Vagrant allow you to easy save and move or copy your VM across different PCs or VirtualBox.
You can use "vagrant.exe" command line with several options like "package", to save your machine and prepare that to be moved, but this is recommended expecially for Virtual Machines that are not yet Vagrant machines, to convert them into Vagrant format.
There is instead another way more easy to copy your ENM-IDE on another PC, becasue our ENM_IDE_Base is already a Vagrant machine.

a) **Initial situation of ENM_IDE_Base directory on your old PC:**

    egiogiu@BGE377280 ~ 
    $ cd ~/"VirtualBox VMs"/ENM_IDE_Base
    
    $ ls -la
      total 532844
    drwxr-xr-x    6 egiogiu  Administ     4096 Feb 22 17:35 .
    drwxr-xr-x    7 egiogiu  Administ     4096 Feb 22 17:34 ..
    -rw-r--r--    1 egiogiu  Administ     8074 Feb 22 17:35 ENM_IDE_Base.vbox
    -rw-r--r--    1 egiogiu  Administ     8074 Feb 22  17:35 ENM_IDE_Base.vbox-prev
    drwxr-xr-x    1 egiogiu  Administ        0 Feb 22 17:35 Logs
    -rw-r--r--    1 egiogiu  Administ 1091239936 Feb 22 18:38 box-disk1.vmdk


As you can see  you have alredy a box-disk1.vmdk or a a box-disk1.vdi in the list above: this is your "virtual hard disk" and this is the only part you have to copy on the new PC.
So, copy this box-disk1 into the new PC into a temporary directory.

b) **ENM-IDE on your new PC**

Second step is to create on your new PC 

b) **uninstall your .vmdk or .vdi disk from your ENM_IDE_Base in VirtualBox**
1) Run VirtualBox.exe program and right click on the ENM_IDE_Base VM and select " Settings" 

![SettingsIDE](../images/SetSettingsVBoxBaseIDE_Screenshot.png)

2)  Go on " Storage"  field and remove the current installed original disk1 (that one with size limited up to 40G)

 ![RemoveDisk1](../images/RemoveDisk1VBoxBaseIDE_Screenshot.png)
 
3) 


[back to menu](#Menu)



## <a name="ExtendDiskSpace"></a>**5.12. - How to extend disk space on IDE**

Is possible to increase the max disk space that can reach the ENM-IDE VM over the curret limit of 40G, without destroy your IDE.
The process requires a large amount of disk space on your Windows PC, so if you not have, is suggested to use en external USB disk where copy your box-disk1.vmdk and work there.
Te whole process it takes more than 1h to be completed.

**Preconditions:** 
1) chech if you have in your environment variable "Path" the path where is "VBoxManage.exe" (C:\Program Files\Oracle\VirtualBox).
If you are not able to add this path to your environment variable or if after added it still don't works, use the command including its full path as follows:

    if use DOS cmd shell:
       C:\"Program Files"\Oracle\VirtualBox\VBoxManage.exe
    if you use a GitBash:    
       /c/"Program Files"/Oracle/VirtualBox/VBoxManage.exe
2) you muat have enough spece to extend: the double of the current space used by your current box-disk1.vmdk that you want to extend.


Following steps are based using a Git Bash.

a) **Initial situation of ENM_IDE_Base directory:**

    egiogiu@BGE377280 ~ 
    $ cd ~/"VirtualBox VMs"/ENM_IDE_Base
    
    $ ls -la
      total 532844
    drwxr-xr-x    6 egiogiu  Administ     4096 Feb 22 17:35 .
    drwxr-xr-x    7 egiogiu  Administ     4096 Feb 22 17:34 ..
    -rw-r--r--    1 egiogiu  Administ     8074 Feb 22 17:35 ENM_IDE_Base.vbox
    -rw-r--r--    1 egiogiu  Administ     8074 Feb 22  17:35 ENM_IDE_Base.vbox-prev
    drwxr-xr-x    1 egiogiu  Administ        0 Feb 22 17:35 Logs
    -rw-r--r--    1 egiogiu  Administ 1091239936 Feb 22 18:38 box-disk1.vmdk

If you have alredy a box-disk1.vdi in the list above, means that you can avoid to convert from .vmdk to . vdi. This means that you can avoid to do the step "c)" of this procedure.

b) **uninstall your .vmdk or .vdi disk from your ENM_IDE_Base in VirtualBox**
1) Run VirtualBox.exe program and right click on the ENM_IDE_Base VM and select " Settings" 

![SettingsIDE](../images/SetSettingsVBoxBaseIDE_Screenshot.png)

2)  Go on " Storage"  field and remove the current installed original disk1 (that one with size limited up to 40G)

 ![RemoveDisk1](../images/RemoveDisk1VBoxBaseIDE_Screenshot.png)
 

At this point

c) **convert the .vmdk disk on a .vdi** (as wrote before you can avoid this step if you already have a box-disk1.vdi and jump to step "d)")

    $ VBoxManage clonehd "box-disk1.vmdk" "box-disk1.vdi" --format vdi
    0%...10%...20%...30%...40%...50%...60%...70%...80%...90%...100%
    Clone hard disk created in format 'vdi'. UUID: 482654d4-3a4d-4552-b07b-ce5ce8d8becd

d) **Increase the space of your new .vdi image** (in this example disk space is increased up to 50GB)

    $ VBoxManage modifyhd "box-disk1.vdi" --resize 51200
	0%...10%...20%...30%...40%...50%...60%...70%...80%...90%...100%

f) **if you used an external disk copy the box-disk1.vdi back into the ENM_IDE_Base path**

	$cp box-disk1.vdi /c/Users/<yoursignum>/"VitualBox VMs"/ENM_IDE_Base

g) **final situation in the ENM_IDE_Base directory is as follows:**

    $ ls -latr
    total 1737421
    drwxr-xr-x    7 egiogiu  Administ     4096 Feb 22 17:34 ..
	-rw-r--r--    1 egiogiu  Administ 1091239936 Feb 22 18:38 box-disk1.vmdk
	-rw-r--r--    1 egiogiu  Administ 1363148800 Feb 22 19:39 box-disk1.vdi
	-rw-r--r--    1 egiogiu  Administ     8196 Feb 22 19:59 ENM_IDE_Base.vbox-prev
	-rw-r--r--    1 egiogiu  Administ     8196 Feb 22 19:59 ENM_IDE_Base.vbox
	drwxr-xr-x    1 egiogiu  Administ        0 Feb 22 19:59 Logs
	drwxr-xr-x    8 egiogiu  Administ     4096 Feb 23 09:34 .

g) **Now to enable new disk space on IDE VM in VirtualBox you have to remove yur original disk from VirtualBox using following steps:**

1) Run VirtualBox.exe program and right click on the ENM_IDE_Base VM   and select " Settings" 

![SettingsIDE](../images/SetSettingsVBoxBaseIDE_Screenshot.png)

2)  Go on " Storage"  field and select the second icon ![AddDiskIcon](../images/AddDiskOnvBoxIDE_Icon.png) on the right of the "Storage Tree" field labeled " Controller: SATAControlle....":  

![ChoseDisk](../images/ChoseExistingDiskVBoxBaseIDE_Screenshot.png)

3) Select the new .vdi disk with extended space (box-disk1.vdi)

![SelectNewDisk](../images/SelectNewExtendedDiskVBoxBaseIDE_Screenshot.png)

4) finally the new disk configured must be as follows:

 ![NewExtndedDisk](../images/NewExtendedDiskSelectedVBoxBaseIDE_Screenshot.png)
 
 Now you can double-click on ENM_IDE icon ![IDE Icon](../images/ENM_IDE_DesktopIcon.png)  on desktop (or open a git bash on ~/gitrepos/ide/vagrant and run " vagrant up") and the your ENM_IDE should boot up keeping all your machine data, but with disk space extended to new value you selected durinv vmdk-to-cdi conversion.
In this example 50GB was selected to extend and in fact the " df -h"  can show taht the total space available on IDE now is that new value:

![DiskSpaceSituation](../images/DiskSpaceonIDEafterGrowUpSize.png)

[back to menu](#Menu)



## <a name="ReduceDiskSpace"></a>**5.13. - How to safety reduce disk space on IDE**
 

Similar to increase, it is also possible to decrese the max disk space that can reach the ENM-IDE VM,  both reducing the default limit of 40G and also decreasing back after an increase of size do for error.
As in case of increase size, also the decreasing is possible without destroy your IDE.
Anso in this case the process requires a large amount of disk space on your host Windows PC, to be used for conversions and copies of your original disk.
If you not have, is recommended to use en external USB disk where copy your box-disk1.vmdk and work there.
Te whole process it takes more than 1h to be completed.

**Preconditions:** 
1) chech if you have in your environment variable "Path" the path where is "VBoxManage.exe" (C:\Program Files\Oracle\VirtualBox).
If you are not able to add this path to your environment variable or if after added it still don't works, use the command including its full path as follows:

    if you use DOS cmd shell:
       C:\"Program Files"\Oracle\VirtualBox\VBoxManage.exe
    if you use a GitBash:    
       /c/"Program Files"/Oracle/VirtualBox/VBoxManage.exe

2) you muat have enough spece to extend: the double of the current space used by your current box-disk1.vmdk that you want to extend.


Following steps are based using a Git Bash.

a) **Initial situation of ENM_IDE_Base directory:**

    egiogiu@BGE377280 ~ 
    $ cd ~/"VirtualBox VMs"/ENM_IDE_Base
    $ ls -la
      total 532844
    drwxr-xr-x    6 egiogiu  Administ     4096 Feb 22 17:35 .
    drwxr-xr-x    7 egiogiu  Administ     4096 Feb 22 17:34 ..
    -rw-r--r--    1 egiogiu  Administ     8074 Feb 22 17:35 ENM_IDE_Base.vbox
    -rw-r--r--    1 egiogiu  Administ     8074 Feb 22  17:35 ENM_IDE_Base.vbox-prev
    drwxr-xr-x    1 egiogiu  Administ        0 Feb 22 17:35 Logs
    -rw-r--r--    1 egiogiu  Administ 1091239936 Feb 22 18:38 box-disk1.vmdk

![SettingsIDE](../images/InitialDefaultIDEonVirtualBox.png)

If you have alredy a box-disk1.vdi in the list above, means that you can avoid to convert from .vmdk to . vdi. This means that you can avoid to do the step "c)" of this procedure.

b) **uninstall your .vmdk or .vdi disk from your ENM_IDE_Base in VirtualBox**

1) Run VirtualBox.exe program and right click on the ENM_IDE_Base VM and select " Settings" 

![SettingsIDE](../images/SetSettingsVBoxBaseIDE_Screenshot.png)

2)  Go on " Storage"  field and remove the current installed original disk1 (that one with size limited up to 40G)

 ![RemoveDisk1](../images/RemoveDisk1VBoxBaseIDE_Screenshot.png)
 

At this point

c) **convert the .vmdk disk on a .vdi** (as wrote before you can avoid this step if you already have a box-disk1.vdi and jump to step "d)")

    $ VBoxManage clonehd "box-disk1.vmdk" "box-disk1.vdi" --format vdi
    0%...10%...20%...30%...40%...50%...60%...70%...80%...90%...100%
    Clone hard disk created in format 'vdi'. UUID: 482654d4-3a4d-4552-b07b-ce5ce8d8becd


d) **load this new .vdi disk into the ENM_IDE_Base** 

select "chose existing disk":

![ChoseExistingDisk](../images/ChoseExistingDiskVBoxBaseIDE_Screenshot.png)

and then select the just converted .vdi disk

![SelectNewExtDisk](../images/SelectNewExtendedDiskVBoxBaseIDE_Screenshot.png)

e) **boot your ENM_IDE_Base and open a shell with Terminal** 

open a shell with Terminal and install a logical volume manager.
In this example we used GParted to resize the LVM physical volume. 
GParted won't let you shrink the LVM physical volume to a size smaller than what the unallocated space allows, so you have to follow carefully these instructions.
Into the shell you opened on IDE type following commands:

	$ sudo apt-get update 
	$ sudo apt-get install gparted 
	
once the "gparted" installation has finished, then in the same shell you have to type following commands:

	sudo dd if=/dev/zero of=/emptyfile bs=1M
	sudo rm -rf /emptyfile

This will create one big file that only contains zeros. 
The file will get as big as the free space was before, so dd will abort when there is no free space left. With the second "sudo" then you just delete the file.


f) **shutdown your ENM_IDE_Base and open a cmd or a git bash on your PC** 

then in that shell you opend type following commands

    $ cd ~/"VirtualBox VMs"/ENM_IDE_Base   
    $ VBoxManage modifyhd "box-disk1.vdi" --compact
    0%...10%...20%...30%...40%...50%...60%...70%...80%...90%...100% 

This command will compact your VDI disk removing all blank spaces (it works as a "defrag" in Windows)


g) **At this point you have to clone this disk into another with Hyper-V VHD format**

    $ VBoxManage clonehd "box-disk1.vdi" "NewDisk1.vhd" --format vhd
    0%...10%...20%...30%...40%...50%...60%...70%...80%...90%...100%

h) **Clone this new vhd disk to have another vhd copy with Hyper-V VHD format**

    $ VBoxManage clonehd "NewDisk1.vhd" "NewDisk2.vhd" --format vhd
    0%...10%...20%...30%...40%...50%...60%...70%...80%...90%...100%

i) **add these new disks in your "ENM_IDE_Base->Settings->Storage" in VirtualBox**: 
NewDisk1.vhd as primary (SATA Port 0) disk and NewDisk2.vhd as secondary (SATA Port 1) disk.

![LoadedBothVMDKandVHD](../images/LoadedBothOldVMDKandNewVHDDisk2.png)

at the end you should have the original defragged vdi disk as NewDisk1.vhd as "SATA 0" and NewDisk2 VHD disk as "SATA 1" (or a number > 0)

l) **restart your ENM_IDE_Base  VM (using vagrant up or booting from VirtualBox menu. In this case is the same)** 

open a shell with Terminal and run the previously installed GParted to resize the LVM physical volume of the VHD new disk that should be still "unmounted". 

	$ sudo gksu gparted &

Then follow these steps:

![GPartedInitial](../images/GPartedInitialScrren.png)

![GPartedSelect](../images/GPartedSelectDevB.png)

![GPartedSelectSDB1](../images/GPartedSelectSB1AndResizeButton.png)

![GPartedResizeSdb1](../images/GPartedResizeSdb1.png)

![GPartedClickOnApply](../images/GPartedClickOnApplyChanges.png)


m) **After you pressed "Apply changes"  as showed in previous screenshot, you can shut your IDE**
remove both new VHD and original vmdk disks from your ENM_IDE_Base->Settings->Storage" in VirtualBox:

![RemoveOrigDisk1](../images/RemoveOrigDisk1VMDK40G.png)

n) **If not yet installed, install the software "Vhd Resizer"**


you can find this software and related instructions in this web site:
[http://www.geek-blog.it/index.php?ctg=7&id=125](http://www.geek-blog.it/)

o) **run "Vhd Resizer" and load the new VHD disk "NewDisk2.vhd" where you resized its logical volume before with "GParted program**
first you have to select the "NewDisk2.vhd" 

![SelectDisk1VHDResizer](../images/SelectSourceDisk1VHDwithVHDResizer.png)

second, set destination VHD file name (in this case "NewDisk3.vhd") and desired size in GB as in following image:

![VhdResizerParamsDisk3](../images/VhdResizerWinParamsToResizeDisk1inDisk3.png)

p) **when Vhd-Resizer program finished, add this new VHD resized disk as the only SATA disk in your "ENM_IDE_Base->Settings->Storage" in VirtualBox**

![SelectNewDisk3VirtualBox](../images/SelectNewDisk3VHD30GasSATA0inVirtualBox.png)

![LoadedDisk3VHD_SoPressOk](../images/LoadedDisk3VHD_SoPressOk.png)

q) **finally you can boot your ENM_IDE machine using "vagrant up**

![FinallyNewIDEwithDisk30G](../images/FinallyNewIDEwithDisk30GisRunning.png)
As you can see now your maximum upper disk size is 30G

[back to menu](#Menu)


## <a name="SaveRestoreDiskImage"></a>**5.14. - How to easy save and restore your ENM-IDE if crashes**

Sometimes could happen that your ENM-IDE won't restart for some reason (Windows PC crash, wrong VirtualBox status, Vagrant's ENM-IDE configuration files corruption, etc. ).
When this happens there is a short step by step sequence that you could use to easy restore your last ENM-IDE image without need to reset all.

1) open Windows Explorer and go into the directory "C:\Users\`yoursignum`\VirtualBox VMs\ENM_IDE_Base".

![PathOfIDEdisks](ENM_IDE_Base_DirStructure.png)

2) copy your last ENM-IDE's hard disk "box-disk1.vmdk" (or "box-disk1.vdi" if you already converted in the past) into a safe place with enough spage (i.e.  external disk/pendrive or another directory in your PC).

3) open OracleVirtualBox, right-click on the ENM-IDE_Base icon and select "X remove..."

   ![SettingsIDE](../images/SetSettingsVBoxBaseIDE_Screenshot.png)
  
4) Choose the "Delete all files"  option.

5) Go into your desktop and double click on the ENM-IDE icon.

6) when terminated a brand new ENM_IDE_Base will be created on your OracleVirtualBox, at this point you have to select that with right-click mouse button and select "Settings...->Storage"  option, and remove the box-disk1.vmdk that appears in that window selecting the "-" symbol as in figure:

 ![RemoveDisk1](../images/RemoveDisk1VBoxBaseIDE_Screenshot.png)

7)  ath this point you have to choice the "+"  button to insert your previously saved disk "box-disk1.vmdk"  (or box-disk1/vdi)

 ![ChoseExistingDisk](../images/ChoseExistingDiskVBoxBaseIDE_Screenshot.png)

![SelectNewExtDisk](../images/SelectNewExtendedDiskVBoxBaseIDE_Screenshot.png)

Once you done this youn can press "Ok"button to exit, and then double clicking on the ENM-IDE desktop icon you should be able to restart again your oldest ENM-IDE successfully restored.
   


[back to menu](#Menu)


## <a name="UseVPNFromENMIDE"></a>**5.15. - How to set and use VPN tunnel to reach ITTE NetSim network with ENM-IDE**

Usually to reach NetSim or other nodes that are in some ITTE subnet not usually reachable from ECN, you have to set and run a tunnel using for example ShrewSoft VPN to activate the tunnel from your Windows host to that subnet.
May happen that when the tunnel is up ou are able to reach the destination working on your host PC (Windows or ELX, or other where you launched the ShrewSoft Client), but you cannot reach the same destination from the guest machine ENM-IDE.
This may be becasue your ENM-IDE is configured to use a public IP address to communicate with external network instead of using NAT managed by VirtualBox. 
In fact the tunnel is configured among two IPs: one in this case is the destination IP gateway on ITTE side and source is your host PC IP address. 
But the ENM-IDE has an own IP, different from that of your host PC, and  this means that ENM-IDE ip is out of the tunnel:  so you cannot reach the target area.
To solve this you can convert your ENM-IDE to work using NAT, removing or commenting the public ethernet configuration from the Vagrantfile:

	config.vm.network :public_network, :use_dhcp_assigned_default_route => true, run: "always"

But this could make dockers to be unreachanble from the external network if they need (i.e.  usage of OpenStack client or some other applciation in some docker that need to be reachable from external process that runs on remote servers)

So the real solution to this problem is to create a tunnel that involves the public IP configured on ENM-IDE, and to do this is mandatory to install ShrewSoft VPN software on your ENM-IDE.

Here below the step by step instructions to install ShrewSoft VPN on ENM-IDE Ubuntu machine: 

Step 1: Download the required shrewsoft package – v2.2.1 as of the time of this article – to your working directory. I will use /var/tmp as my working directory in this tutorial

	cd /var/tmp
	wget https://www.shrew.net/download/ike/ike-2.2.1-release.tgz
	
Step 2: Untar

	tar -zxvf ike-2.2.1-release.tgz
Step 3: Install dependencies (there are a number)

	sudo apt-get install cmake libqt4-core libqt4-dev libqt4-gui libedit-dev libssl-dev checkinstall
Step 4: Build the install files

	cd /var/tmp/ike
cmake -DCMAKE_INSTALL_PREFIX=/usr -DQTGUI=YES -DETCDIR=/etc -DNATT=YES
Step 5: Install the application

	sudo checkinstall -y
Step 6: Create the config file

	sudo cp /var/tmp/ike/source/iked/iked.conf.sample  /etc/iked.conf
Step 7: Start the ike deamon

	sudo iked
Step 8: Start the graphical user interface (gui) and use ShrewSoft!

	sudo qikea

Step 9 (Optional):  Create a link on Desktop with proper Icon
 
![CreateVPNLink](../images/CreateShrewVPNLinkOnIDEdesktop.png)

Step 10: Run the ShrewSoft and Import a .vpn file

![ImportVPNFile](../images/VpnFileImportInShrew.png)


Step 11: Eventually open properties of atvts just loaded and adjust the IP addrees of the desired vApp that you want to reach as end point of your tunnel.
The ip address could be easily found using the ping to the atvtsXXYY desired vApp known name. 
Then you can change the installed atvts file right clicking on the vpn file icon imported into ShrewSoft Main windows, and this IP and then select " Modify"  or " Property" option as in figure:
 
![SetIPinShrewVPNFile](../images/SetShreSoftVPNFileWithDesiredIP.png)

Step 12: Double click on the atvts icon in ShrewSoft main page and connect to activate tunnel. 
Then you can reach everything is hosted and visible at the end of the tunnel

![OpenTunShrewVPNFile](../images/OpenTunnlAndSSHConnect.png)

[back to menu](#Menu)


## <a name="CompactDiskImage"></a>**5.16. - How to easy compact ENM-IDE box-disk1 file disk size**

Each time that you use ENM-IDE for a while may happen that the associated virtual disk increased up to the configured limit (40GBytes) or up to have no more space left in your host  (Windows PC or ELX or other system that hosts VirtualBoxwith Vagrant ENM-IDE's machine).
It is important to see that even if you remove files and/or docker images internally from ENM-IDE, the visrtual disk size won't decrease.

To be more clear, you can run ENM-IDE and open a shell, then check the space using norma "df -h "  command, and then proceeed to remove manually files and/or docker images s(dangling or not). 

At this point if you type again "df -h"  yhou should note that the available space will increase, and the occupied space will be decreased.
But, when you come back to your host, for example your Windows PC, you can note that the space occupied by the ENM-IDE's virtual disk didn't decreased.
The reason of that is becasue the space into the vistual disk is not continous and, even if there are apparently still space,also this space is filled with blanks.
The solution is to write all blank data into a file and then remove it (procedure already described in chapter 5.13. - "How to safety reduce disk space on IDE").
Here below the step by step procedure to reduce box-disk1 size and free space on your host.

1) Open your OracleVirtualBox, select ENM-IDE_base that with right-click mouse button and select "Settings...->Storage"  option, and take a look to the extention of your "box-disk1". 

**IMPORTANT:**
If the file named "box-disk1" have an extention ".vdi" you can soon jump to the step 5.
Otherwise, if it have extention ".vmdk" you have to continue with rows below.

Remove the box-disk1 that appears in that window selecting the "-" symbol as in figure:

 ![RemoveDisk1](../images/RemoveDisk1VBoxBaseIDE_Screenshot.png)


2) copy your last ENM-IDE's hard disk "box-disk1.vmdk" into a safe place with enough spage (i.e.  external disk/pendrive or another directory in your PC). 

3) if your disk is not yet in the .vdi format extension, you have to conver that using following command:

    $ VBoxManage clonehd "box-disk1.vmdk" "box-disk1.vdi" --format vdi
    0%...10%...20%...30%...40%...50%...60%...70%...80%...90%...100%
    Clone hard disk created in format 'vdi'. UUID: 482654d4-3a4d-4552-b07b-ce5ce8d8becd

4) **load this new .vdi disk into the ENM_IDE_Base** 

select "chose existing disk":

![ChoseExistingDisk](../images/ChoseExistingDiskVBoxBaseIDE_Screenshot.png)

and then select the just converted .vdi disk

![SelectNewExtDisk](../images/SelectNewExtendedDiskVBoxBaseIDE_Screenshot.png)

5) **boot your ENM_IDE_Base and open a shell with Terminal** 

open a shell with Terminal and install a logical volume manager.
In this example we used GParted to resize the LVM physical volume. 
GParted won't let you shrink the LVM physical volume to a size smaller than what the unallocated space allows, so you have to follow carefully these instructions.
Into the shell you opened on IDE type following commands:

    remove all dangling docker images:
    $ docker rmi $(docker images -f "dangling=true" -q)
    $ docker ps -a    (this will show you all containers with their IDs)
    $ docker rm <list blank spaced contatiners IDs>
    $ docker images   (this will show you all local images with IDs)
    $ docker rmi --force <lis of blank spaced docker images IDs>

Open a git bash in your Windows PC and move to the path where is located your Vagrantfile (by default for ENM-IDE is in the classic path "C:\Users\yoursignum\gitrepos\ide\vagrant").

    $ cd ~/gitrepos/ide/vagrant

Type following command to log into the ENM_IDE from outside of VirtualBox (like as if it is running in headless mode):

    $ vagrant ssh -p  
    
Type following commands to defrag virtual disk saving the "free sectors" into a file.

    $ sudo dd if=/dev/zero of=/emptyfile bs=1M

This will create one big file that only contains zeros. We have to remove that:

    $ sudo rm -rf /emptyfile

The file will get as big as the free space was before, so dd will abort when there is no free space left. With the second "sudo" then you just delete the file.

    NOTE:   If you were not able to connect to ENM-IDE using the "vagrant ssh -p"  command you can type both previous last two commands from a shell into the ENM-IDE launched using VirtualBox, but be careful becasue in this case VirtualBox uses your RAM to buffer all the data you are saving into the ENM-IDE's virtual disk into the  "emptyfile". 
    Be careful becasue you free available RAM could be in this case quickly consumed and machine could go in pause. The external access is preferred because you avoid to involve VirtualBox in operations on virtual disk.
   


6) **shutdown your ENM_IDE_Base and open a cmd or a git bash on your PC** 

then in that shell you have opened, type following commands:

    $ cd ~/"VirtualBox VMs"/ENM_IDE_Base   
    $ VBoxManage modifyhd "box-disk1.vdi" --compact
    0%...10%...20%...30%...40%...50%...60%...70%...80%...90%...100% 

This command will compact your VDI disk removing all blank spaces (it works as a "defrag" in Windows) 

7) open Windows Explorer and go into the directory "C:\Users\`yoursignum`\VirtualBox VMs\ENM_IDE_Base".

![PathOfIDEdisks](ENM_IDE_Base_DirStructure.png)

you will see the size of your box-disk1.vdi file will be reduced than before.

8)  ath this point you have to choice the "+"  button to insert your previously saved disk "box-disk1.vmdk"  (or box-disk1/vdi)

 ![ChoseExistingDisk](../images/ChoseExistingDiskVBoxBaseIDE_Screenshot.png)

![SelectNewExtDisk](../images/SelectNewExtendedDiskVBoxBaseIDE_Screenshot.png)

Once you done this youn can press "Ok"button to exit, and then double clicking on the ENM-IDE desktop icon you should be able to restart again your oldest ENM-IDE successfully restored.



# <a name="UpgradeIDE"></a>**6. Upgrade IDE and packages**

[back to menu](#Menu)

To upgrade IDE globally or single IDE packages there are both automatic scripts and manual procedure.
When this chapter were wrote the most part of automatic scripts are still in development .


##<a name="UpgradeDocker"></a>**6.1. How to upgrade Docker on IDE**

ENM-IDE has built over an Ubuntu-Base Vagrant VM that is the same since a while.
The idea of ENM-IDE is to avoid to update the base machine for each update or software change, so that developers can avoid to destroy their development environment at each IDE deliver.
Ide-installer deliveries follow this philosophy: 
      leave the Ubuntu Base VM as it is but deliver new ide-installer and packages and scripts to keep updated their own VM without destroy that, and sure that packages to be get are tested and common for all developers.
Also docker packages are managed with this rule.
So soon after the fisrt installation of ENM-IDE, it has on board following docker versions:

	docker-engine:      1.11.1, build 5604cbe
	docker-compose:     1.6.2,  build 4d72027

But on the cifwk-APT common official (for IDE) repo area, the versions are kept updated to the last more recente version certified by ENM coaches as working for ENM.
This is the reason becasue when developer types "sudo apt-cache policy docker-compose" to check installed docker version, the 1.6.2-0enm is showed near to "Installed:"  field,  instead a more recent version (i.e. "1.12.0-1enm) is showed near to the "Candidate: " label.
So only if a developer want to update dockers on IDE he will work with the most recently updated on “APT for IDE”  repo versions, otherwise he will continue to use the old versions
Here below is described an example of the manual procedure that must be carefully followed to manually update Docker packages on your already installed IDE.
An automatic procedure, based on usage of scripts may be not yet delivered in your installed IDE version., but you can check easy that simply typing "sudo apt-cache policy docker-upgrade"
If after that command any package will be displayed, you must use following manual procedure to upgrade docker version.
Versions can change in future, but the sequence of steps is the same as below described.
To check what docker versions are installed on IDE, following commands can be used:

	1) sudo apt-cache policy docker-engine
	2) sudo apt-cache policy docker-compose

Both commands above suggests also if there is a more recent version available.

Recommended extra packages for Trusty 14.04

	1) sudo apt-get update
	2) sudo apt-get install docker-engine
	3) sudo apt-get remove docker-compose
	4) sudo apt-get install docker-compose
	5) shut down the IDE
	6) reboot the IDE (using a gitBash on "C:\Users\<yoursignum>\gitrepos\ide\vagrant" and typing there "vagrant up".  Or you can more easy reboot clicking the ENM-IDE desktop icon).


Here you are the docker versions result after the end of the upgrade procedure:

	docker:   17.04.0-ce build 4845c56; 
	docker-compose:   1.12.0 build b31ff33 
	and 
	docker-engine:  17.04.0-ce-0-ubuntu-trusty

[back to menu](#Menu)


##<a name="UpgradeEclipse"></a>**6.2. How to upgrade Eclipse on IDE**

Fortunately for this operation automatic scripts are available on IDE.
First, you have simply to download these scripts on your IDE getting them from official IDE APT repo area:

	sudo apt-get update
	sudo apt-get install eclipse-update

At this point you should have into your IDE installed all the scripts that you need to complete update Eclipse and all its components.
At this point is enough that you type this command:

	eclipse-update.sh

This should update your Eclips version to the last available on APT IDE repo area.


##<a name="GetNewVagrantfile"></a>**6.3. How to get new Vagrantfile and apply changes**

Sometime new fix for ENM-IDE could be solved simply delivering a new Vagrantfile.

In all these cases it is very simple to get new delivered Vagrantfile into your local PC, and apply the changes to your personal ENM-IDE without install again that.

To get the new version of Vagrantfile a script it exists into your C:\Users\yoursignum\ENM-IDE directory, but, becasue it works usually only if you have Git 1.9.x installed.

So a more simple way to get latest version of Vagrantfile open a Git bash on your Windows PC and type these commands:

	$ cd ~/gitrepos/ide/vagrant 
	
	$ git archive --remote=ssh://egiogiu@gerrit.ericsson.se:29418/OSS/com.ericsson.de/ide.git HEAD:vagrant Vagrantfile | tar -x
	
	$ vagrant reload --provision




#<a name="TroubleShoot"></a>**7. Troubleshooting **

---------------------

This troubleshooting chapter contains a collection of known solutions for most common situations you can meet during installation, configuration and usage of ENM-IDE.
If your trouble is not present or the specified solution doesn't resolve your issue you have to open a ticket to CI-Infra team as this example at following link:  [CIS-37824](https://jira-nam.lmera.ericsson.se/browse/CIS-37824)

![Ticket Example](../images/TicketFieldToBeCompiledExample.png)

[back to menu](#Menu)


##<a name="UseAddOns"></a>**7.1. Alternative mode to install additional packages**

- **cdt2 package:**
        #If standard apt-get install command didn't worked fine you can do
        
	        su – root
	        npm install -g cdt2 --registry http://presentation-layer.lmera.ericsson.se/registry --proxy null 
			cdt2 self-update


-  **nodejs installation:**

		sudo ln -s 'which nodejs' /usr/bin/node
		sudo update-alternatives --install /usr/bin/node node /usr/bin/nodejs 10
		sudo npm install -g cdt2 --registry http://presentation-layer.lmera.ericsson.se/registry --proxy null

- Phantomjs :
	Download phantomjs using:
	
		wget http://presentation-layer.lmera.ericsson.se/registry/phantomjs-bin/-/phantomjs-bin-2.0.0-1.tgz
	then unzip and copy all into /usr/local/lib/node_modules/ and type following commands:
	
			sudo cp -rf package /usr/local/lib/node_modules/
			cd /usr/local/lib/node_modules/ 
			sudo mv package/ phantomjs-bin/

- **Versant :**
	if "sudo apt-get install versant"  fails, you can follow this alterantive steps:

		1) sudo apt-get install xinetd
		2) enter as root su -
		3) using "vagrant" as root password
		4) set a your preferred passowrd for user "ubuntu". 
			Usually is a good thing to use for user "ubuntu" the same password as root: 
			    passwd ubuntu
			    "vagrant"
		5) on your IDE open Firefox
		6) type following [url](https://cifwk-oss.lmera.ericsson.se/prototype/packages/versant/)
		7) in the "Version" column click on 1.0.18-2enm item.
		8) on the popup window that will appear select "Open with [Ubuntu Software Center (default)]" option and press "Ok" button
		
		9) the Ubuntu Software Centre window should be opened at this point and you have to select "install" button ignoring all eventual messages that says you that this software is unreliable. If asked, type your "ubuntu"  password. 

[back to menu](#Menu)

##<a name="ErrorsAccessVersant"></a>**7.2. Errors on access to Versant database during Acceptance tests on IDE**

 Sometime could happen that running Arquillian tests on IDE fails because of seems that there are versant db access rights issues for your user.
	In detail you should see that you are unable to complete arquillian tests run with an ERROR message that report an "UNAUTHORIZED_ACCESS" to the versant database you are using (i.e. dps_integration):
	
	*[INFO]      [java] 2017-01-26 16:56:58 INFO SchemaDefineTask:114 - Execution [2] failed - exception thrown:javax.persistence.PersistenceException: Datastore error 7083 - UT_SS_UNAUTHORIZED_ACCESS: Unauthorized remote login: %d  
	[INFO]      [java]     returned in response to [com.versant.odbms.net.RPC_CONNECT] by database [dps_integration@localhost].*

The reason of that error is becasue the database was previously created as "root" user.
Remeber that is mandatory to create each versant database not as user "versant"  and not as "root" user.
If you have already created some db as root, it is necessary to log as root and remove that:

	-  `<yoursignum>`@vagrant-ubuntu-trusty-64:~$ su - root
	-  Password: vagrant
	-  root@vagrant-ubuntu-trusty-64:~# ls -la /usr/local/versant/databases/
	-  root@vagrant-ubuntu-trusty-64:/usr/local/versant/databases# /usr/local/versant/bin/stopdb `<db_name>` 
	-  root@vagrant-ubuntu-trusty-64:/usr/local/versant/databases# /usr/local/versant/bin/removedb `<db_name>`
	
Or you can aso use the "rm -Rf":

	- root@vagrant-ubuntu-trusty-64:~# rm -Rf /usr/local/versant/databases/`<db_name>`

Then you have to follow step by step the ["above"](#CreateVersantDB) described procedure to properly create the database as "versant" user.

[back to menu](#Menu)

###<a name="CreateVersantDBError"></a>**7.2.1 Error on creating Versant database on IDE**



Following the installation guide page, I've installed versant using the commands described in section [CreateVersantDB](#CreateVersantDB).
After the installation i observe the following behavior:

    HOME directory is not set for the versant user:
    su - versant
    Password:
    No directory, logging in with HOME=/
    $
    I'm not able to create a db manually
        cd /usr/local/versant/bin
        makedb dps_integration
        VERSANT Utility MAKEDB Version 8.0.2
        Copyright (c) 1988-2014 VERSANT Corporation
        Making directory at /usr/local/versant/databases/dps_integration ...
        Back end profile created at /usr/local/versant/databases/dps_integration/profile.be
        UT_ER_CREATE_FEDIR: Could not create application process profile. Check disk space, permissions, etc. ("ut/makeprof.c", line 370)
        Removing database directory /usr/local/versant/databases/dps_integration ...
    I'm not able to run my arquillian testsuite due to a versant error

        ERROR VersantPersistence:161 - Datastore error 7001 - UT_DB_NOT_FOUND: DB directory not found
        ....
        javax.persistence.PersistenceException: Datastore error 7001 - UT_DB_NOT_FOUND: DB directory not found
        ....
        Caused by: com.versant.odbms.DatastoreException: Datastore error 7001 - UT_DB_NOT_FOUND: DB directory not found
        ....

The solution is to create the database as root user as follows:

	sudo -i
	cd /usr/local/versant/bin
	./makedb dps_integration
	./dbid -N
	./createdb dps_integration

[back to menu](#Menu)


## <a name="NoLeftSpace"></a>**7.3. IDE becomes slow due to abnormal increase of used disk space**.

  Each time you create a new docker, a new image is produced if since the last time you created your previous docker, some changes are produced in remote reference artifactory images or in some of its layer.

Unfortunately in these cases your oldest images are kept in images list for eventual reuse: so those images need explicit deletion with a dedicated command.

When system will update (docker pull) a new docker version (let's say for dps-integration) old one will stay available in docker images without being connected to system under test (in case of future reuse).
You can watch those by inspecting docker images with docker images, unreferenced images are listed with "none" as tag and repository:

    >:~$ docker images
    REPOSITORY                                TAG                 IMAGE ID               CREATED             SIZE
    armdocker../../dps-integration           latest              8a756907d4b0        8 hours ago         3.641 GB
    armdocker../../model-service             latest              15ea6e562b50        9 hours ago         385.7 MB
    armdocker../../jboss-netconf-mediation   latest              ceb8b28a5026        9 hours ago         851.8 MB
    jee_access_control                       latest              e59a4f25e6a6        2 days ago          353.4 MB
    <none>                                   <none>              cca3831085f9        3 days ago          385.7 MB
    <none>                                   <none>              c421918656a0        3 days ago          3.654 GB
    <none>                                   <none>              39b51b5232e4        3 days ago          851.8 MB
    armdocker../../postgres                  latest              1d676328d07c        13 days ago         261.6 MB
    armdocker../../access_control            onbuild             cfdd35a42766        10 months ago       353.4 MB

    

So every time there is a new dps-integration version available there is roughly 4G of memory consumption.

My recommendation is to perform cleaning action on regular basis or in {{./docker-stop.sh }} script.
This command will clean all unreferred image in your system but leaves all the layers that are "none" but only because are common layers for existing referenced images.

     > docker rmi $(docker images -f "dangling=true" -q) 


This coul be not enough becasue may be that, in spite of reduced space internally, by the external point of view of tyour host, the virtual disk file box-disk1.xxx will still continue to increase its size.
The solution is in this chapter: [How to easy compact ENM-IDE box-disk1 file disk size](#CompactDiskImage)	
     
[back to menu](#Menu)

## <a name="IDEDoNotStart"></a>**7.4. IDE Boot Failures**

---------------------


All times that your IDE won't  start you can follow these steps to recover this situation:

[back to menu](#Menu)

###<a name="GenericIDEBootFail"></a>**7.4.1. Generic failure during boot up**


1. check in your C:\Users\ `<signum>`\"VirtualBox VMs" during the "vagrant up" and if there is an ENM_IDE_Base directory plus another with name that starts with "ENM_IDE_Base" followed by a long numner as "ENM_IDE_BASE_4e2f5436...." you have to remove both of them and try to restart again the vagrant machine.

2. if the error is as in following figure:

	![Installer path](../images/ErrorBootingIDE_ReinstallVBoxNeed.png)

    it means that you have for some reason a VirtualBox on your PC that is corrupted for Vagrant requirements. So to solve this you have to [uninstall](#UninstVirtBox) your VirtualBox and install them again.

3. go into the C:\Users\ `<signum>`\"VirtualBox VMs" (or if you use another own directory where you store the VMs) and open the *.\ENM_IDE_Base\ENM_IDE_Base.vbox* file.
Then check if the number that is between brace brackets in the field `"<Machine uuid="{}"` is the same present in the the C:\Users\ `<signum>`\.VirtualBox\VirtualBox.xml, at the "MachineEntry" filed with ENM_IDE_Base like as following: 

   `<MachineRegistry>`
	      `<MachineEntry uuid="{7d7aa04d-ea6e-4ead-8506-8dd103fb2fed}" src="C:\Users\eenrall\VirtualBox VMs\ENM_IDE_Base\ENM_IDE_Base.vbox"/>`
	    `</MachineRegistry>`

4. check if the VirtualBox_Extention_Pack has been correctly installed and that its version is aligned with that of you installed VirtualBox.

[back to menu](#Menu)

###<a name="CantOpenFile"></a>**7.4.2. ERROR:  Couldn't open file....**

If the "vagrant up"  fails with following error message on desktop startup windows or in log file:

    Startup error:
    ==> default: Adding box 'base' (v0) for provider: virtualbox
    default: Downloading: base
    default:
    An error occurred while downloading the remote file.      
    The error message, if any, is reproduced below. Please 
    fix this error and try again.

    Couldn't open file /C:/Users/emalobe/gitrepos/ide/vagrant/base

In this case you have to do following steps on your Windows PC:

    a) open a git bash on your Windows PC
    b) go in directory: ~/gitrepos/ide/vagrant
    c) type this command to copy a new Vagrantfile locally on your PC:

    git archive --remote=ssh://yoursignum@gerrit.ericsson.se:29418/OSS/com.ericsson.de/ide.git HEAD:vagrant Vagrantfile | tar -x

    d) from that path (C:\Users\emalobe\gitrepos\ide\vagrant), type "vagrant up" (or double click on ENM_IDE icon on your desktop, if present)

[back to menu](#Menu)



###<a name="NOSuchDev"></a> **7.4.3. Boot failed: STATUS_NO_SUCH_DEVICE (rc=-101)**

May happen that after a successful IDE installation at the boot of IDE following message appear:

   ![No_Such_Dev_Err](../images/NO_SUCH_DEVICE-101_Err.png)

and/or this error message is into the "OutVagrantUp.log"  file:

    ==> ENM IDE: Waiting for machine to boot. This may take a few minutes...
    The guest machine entered an invalid state while waiting for it to boot. Valid states are 'starting, running'. The machine is in the 'poweroff' state. Please verify everything is configured properly and try again.

In this case could be that the virtualization management is not still enabled in your Windows PC. 
Rebbot your PC and go into the BIOS manager, and follow the instructions at the beginning of [**Prerequisites**](#EnableVirtualization) in this document.

[back to menu](#Menu)


###<a name="CantRemountRDWR"></a>**7.4.4. Boot Error: "couldn't remount RDWR because of unprocessed orphan inode list..."**

May be that if your Windows PC power off in the meantime that ENM_IDE is running, you are non more able to start your IDE VM because following error it appears:

   ![Boot_Err_Inode](../images/BOOTFailure_InodeErrored.png) 

Here are the steps to took in case anyone else encounters this problem:

1) **Download a bootable linux .iso.**

IDE is running using Ubuntu 14.04 x64, so you need to use the ".iso" that should be into the C:\Users\yoursignum\ENM_IDE\ISO directory, or, if not present, download the 64-bit Ubuntu 14.04 installation .iso from [**here**](http://releases.ubuntu.com/14.04/). 
It shouldn't really matter what release you download, as long as it supports your file system and you are familiar with it.

2) **Mount the .iso file in the VM as a virtual CD-ROM.**

From the console, run virtualbox to open the Virtual Box configuration GUI. From there, go to: Settings -> Storage -> Add CD/DVD Device -> Choose disk. Browse to the .iso file you just downloaded.

3) **Boot from the .iso file.**

Now start the boot process for your VM by using the command vagrant up. During boot, you should be prompted to press a key to select a boot device (For me it was F12). Now select CD-ROM to boot from. The .iso you downloaded should boot. If you are using Ubuntu, select Try Ubuntu. Now, start a Terminal window.

4) **Unmount and fsck the disk**

In the terminal, you may first have to unmount the virtual HDD. 
a) Usually your box-disk1.vmdk/vdi disk is mapped as device: /dev/sda1, so chech that by typing 

	df -h
	
and check if is present such device.
May be that you disk could be mounted with a different logical volume name than " /dev/sda1":  you can easy recognize it checking the total size in df -h result. You can know what is your current disk size checking the "box-disk1.vmdk/vdi file size details.
If you don't identify any logical volume disk that is near or more than 40GB total disk space, it means that your corrupted box-disk1 is not mounte, so you can skip to step c).
b) You can easy check if your corrupted box-disk1 disk is mounted as a logical volume you have to unmount that:

	sudo -i umount /dev/sda1
c) But it is also possible that the " df -h" don't  shows your disk at all. 
This don't means that is not visible to your new Ubuntu system, but only that is still unmounted, so you can directly pass to next step:
at this step you can then run fsck on the disk:

	sudo -i fsck /dev/sda1
After confirming the fixes answering " yes"  to all questions, shutdown this VM.
Then restart the IDE typing " vagrant up"   or double click on desktop icon.
All should be back to normal.

[back to menu](#Menu)

   

### <a name="IDENotVisibleInVBox"></a>**7.4.5. IDE Don't start: new VM is created**

Could happen that each time you try to run your ENM-IDE VM, Vagrant does not starts that, instead tries to create each time a new ENM_IDE_Base_`<number>` into the directory where you have your previous ENM_IDE_Base machine to be run.
In all these cases you have to check into the ENM_IDE_Base\ENM_IDE_Base.vbox if the field "Machine uuid" has a number that is different by that into the file C:\Users\ `<signum>`\.VirtualBox\VirtualBox.xml in the same filed "MachineEntry uuid=".
In short, under your directory C:\Users\ `<yoursignum>`\"VirtualBox MVs" you should have an ENM_IDE_base directory that must be structured as in figure:

   ![ENM_IDE_Base_DirStructure](../images/ENM_IDE_Base_DirStructure.png)

The first reason becasue your IDE does not start could be that, instead of that showed in figure, the ENM_IDE_Base.vbox file for some reason is no more present on your path.
In this case you should still have the "ENM_IDE_Base.vbox-prev" in that directory, so it is enough that you copy that file into the ENM_IDE_Base.vbox

	cp ENM_IDE_Base.vbox-prev ENM_IDE_Base.vbox

and then try to restart your IDE.
If still won't work the issue could be due to a corruption or erasure of the "id" file that is containd into the directory used by Vagrant to recognize if there are already some Vagrant VM to be booted up:

	C:\Users\`<signum>`\gitrepos\ide\vagrant\.vagrant\machines\ENM IDE\virtualbox

Both if the "id" file is absent or not, you have to follow steps described in folowing [7.4.6.](#IDENotVisibleInVBox)  paragraph.


[back to menu](#Menu)


### <a name="IDENotVisibleInVBox"></a>**7.4.6. IDE Don't start: any effect by clicking more time on ENM_IDE desktop icon nor running "vagrant up"**

This is similar issue to the previous one, because if you check carefully into your directory C:\Users\ `<yoursignum>`\"VirtualBox MVs" yous should see one "ENM_IDE_Base" directory, that is your previusly created IDE, and one or more directories with name as "ENM_IDE_Base+`< an SHA1 number>`".
This means that you couild have corrupted or lost the files that help Vagrant to identify that a Vagrant VM is already present on your VirtualBox, and that must be booted up.
If Vagrant is not able to find these "vagrant VM identifier" files it will try to create anothe machine, and the "ENM_IDE_Base+`< an SHA1 number>`" means exacly that:  Vagrant try to  create a new ENM_IDE_Base and during this creation Vagrant append the new "machine identifier" at the end of the new ENM_IDE_Base directory name, as in following image.

   ![Multiple_IDE_Base_Dirs](../images/MultipleIDE_Base_Dir.png)

In all these cases you have to check into the directory where Vagrant is searching for the "id"  of your already installed IDE machine ENM_IDE_Base to be boot up. 
This directory is asubpath standard stasting from the place where you pot your Vagranfile on your PC.
In case of IDE the ide-installer copied the Vagranfile into the directory:

	C:\Users\`<signum>`\gitrepos\ide\vagrant

so the "id"  file that Vagrant search to boot up your VM is uder this path:

    C:\Users\`<signum>`\gitrepos\ide\vagrant\.vagrant\machines\ENM IDE\virtualbox
    
if you go on this path you must see at least three files: 

   - "index_uuid"
   - "id"
   - "creator_uid"

as you can see int his figure:

   ![Machine_Id_Files_InSubDir](../images/Machine_Id_SubdirWithMinimumFiles.png)

But you should also have your ENM_IDE_Base directory 
At this point you can have two different situations the above files are present or not.

- If the above files are present it means that the "id" file is corrupted, so you have to open your file  "id" file and substitute its content (a single row with an SHA-1 number) with the number "Machine uuid" number that is in 'C:\Users\ `<yoursignum>`\"VirtualBox MVs"\ENM_IDE_Base\ENM_IDE_Base.vbox'.

   ![ENM_IDE_Base_vbox_Details](../images/ENM_IDE_Base_vbox_Details.png)


- instead, if "id" file is not present you have to create that. 
  It must have the "Machine uuid" SHA-1 number value that you can find into your machine's file 'C:\Users\ `<yoursignum>`\"VirtualBox MVs"\ENM_IDE_Base\ENM_IDE_Base.vbox'.
  
If also the other two files "index_uuid" and "creator_uid"  are not present in "C:\Users\ `<signum>`\gitrepos\ide\vagrant\.vagrant\machines\ENM IDE\virtualbox", you have to create that:

- Into the "index_uuid"  file you must write an hexadecimal string with 32 chars length that you prefer. Here below an example is reported that you can cut and paste easily into that new file:

	fa367e55b4c5417a8068b62c897f32eb

- Into the "creator_uid"  file you have simply to write a single char: "0".

Once you have completed allo above, you can try to restart you ENM_IDE, by typing, as usual, the ENM-IDE icon on your desktop or opening a Git bash, more into the directory where is located the IDE's Vagrantfile "C:\Users\ `<signum>`\gitrepos\ide\vagrant" and typing "vagrant up"

[back to menu](#Menu)


### <a name="IDEStuckOnUbuntuUser"></a>**7.4.7. IDE Don't start: stuck on "Ubuntu" user prompt**

This issue happen each time that the booting of IDE, instead of complete its process ariving to the desktop where is automatically connected with your account, it is in stuck at the "Ubuntu"  user login window as follows. 


![IDE_UbuntuLoginDesktopPrompt](../images/IDE_UbuntuLoginDesktopPrompt.png)


The solution of this issue could be simply on uninstall your VBExtentionPack and also your VirtualBox from your PC and the install again that (a VirtualBox.msi is available for IDE into your PC at following path:

    "C:\Users\ `<yoursignum>`\ENM_IDE\VirtualBox" 

If this solution does not work you can check if your Windows Firewall is enabled:  if yes, disable that.

Another solution is to run VirtualBox.exe and ckeck if "settings" of your ENM_IDE_Base has the   "Cable Connected"  checkbutton option in the "Network Details":  this flag must be checked as in following image:

![VBox_IDENetworkProperties](../images/VBox_IDENetworkProperties.png)

If also this solution deos not work, there is a last cause that coul dbe the reason of this issue.
This issue it depends by the presence on your Windows PC of the  "LavasoftTcpService64.dll" that is part of "WebCompanion" antivirus and ance is present on your PC, it is used by Windows at runtime.
Even if you have not installed this "WebCompanion" on your PC could be that some unhautorized banner could installed that for you and then you or your official antivirus could removed that.
But more often the uninstall of WebCompanion don't remove teh above ".dll", that can still stay on yuour C:\Windows\system32  directory for a while, used by Windows even if WebCompanion is no more present.
The problem is that because the WebCompanion package is no more present, no one chack if the "LavasoftTcpService64.dll"  license certificate is expired. 
Since that the "WebCompanion" certificate expired for this dll, so Windows cannot more use this and this works as if a sort of "TCP firewall" is activated.
So Vagrant cannot access via ssh to your IDE when boots up and is not able to configure the IDE Ubuntu Base with your Vagranfile cinfiguration instructions that makes you able to have your ENM_IDE_Base configured and ready to use with your signum username.
This "certificate expired issue" can be easy verified taking a look into VirualBox log: open your OracleVirtualBox and go into the "Machine->Show log..."  menu.
You can also check if this error is present running your VirtualBox and right-click selecting the ENM_IDE_Base.
At this point you should see a "Show log...." option, and opening that you have the VirtualBox log of the last run of your ENM_IDE_base, where should be present a row with something like this:

	supR3HardenedErrorV: supR3HardenedScreenImage/LdrLoadDll: rc=VERR_LDRVI_UNSUPPORTED_ARCH fImage=1 fProtect=0x0 fAccess=0x0 \Device\HarddiskVolume1\Windows\System32\LavasoftTcpService64.dll: WinVerifyTrust failed with hrc=CERT_E_EXPIRED on '\Device\HarddiskVolume1\Windows\System32\LavasoftTcpService64.dll

	supR3HardenedErrorV: supR3HardenedMonitor_LdrLoadDll: rejecting 'C:\windows\system32\LavasoftTcpService64.dll' (C:\windows\system32\LavasoftTcpService64.dll): rcNt=0xc000019000:00:03.429893 NAT: Failed to redirect TCP 127.0.0.1:2222 -> 0.0.0.0:22 (Unknown error)

The actions tha can be done to solve this problem are two:
1) Oper in your Windows PC the "programs and Features" list and search if present "WebCompanion" and uninstall that. Then start again the IDE with double click on ENM-IDE icon on your desktop (or open a git bash and go on ~gitrepos/ide/vagrant/ and then run vagrant up command).
2) If "WebCompanion" is not present in "Programs and Features" list in your PC, you have to get that from its official website: http://webcompanion.com/download and install it.
Then soon after installation, refresh the "Programs and Features" list and uninistall "WebCompanion.
Finally start again the IDE with double click on ENM-IDE icon on your desktop (or open a git bash and go on ~gitrepos/ide/vagrant/ and then run vagrant up command).

Another reason of this issue could be into a wrong syntax into the Vagrantfile you have in C:\Users\yoursignum\gitrepos\ide\vagrant, related to the mount of your host home directory into the ENM-IDE itself.
To do that Vagrant needs to access via ssh to the just now created ENM-IDE, and if this fails, in this case you should have into the C:\Users\yoursignum\ENM_IDE\log\OutVagrantUp.log something as following error:  

        stdin: is not a tty
	id: <yoursignum>: no such user
	id: <yoursignum>: no such user
	uid= requires an argument (i.e. uid==<arg>)

More often you can solve this issue searching for into your Vagrantfile the row that starts as follows: 
	
	config.vm.synced_folder "#{ENV['HOME']}/gitrepos/shared", "/mnt/#{ENV['CURRENT_USER']}/shared",.........


changing that entire row statement with this one:

	config.vm.synced_folder "#{ENV['HOME']}", "/mnt/#{ENV['CURRENT_USER']}/home", :mount_options => ["rw","dmode=777,fmode=777"]

Alternatively, you can also get the new Vagrantfile following these steps:

    1) edit C:\Users\yoursignum\ENM_IDE\GetVagrantFile.bat
    2) if you area using Git version >= 2.x on your PC, in first row substitute "Program Files (x86)" with simpy "Program Files", than save it end exit
    3) by Windows Explorer double clock on this batch file
    4) open a Git Bash, and type "cd ~/gitrepos/ide/vagrant"
    5) type  "vagrant reload --provision" 

At this point your ENM-IDE with correct Vagrantfile wil be up and running.
	

[back to menu](#Menu)


### <a name="IDE_InstallCDT2ERR"></a>**7.4.8. CDT2 Install Failure: npm ERR! Error: EACCES: permission denied, mkdir '/home/egiomor/.npm/cdt-serve'**


Sometimes could happen that standard command "sudo apt-get install cdt2" requires you to install previously "npm" and after that, typing again the cd2 installation, you have several errors like this:

	npm ERR! Error: EACCES: permission denied, mkdir '/home/<yoursignum>/.npm/cdt-serve'
	npm ERR!  { Error: EACCES: permission denied, mkdir '/home/<yoursignum>/.npm/cdt-serve'
	npm ERR!   errno: -13,
	npm ERR!   code: 'EACCES',
	npm ERR!   syscall: 'mkdir',
	npm ERR!   path: '/home/<yoursignum>/.npm/cdt-serve' }
	npm ERR! 
	npm ERR! Please try running this command again as root/Administrator.

The reason of that is that more often to install npm you have to go into the system menu of your ENM-IDE in "Settings->Software&Update->Other Software"  and uncheck the repo that starts with "https://cifwk-oss.lmera.ericsson.se....." becasue otherwise the npm installation fails.
You have also to "untick", if present,  the two deb.nodesource.com repos (see attached screenshot) before installing npm:

![IDEAPTNodesourceRepos](../images/DebNodesourceRepos.png)

After that, the reason of taht errors is:

    the access rights of your "/tmp" directory
    in fact you have access rights on that like this:

      drwxrwxrwt   5 root root       4096 May 31 08:28 tmp

    that is not correct.
    So I've changed that with this command as root user

         egiomor@vagrant-ubuntu-trusty-64:/$ su -
         Password: 
         root@vagrant-ubuntu-trusty-64:~# cd /
         root@vagrant-ubuntu-trusty-64:/# chmod -R 777 /tmp
         root@vagrant-ubuntu-trusty-64:/# ls -altr
         total 4194412
             ........................
             drwxrwxrwx   5 root root       4096 May 31 08:28 tmp

    that is now more correct.

But at this point you have to completely uninstall from your IDE all what regarding npm, cdt2 and nodejs installed before, becasue these wrong access rights on yout "/tmp" dire had for sure impacted that packages installations did you done, and so that programs are not correctly working.
To remove all and clean all cached data you have to do following steps from your user "egiomor":

      ~$ sudo apt-get remove cdt2
      ~$ sudo apt-get remove nodejs
      ~$ sudo apt-get remove npm
      ~$ sudo apt-get update

      ~$ sudo rm -rf /usr/local/bin/npm /usr/local/share/man/man1/node* /usr/local/lib/dtrace/node.d ~/.npm ~/.node-gyp /opt/local/bin/node opt/local/include/node /opt/local/lib/node_modules 

       ~$ sudo rm -rf /usr/local/lib/node*

       ~$ sudo rm -rf /usr/local/include/node*

       ~$ sudo rm -rf /usr/local/bin/node*

At this point you have to install again npm and cdt2 using same steps you used before:

    1) Uncheck in Software&Updates->Other Software the "https://cifwk-oss.lmera.ericsson.se....."
    2) type "sudo apr-get update"
    3) type "sudo apt-get install npm
    4) check again in Software&Updates->Other Software the "https://cifwk-oss.lmera.ericsson.se....."
    5) type "sudo apt-get install cdt2"


[back to menu](#Menu)


### <a name="IDE_NotStartChangeBatch"></a>**7.4.9. ENM-IDE don't start: double click on desktop icon does not have any effect**

Sometime could be happen that double clicking on ENM-IDE desktop icon (and also running manually the batch script "C:\Users\yousignum\ENM_IDE\RunVagrantUp.bat" a batch dos window appears on your desktop for a little and soon close, but ENM_IDE don't start and any other effects you can see.
In this situation could be that you have lost rights to write into the ENM-IDE log directory "C:\Users\yoursignum\ENM_IDE\log"  and the script launched by icon just tries to write on this folder, and it fails and exist for this reason.
To solve this you can try to:

    1) go in C:\Users\yoursignum\ENM_IDE folder in youe Windows PC
    2) edit RunVagrantUp.bat   batch script
    3) delete this string:
            " 2> C:\Users\egiogiu\ENM_IDE\log\OutVagrantUp.log"
    4) save the batch script
   
   At this time double clicking on your ENM_IDE desktop icon you should be able to see your ENM_IDE that starts.

[back to menu](#Menu)

### <a name="IDE_DarkDesktop"></a>**7.4.10. ENM-IDE don't start: the desktop of your ENM-IDE's VM is dark and no commands/click have any effects**

In this case may be your ENM-IDE machine filled all the available space on its virtual hard disk assigned:  box-disk1.vmdk, that by default is defined to have 40GB size at the most.
Check opening OracleVirtualBox or take alook into your C:\Users\yoursignum\"VirtualBox VMs"\ENM_IDE if the .vmdk or .vdi disk size arrived at their limit.
In this case the solutions are two:
1)  [Increase box-disk1 file upper limit](#ExtendRAMSpace)
2) [Defrag ENM-IDE box-disk1 file disk so that its file size is reduced.](#CompactDiskImage)	

###<a name="SudoersError"></a> **7.4.11. Boot failed: "sudo: parse error in /etc/sudoers near line... "**

This error may happen also after several successful boot up ad usage, expecially when some docker imaging download could fail due to network broken issue.

>>> /etc/sudoers: syntax error near line 30 <<<
sudo: parse error in /etc/sudoers near line 30
sudo: no valid sudoers sources found, quitting
sudo: unable to initialize policy plugin


The reasons of this error could be two:
1) the "vagrant"  file contained into the ENM-DIE at path "/etc/sudoers.d" is corrupted.

	root@vagrant-ubuntu-trusty-64:/etc/sudoers.d# ls -la
	total 28
	drwxr-x---   2 root root  4096 May  5  2016 .
	drwxr-xr-x 144 root root 12288 Nov  6 16:02 ..
	-r--r-----   1 root root   123 May  5  2016 90-cloud-init-users
	-r--r-----   1 root root   958 Feb 10  2014 README
	-r--r-----   1 root root   170 Nov  6 13:11 vagrant
	root@vagrant-ubuntu-trusty-64:/etc/sudoers.d# vi vagrant

Opening that "vagrant" file the situation in this case should be similat to this:

![IDEAPTNodesourceRepos](../images/SudoersVagrantFileCorrupted.png)


The solution is simply to delete almost all the lines leaving only one or two for each user, as in this figure:

![IDEAPTNodesourceRepos](../images/SudoersVagrantFileCorrected.png)

After saved the "vagrant"  file the issue should be solved. 
You can easy verify that opening a bash on ENM-IDE and launching "sudo apt-get update" command: it should work without the "sudoers" error.

2) the "/etc/sudoers"  file is not correctlty parsed, becasuse of wrong characters are present or there are blank rows among the descriptions and the fisrt statement for that sections, or, more often, in some row the statements are separated by spaces instead of TABs. 
Verified all that above and eventually fixed changes, after saved the "sudoers"  file the issue should be solved. 
You can easy verify that opening a bash on ENM-IDE and launching "sudo apt-get update" command: it should work without the "sudoers" error.


[back to menu](#Menu)


##<a name="OtherTroubles"></a>**7.5. OTHER Common Troubles**


#### <a name="HomeDirNotMounted"></a>**7.5.1. Windows home dir not mounted on IDE**

If you are not able to see you Windows home PC directory mounted into the /mnt/ `<signum>`/home directory on IDE, it means that for some reason Vagrant during the "vagrant up"  bootup didn't recognized your user matching with that is present on LDAP.
This could also create as result that you have two directory mounted on IDE in /mnt:  one with name that is your signum in lowercase and the other that has as name your signum in capital letter: in this case IDE alternative will mount your home Windows FS on the lowercase on the uppercase name directory.
This situation is typical when you have not followed the prerequisite to install git on your PC and generate from a git bash an ssh key for your Windows user signum.
Solutions:
1) restart the ENM-IDE using the "vagrant up"  command.
2) check and evntually disable your Windows Firewall.
2) go into your IDE in the directory "~/.ssh" and copy there your  
2) destroy your IDE machine performing a "vagrant destroy -f" command on a git bash in your Windows PC and then restart the ENM-IDE. 

[back to menu](#Menu)

####<a name="TrbleEclipsePlugin"></a>**7.5.2. Trouble installing Eclipse plugins**
If yo uhave trouble on installing pluging into Eclipse (Jacoco, PDM, etc.) may be that you point to a wrong proxy in the Eclipse configuration.
To solve this issue you have to use the "www-proxy.lmera.ericsson.se" exacly as per "apt-get" see before in this manual.
Run Eclipse and go into "Windows->Preferences->General->Network Connections" and change the proxy in the first two fields as in following figure showed:

![Proxy_For_Eclipse](../images/SetProxyOnEclipseForPlugins.png)

[back to menu](#Menu)


####<a name="TrbleDNS"></a>**7.5.3. Couldn't resolve host using docker-compose**

This erroralready happened sometimes during pm mediation tests with VerticalSlice.
Some rpms were not correctly downloaded from Nexus (arm101-eiffel004 server) during the "docker-compose up" command.
The error message were as follows:
  
	curl: (6) Couldn't resolve host arm1s11-eiffel004.eiffel.gic.ericsson.se 
  
But the NSLookup for that server is ok, butin fact this error ir random happening.
The solution is to edit the two system files that managing the nslookup and apply  following changes:

1.    open /etc/host.conf like and change lines as follow: 

	 #order hosts,bind 
	 order bind,hosts 

2.  open  /etc/nsswitch.conf  and apply these changes:

	 #hosts:     files mdns4_minimal [NOTFOUND=return] dns mdns4 
	 hosts:        dns files 
 
  
[back to menu](#Menu)



#<a name="Uninst"></a>**8. Uninstall Instructions**

### <a name="UninstVirtBox"></a>**8.1. Uninstall Virtual Box**

In order to correcly uninstall you previous installed VirtualBox here you are the steps:

>1. Open VirtualBox, go in main its menu bar, File->Preferences then select 
               "Extentions" and is present click on "Oracle VM VirtualBox Extention pack..."
               and select the "x" button on the right side of this window and uninstall the 
               Extention pack. Repeat for all the ExtPacks that are present.
            
>2. Open Start->Control Panel->"Programs and Features" on your PC, search for the "Oracle Virtualbox...." voice, left click on that with your mouse and select "Uninstall"
>3. Restart your Windows PC

[back to menu](#Menu) 

### <a name="UninstallIDE"></a>**8.2. Uninstall ENM-IDE from your Windows PC**


In order to restore original env and eventually prepare a new IDE install from scratch
here below you are the steps to completely uninstall ENM IDE and clean the target PC.

>1. Stop all VMs
>2. Open VirtualBox, go in main its menu bar, File->Preferences then select 
               "Extentions" and is present click on "Oracle VM VirtualBox Extention pack..."
               and select the "x" button on the right side of this window and uninstall the 
               Extention pack. Repeat for all the ExtPack that are present.
>3. open git bash, and con in cd ~\gitrepos\ide\vagrant, and then perform 
               "vagrant destroy -f"
 >4. if the above commadn won't work remove the ENM_IDE_BAase from VBox confirming to remove all files
>5. Stop all VirtulXX process that you can see still tun on resource monitor
>6. Open ControlPanel->ProgramsAndFeatures
             - Uninstall Vagrant (answer No when ask if reboot and simply press F5 after to 
                refresh program list.... vagrant will disappear from list)
             - Uninstall VcXsrv
             - Close any VirtualBox instance and Uninstall OracleVirtualBox
             - Uninstall "ENM_IDE version x.y.z"
>7. Go on C:\Users\ `<signum>`\"VirtualBox VMs" subdir ad save your ENM_IDE_Base VM directory as it is in another volume (C:\Temp or open drive or other).
>8. Go on your User's home dir (C:\Users\ `<signum>`) and remove these directories:
               - ".vagrant.d" 
               - ".VirtualBox"
>9. Be careful that following directories are no more present:
                - C:\Users\ `<signum>`\ENM_IDE
                - C:\Users\ `<signum>`\gitrepos
                Eventually you have to manual remove both of them.
>10. Reboot the PC

#<a name="clone"></a>**9. Create Vagrant machine clone**

Vagrant includes a simple way to package VirtualBox base boxes. Once you've installed all the software you want to install, you can run this command:

$ vagrant package --base my-virtual-machine

Where "my-virtual-machine" is replaced by the name of the virtual machine in VirtualBox to package as a base box.

It will take a few minutes, but after it is complete, a file "package.box" should be in your working directory which is the new base box. At this point, you've successfully created a base box!

This packages a currently running VirtualBox or Hyper-V environment into a re-usable box. This command can only be used with other providers based on the provider implementation and if the provider supports it.


**Step by step example**

From a clean host environment, where ENM-IDE was not installed please take care about the following steps...

From the user who has the Vagrant machine to be cloned:

- under C:\Users\<signum>\gitrepos\ide\vagrant (or the folder where is located the Vagrant file) please open a git bash shell and execute the following command: "vagrant package". This command will create a file called "package.box".

From the user who wants to install the cloned Vagrant machine:

- standard ENM-IDE installation, BUT please say NO when the installer prompt ask to you if you want to run "vagrant up";

- copy the "package.box" file from your colleague's computer to your one and put it under C:\Users\<signum>\gitrepos\ide\vagrant;

- please execute C:\Users\elucmos\ENM_IDE\CloneENM-IDE.bat, that will create your Vagrant machine on the basis of the cloned one.
