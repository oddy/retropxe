# retropxe

## Things to know

* pxesrv is a tiny windows app that does (proxy) DHCP and just-enough file serving to make everything work.
* All the smarts is in files/main.ipxe
* i just use ipxe-undionly all the time i think, but ipxe.pxe is there too 
* This stuff works with clients in legacy pxe mode. I havent done any explicit fucking around with EFI. I dont know if its ipxe or legacy-bios-pxe that is saving me from its bullshit but it doesnt seem to matter. 
* See the note.txt file in each subfolder for more info.

### Windows boot

* You need an smb server with the various win os folders shared, share name same as folder name, u:pxe p:pxe
* wimboot runs winPE which mounts a network drive to get to the windows setup exe then runs that.
* Wimboot rules. wimboots version other than the included 260 aren't guaranteed to work.
* For the windows installs, your subnet needs a batch file in the ipbats folder, see the example one. 
* This is how we get smb fileserver location info to winPE when the dhcp/boot server has 0 smarts at all  
* the win7 is for RetroLAN Quakebooks, and has some unattend files to make it a "boot -> select install drive -> here's your desktop" 2-ciggie process.

### Other boots

* hdt shows booting syslinux com32 apps
* clonezilla shows booting linux with the fetch= squashfs filesystem trick.
* (Clonezilla wont work because its squashfs filesystem is missing because 250M & github had a whinge) 
* pmagic tries to boot a huge iso with memdisk, i think this worked a total of 1 times.
* iSCSI i've been using the built in iscsi server (aka 'target' hur dur) in server 2016. Works fkn sweet.

## iSCSI workflow

1) Boot client box, pick 'mount iscsi' from the menu
2) It will fail because there's no serial number in the ipxe file on your server for that computer, 
3) type a short meaningful label/name into the prompt on the client computer
4) This makes an http request to the tiny pxe server with your label and the mobo serial number
5) paste those BACK into the main.ipxe file up the top there, formatting appropriately
6) reboot the client box, if you did it right you'll now see your label on the menu screen
7) Make an iscsi drive and target on your iscsi server box
8) make sure everything ever is named the label, *including* the req IQN (you have to go back and edit that one after the wizard has finished)


