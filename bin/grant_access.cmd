@echo off
c:
if not exist c:\temp md \Temp

cd \temp
if exist \\dc2isi00smb.oit.ncsu.edu\cos\stat\Redirect\%username% (
    net use s: \\ncsudrive.ncsu.edu\cos\stat\Redirect\%username%
)
if exist s:\ GOTO :PERMS

:SDRIVE
echo "SDrive"
md \\dc2isi00smb.oit.ncsu.edu\cos\stat\Redirect\%username%
Icacls  \\dc2isi00smb.oit.ncsu.edu\cos\stat\Redirect\%username% /grant:r "WOLFTECH\COS-Share-ISI-Admins":(OI)(CI)F /T /C /L /Q
Icacls  \\dc2isi00smb.oit.ncsu.edu\cos\stat\Redirect\%username% /grant:r "WOLFTECH\%USERNAME%":(OI)(CI)F /T /C /L /Q
md \\dc2isi00smb.oit.ncsu.edu\cos\stat\Redirect\%username%\AppData
md \\dc2isi00smb.oit.ncsu.edu\cos\stat\Redirect\%username%\Contacts
md \\dc2isi00smb.oit.ncsu.edu\cos\stat\Redirect\%username%\Desktop
md \\dc2isi00smb.oit.ncsu.edu\cos\stat\Redirect\%username%\Documents
md \\dc2isi00smb.oit.ncsu.edu\cos\stat\Redirect\%username%\Documents\www
Icacls \\dc2isi00smb.oit.ncsu.edu\cos\stat\Redirect\%username%\Documents\www /grant:r "WOLFTECH\STAT.web.service":(OI)(CI)RX /T /C /L /Q
md \\dc2isi00smb.oit.ncsu.edu\cos\stat\Redirect\%username%\Downloads
md \\dc2isi00smb.oit.ncsu.edu\cos\stat\Redirect\%username%\Favorites
md \\dc2isi00smb.oit.ncsu.edu\cos\stat\Redirect\%username%\Links
md \\dc2isi00smb.oit.ncsu.edu\cos\stat\Redirect\%username%\Music
md \\dc2isi00smb.oit.ncsu.edu\cos\stat\Redirect\%username%\Pictures
md \\dc2isi00smb.oit.ncsu.edu\cos\stat\Redirect\%username%\"Saved Games"
md \\dc2isi00smb.oit.ncsu.edu\cos\stat\Redirect\%username%\"Start Menu"
md \\dc2isi00smb.oit.ncsu.edu\cos\stat\Redirect\%username%\Searches
md \\dc2isi00smb.oit.ncsu.edu\cos\stat\Redirect\%username%\Videos
net use s: \\dc2isi00smb.oit.ncsu.edu\cos\stat\Redirect\%username% /persistent:no

:PERMS
echo "Modifying Perms"
if exist "\\dc2isi00smb.oit.ncsu.edu\cos\stat\Redirect\%username%\Documents\.stat" GOTO :PROFILE

set datestr=%date%
set result=%datestr:/=-%
@echo %result% > \\dc2isi00smb.oit.ncsu.edu\cos\stat\Redirect\%username%\Documents\.stat

:PROFILE
if exist "s:\Documents\.statpf" GOTO :END
echo "Profile"
Icacls  \\dc2isi00smb.oit.ncsu.edu\cos\stat\Profiles\%username%.v6 /grant:r "WOLFTECH\%USERNAME%":(OI)(CI)F /T /C /L /Q
Icacls \\dc2isi00smb.oit.ncsu.edu\cos\stat\Profiles\%username%.v6\ /grant:r "WOLFTECH\COS-Share-ISI-Admins":(OI)(CI)F /T /C /L /Q

set datestr=%date%
set result=%datestr:/=-%
@echo %result% > S:\Documents\.statpf
echo "...[Finishing]"
GOTO :END


:END
echo "DONE!"
set datestr=
set result=

