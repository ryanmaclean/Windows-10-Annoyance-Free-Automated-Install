# Windows 10 Professional Annoyance-Free Automated USB Install

## Introduction
A guide to creating a Windows 10 install without all of the "extras" - disabled One Drive, Soda Crush, etc.

## Download Windows 10
Use the Windows media creation tool to get a copy of Windows 10. Once your media is created, git clone this repository (or donwload a zip) and add all of the files to the root of the USB stick. 

## A Head Start
I've included two sample files that can be used once you have a Windows 10 install USB stick created: `autounattend.xml` and `customize.xml`.

Note, however, that they are customized to my liking. In particular, you will want to query/replace the username `winadmin` and the password `muggles` from within `autounattend.xml`. Otherwise, I think the defaults are pretty rational. 

Should you wish to simply make your own starter file, the [Windows Answer File Generator](http://windowsafg.no-ip.org/win10x86_x64.html) is a big help. 

Furthermore, the `sysprep.bat` and `customize.xml` files assumes that you've only got one CDROM, one HDD and one USB stick attached to your Virtual Box VM. If this is not the case, chances are your WIM file will not be located in `E:/sources/install.wim#Windows 10 Pro` and the sysprep command parameter `/unattend:e:\customize.xml` should also be edited in turn. 

You can stop here if it worked for you, otherwise, continue along for testing, and modifications. 
## Download Virtual Box
We'll use Virtual Box to prepare the USB stick because it runs on [Windows](http://download.virtualbox.org/virtualbox/5.0.24/VirtualBox-5.0.24-108355-Win.exe), [Mac](http://download.virtualbox.org/virtualbox/5.0.24/VirtualBox-5.0.24-108355-OSX.dmg) and [Linux](https://www.virtualbox.org/wiki/Linux_Downloads)
## Download Plop
As we're using Virtual Box, we'll bootstrap the USB boot when testing with a tiny [Plop Boot Manager ISO](https://download.plop.at/files/bootmngr/plpbt-5.0.15.zip). Note that on some platforms you can get this done with the Virtual Box tools and accepting a further agreement. 

Once downloaed, unzip the ISO to a location you'll use in a moment when creating your virtual machine.
## Create a Test Virtual Machine
Create a Windows 10 64bit virtual machine in Virtual Box, making sure to attach you newly-created USB stick to it.
## First Boot
Continue the install as usual until you are met with the "express"/"custom install" screen. At this point press ctrl+shift+f3 in order to get into audit mode. 
## Audit Modes
You be presented with a sysprep window - simply cancel it for now. 
## Default Profile
Make the changes you want to see in default profiles now. 

Steps to take:
* Start a command prompt by pressing win+r, then typing "cmd"
* Run O&O Shutup 10 like so: `e:/oosh10.exe /silent /config auto.cfg`
* Disable the consumer content (games, etc.): `regedit /s e:/disableconsumerfeatures.reg`
* Uninstall OneDrive: `e:/uninstall_onedrive.bat`

## Sysprep
Once you are done customizing your default user, run the sysprep command by double-clicking on `sysprep.bat` in your USB stick. 
## Unattended Configuration File
Now it's time to create your unattended config file. You can use mine, but you may be better served using the wizard here: http://windowsafg.no-ip.org/win10x86_x64.html 

Add this file to the root of your USB stick. 
## Image to WIM
## Convert to ESD
## Test Install
## Using the USB Disk
## Resources Used 

* https://blogs.technet.microsoft.com/mniehaus/2015/11/11/removing-windows-10-in-box-apps-during-a-task-sequence/
* http://www.tenforums.com/tutorials/3020-windows-10-image-customize-audit-mode-sysprep.html
* https://msdn.microsoft.com/en-us/windows/hardware/commercialize/manufacture/desktop/boot-windows-to-audit-mode-or-oobe
* http://www.virten.net/2014/12/howto-usb-boot-a-vm-in-vmware-workstation-11/
* https://technet.microsoft.com/en-ca/library/dn621902.aspx
* https://technet.microsoft.com/en-us/itpro/windows/deploy/create-a-windows-10-reference-image
* http://windowsafg.no-ip.org/win10x86_x64.html
* https://github.com/alek-sys/sublimetext_indentxml
* http://winaero.com/blog/fix-windows-10-installs-apps-like-candy-crush-soda-saga-automatically/
* https://www.oo-software.com/en/shutup10
* https://www.winreducer.net/winreducer-es-wim-converter.html
