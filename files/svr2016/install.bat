@echo ---[ Server 2016 install initing winPE ]---
wpeinit

@echo ---[ Mounting svr2k6 ISO ]---
call server.bat
net use y: \\%SERVER%\svr2016 pxe /user:pxe

@echo ---[ Running windows setup ]---
y:\iso\setup.exe 

@echo Something went wrong with the installer, dropping to shell.
cmd.exe
