# ENM IDE : Making Contributions

## Build System Overview
The IDE build system is based on [Apache Maven&trade;](https://maven.apache.org/) and uses the [jdeb plugin](https://github.com/tcurdt/jdeb) to create .deb packages.

The source code is kept in the [git](https://git-scm.com/) project [OSS/com.ericsson.de/ide](https://gerrit.ericsson.se/#/admin/projects/OSS/com.ericsson.de/ide) which is hosted on [Gerrit Central](https://wiki.lmera.ericsson.se/wiki/Gerrit_Central/Home).

All included 3PPs are kept in [Eiffel ARM101](https://arm1s11-eiffel004.eiffel.gic.ericsson.se:8443/nexus) Nexus which is maintained by [Team Gitmo](http://confluence-nam.lmera.ericsson.se/display/CIE/ENM+DE+Infrastructure+Support+-+GITMO).  
These are downloaded at build time and re-packaged as .deb installable packages.

The IDE PPA repository is updated and Vagrant images produced using Jenkins jobs hosted on [Eiffel FEM101](https://fem101-eiffel004.lmera.ericsson.se:8443/jenkins/view/IDE_Releases/).

## Submitting Changes and New packages
Code changes are only accepted through the [Gerrit Code Review process](http://gerrit-documentation.googlecode.com/svn/Documentation/2.6/intro-quick.html).  
This page describes how to submit your code for review. If your proposed changes are approved, they will automatically be merged in to the master branch.

### For Changes Implemented on a Branch

The following procedure is recommended for submitting for review, code that has been implemented on a branch (i.e. not on the master)

1. Firstly, [Updating Your Branch](http://confluence-nam.lmera.ericsson.se/pages/viewpage.action?pageId=47684825) to ensure you have all the latest changes from master
2. Ensure all your changes are in a single commit. If multiple commits have been made, mutlipe code reviews will be created, which will be rejected by the guardian. You can use look at your history using "git log" or "gitk" if you need to check
3. Push to gerrit code review

       $ git push origin HEAD:refs/for/master

A code review will now be initiated by Gerrit Central whereby your code will be reviewed by a guardian. You can add additional reviewers, if desired, as follows:
1. Open the review in Gerrit Central
2. Enter the email address of the person you want to add as a reviewer in the provided box and click on the 'Add Reviewer' button as shown below  
![Add reviewer](../images/Add_Reviewer.png)  
3. Gerrit will send an email containing a link to the review, to the added reviewer

Note that while additional reviewers can provide comments, recommend approval or rejection of the change, they do not have authority to approve or reject the change. Only guardians have such authority.

When the reviewers have completed reviewing your code you will receive an email with any comments. The code will only be accepted if there are no comments found during the code review. If there are comments arising from the review, these must be implemented and the code re-submitted for review before it can be accepted.

**If you wish to start another implementation you should create a new branch, following the instructions in [Creating a Branch](http://confluence-nam.lmera.ericsson.se/display/CDO/Creating+a+Branch).  
_It is important these instructions are followed so as not to create a dependency in Gerrit between your un-approved changes._**

### Submitting Changes Implemented Directly on (local) master

It is strongly recommended that changes be implemented on a branch rather than directly on the master.  
If you implement your changes directly on your local master you may not be able to submit them for review as merge commits are not permitted to be submitted for review.
