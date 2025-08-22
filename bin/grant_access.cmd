@echo off
c:
cd \temp

if not "%USERDOMAIN%"=="WOLFTECH" GOTO :END

if exist \\dc2isi00smb.oit.ncsu.edu\cos\stat\Redirect\%username% (
        net use s: \\ncsudrive.ncsu.edu\cos\stat\Redirect\%username%
)
if not exist s:\ GOTO :SDRIVE



echo "Modifying Perms"
if exist "s:\Documents\.stat" GOTO :PROFILE
Icacls  \\dc2isi00smb.oit.ncsu.edu\cos\stat\Redirect\%username% /grant:r "WOLFTECH\COS-Share-ISI-Admins":(OI)(CI)F /T /C /L /Q
md s:\Documents\www
Icacls \\dc2isi00smb.oit.ncsu.edu\cos\stat\Redirect\%username%\Documents\www /grant:r "WOLFTECH\STAT.web.service":(OI)(CI)RX /T /C /L /Q

set datestr=%date%
set result=%datestr:/=-%
@echo %result% > S:\Documents\.stat


:PROFILE
if exist "s:\Documents\.statpf" GOTO :END
echo "Profile"
Icacls \\dc2isi00smb.oit.ncsu.edu\cos\stat\Profiles\%username%.v6\ /grant "WOLFTECH\COS-Share-ISI-Admins":(OI)(CI)F /T /C /L /Q

set datestr=%date%
set result=%datestr:/=-%
@echo %result% > S:\Documents\.statpf
echo "...[Finishing]"
GOTO :END

:SDRIVE
echo "SDrive"
md \\dc2isi00smb.oit.ncsu.edu\cos\stat\Redirect\%username%
Icacls  \\dc2isi00smb.oit.ncsu.edu\cos\stat\Redirect\%username% /grant:r "WOLFTECH\COS-Share-ISI-Admins":(OI)(CI)F /T /C /L /Q
md \\dc2isi00smb.oit.ncsu.edu\cos\stat\Redirect\%username%\AppData
md \\dc2isi00smb.oit.ncsu.edu\cos\stat\Redirect\%username%\Contacts
md \\dc2isi00smb.oit.ncsu.edu\cos\stat\Redirect\%username%\Desktop
md \\dc2isi00smb.oit.ncsu.edu\cos\stat\Redirect\%username%\Documents
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

:END
set datestr=
set result=
