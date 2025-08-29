@echo off
c:
if not exist c:\temp md \Temp

cd \temp
if exist \\dc2isi00smb.oit.ncsu.edu\cos\stat\dev\%username% (
	net use s: \\ncsudrive.ncsu.edu\cos\stat\dev\%username%
)
if exist s:\ GOTO :PERMS

:SDRIVE
echo "SDrive"
md \\dc2isi00smb.oit.ncsu.edu\cos\stat\dev\%username%
Icacls \\dc2isi00smb.oit.ncsu.edu\cos\stat\dev\%username% /inheritance:r
Icacls \\dc2isi00smb.oit.ncsu.edu\cos\stat\dev\%username% /grant:r "WOLFTECH\COS-Share-ISI-Admins":(OI)(CI)F /T /C /L /Q
Icacls \\dc2isi00smb.oit.ncsu.edu\cos\stat\dev\%username% /grant:r "WOLFTECH\%USERNAME%":(OI)(CI)F /T /C /L /Q
Icacls \\dc2isi00smb.oit.ncsu.edu\cos\stat\dev\%username% /grant:r "ISO_PROV-NAS-Filesystem-Admins":(OI)(CI)F /T /C /L /Q
Icacls \\dc2isi00smb.oit.ncsu.edu\cos\stat\dev\%username% /grant:r "WOLFTECH\STAT.web.service":R 
md \\dc2isi00smb.oit.ncsu.edu\cos\stat\dev\%username%\AppData
md \\dc2isi00smb.oit.ncsu.edu\cos\stat\dev\%username%\Contacts
md \\dc2isi00smb.oit.ncsu.edu\cos\stat\dev\%username%\Desktop
md \\dc2isi00smb.oit.ncsu.edu\cos\stat\dev\%username%\Documents
Icacls \\dc2isi00smb.oit.ncsu.edu\cos\stat\dev\%username%\Documents /grant:r "WOLFTECH\STAT.web.service":R 
md \\dc2isi00smb.oit.ncsu.edu\cos\stat\dev\%username%\Documents\www
Icacls \\dc2isi00smb.oit.ncsu.edu\cos\stat\dev\%username%\Documents\www /grant:r "Authenticated Users":(OI)(CI)R /T /C /L /Q
Icacls \\dc2isi00smb.oit.ncsu.edu\cos\stat\dev\%username%\Documents\www /grant:r "WOLFTECH\STAT.web.service":(OI)(CI)RX /T /C /L /Q
md \\dc2isi00smb.oit.ncsu.edu\cos\stat\dev\%username%\Downloads
md \\dc2isi00smb.oit.ncsu.edu\cos\stat\dev\%username%\Favorites
md \\dc2isi00smb.oit.ncsu.edu\cos\stat\dev\%username%\Links
md \\dc2isi00smb.oit.ncsu.edu\cos\stat\dev\%username%\Music
md \\dc2isi00smb.oit.ncsu.edu\cos\stat\dev\%username%\Pictures
md \\dc2isi00smb.oit.ncsu.edu\cos\stat\dev\%username%\"Saved Games"
md \\dc2isi00smb.oit.ncsu.edu\cos\stat\dev\%username%\"Start Menu"
md \\dc2isi00smb.oit.ncsu.edu\cos\stat\dev\%username%\Searches
md \\dc2isi00smb.oit.ncsu.edu\cos\stat\dev\%username%\Videos
net use s: \\dc2isi00smb.oit.ncsu.edu\cos\stat\dev\%username% /persistent:no

:PERMS
echo "Modifying Perms"
if exist "\\dc2isi00smb.oit.ncsu.edu\cos\stat\dev\%username%\Documents\.stat" GOTO :END
REM Icacls  \\dc2isi00smb.oit.ncsu.edu\cos\stat\dev\%username% /grant:r "WOLFTECH\COS-Share-ISI-Admins":(OI)(CI)F /T /C /L /Q
echo "....[Finishing]"

set datestr=%date%
set result=%datestr:/=-%
@echo %result% > \\dc2isi00smb.oit.ncsu.edu\cos\stat\dev\%username%\Documents\.stat
GOTO :END

:END
echo "DONE!"
set datestr=
set result=

