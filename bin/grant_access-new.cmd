@echo off
c:
if not exist c:\temp md \Temp

cd \temp
if exist \\dc2isi00smb.oit.ncsu.edu\cos\stat\redirect\%username% (
	net use s: \\ncsudrive.ncsu.edu\cos\stat\redirect\%username%
)
if exist s:\ GOTO :PERMS

:SDRIVE
echo "SDrive"
md \\dc2isi00smb.oit.ncsu.edu\cos\stat\redirect\%username%
md \\dc2isi00smb.oit.ncsu.edu\cos\stat\redirect\%username%\AppData
md \\dc2isi00smb.oit.ncsu.edu\cos\stat\redirect\%username%\Contacts
md \\dc2isi00smb.oit.ncsu.edu\cos\stat\redirect\%username%\Desktop
md \\dc2isi00smb.oit.ncsu.edu\cos\stat\redirect\%username%\Documents
md \\dc2isi00smb.oit.ncsu.edu\cos\stat\redirect\%username%\Documents\www
md \\dc2isi00smb.oit.ncsu.edu\cos\stat\redirect\%username%\Downloads
md \\dc2isi00smb.oit.ncsu.edu\cos\stat\redirect\%username%\Favorites
md \\dc2isi00smb.oit.ncsu.edu\cos\stat\redirect\%username%\Links
md \\dc2isi00smb.oit.ncsu.edu\cos\stat\redirect\%username%\Music
md \\dc2isi00smb.oit.ncsu.edu\cos\stat\redirect\%username%\Pictures
md \\dc2isi00smb.oit.ncsu.edu\cos\stat\redirect\%username%\"Saved Games"
md \\dc2isi00smb.oit.ncsu.edu\cos\stat\redirect\%username%\"Start Menu"
md \\dc2isi00smb.oit.ncsu.edu\cos\stat\redirect\%username%\Searches
md \\dc2isi00smb.oit.ncsu.edu\cos\stat\redirect\%username%\Videos
net use s: \\dc2isi00smb.oit.ncsu.edu\cos\stat\redirect\%username% /persistent:no

:PERMS
echo "Modifying Perms"
if exist "\\dc2isi00smb.oit.ncsu.edu\cos\stat\redirect\%username%\Documents\.stat" GOTO :END
Icacls \\dc2isi00smb.oit.ncsu.edu\cos\stat\redirect\%username% /inheritance:r
Icacls \\dc2isi00smb.oit.ncsu.edu\cos\stat\redirect\%username% /grant:r "WOLFTECH\COS-Share-ISI-Admins":(OI)(CI)F /T /C /L /Q
Icacls \\dc2isi00smb.oit.ncsu.edu\cos\stat\redirect\%username% /grant:r "WOLFTECH\%USERNAME%":(OI)(CI)F /T /C /L /Q
Icacls \\dc2isi00smb.oit.ncsu.edu\cos\stat\redirect\%username% /grant:r "ISO_PROV-NAS-Filesystem-Admins":(OI)(CI)F /T /C /L /Q
Icacls \\dc2isi00smb.oit.ncsu.edu\cos\stat\redirect\%username% /grant:r "WOLFTECH\STAT.web.service":R 
Icacls \\dc2isi00smb.oit.ncsu.edu\cos\stat\redirect\%username%\Documents /grant:r "WOLFTECH\STAT.web.service":R 
Icacls  \\dc2isi00smb.oit.ncsu.edu\cos\stat\redirect\%username% /grant:r "WOLFTECH\COS-Share-ISI-Admins":(OI)(CI)F /T /C /L /Q
echo "....[Finishing]"

set datestr=%date%
set result=%datestr:/=-%
@echo %result% > \\dc2isi00smb.oit.ncsu.edu\cos\stat\redirect\%username%\Documents\.stat
GOTO :END

:END
echo "DONE!"
set datestr=
set result=

