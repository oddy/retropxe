@echo ---[ Win10 install initing winPE ]---
wpeinit

@echo ---[ Mounting win10 ISO ]---
call server.bat
net use y: \\%SERVER%\win10_pro pxe /user:pxe

@echo ---[ Running windows setup ]---
y:\iso\setup.exe 

@echo Something went wrong with the installer, dropping to shell.
cmd.exe
