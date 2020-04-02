@echo ---[ Win7 x86 install initing winPE ]---
wpeinit

@echo ---[ Mounting win7 ISO ]---
call server.bat
net use y: \\%SERVER%\win7x86 pxe /user:pxe

@echo ---[ Running windows setup ]---
@echo NOTE: Give it a minute while we bypass all the usual crap...
@echo NOTE: You should get the Install-To/Drive screen up shortly!
y:\iso\setup.exe /unattend:y:\unattend_win7x86.xml

@echo Something went wrong with the installer, dropping to shell.
cmd.exe
