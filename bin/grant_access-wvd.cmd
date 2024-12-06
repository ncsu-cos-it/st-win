@echo off
c:
cd \temp
if exist s:\ GOTO :PERMS

:SDRIVE
echo "SDrive"
md \\dc2isi00smb.oit.ncsu.edu\cos\stat\Redirect\%username%
Icacls  \\dc2isi00smb.oit.ncsu.edu\cos\stat\Redirect\%username% /grant:r "WOLFTECH\COS-OU Admins":F /T /C /Q
Icacls  \\dc2isi00smb.oit.ncsu.edu\cos\stat\Redirect\%username% /grant:r "WOLFTECH\%USERNAME%":(NP)F /T /C /Q
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

:PERMS
echo "Modifying Perms"
if exist "\\dc2isi00smb.oit.ncsu.edu\cos\stat\Redirect\%username%\Documents\.stat" GOTO :END
Icacls  \\dc2isi00smb.oit.ncsu.edu\cos\stat\Redirect\%username% /grant:r "WOLFTECH\COS-OU Admins":(OI)(CI)F /T /C /L /Q
echo "Contacts"
Icacls  \\dc2isi00smb.oit.ncsu.edu\cos\stat\Redirect\%username%\Contacts /grant:r "WOLFTECH\COS-OU Admins":(OI)(CI)F /T /C /L /Q
echo "Desktop"
Icacls  \\dc2isi00smb.oit.ncsu.edu\cos\stat\Redirect\%username%\Desktop /grant:r "WOLFTECH\COS-OU Admins":(OI)(CI)F /T /C /L /Q
echo "Documents"
Icacls  \\dc2isi00smb.oit.ncsu.edu\cos\stat\Redirect\%username%\Documents /grant:r "WOLFTECH\COS-OU Admins":(OI)(CI)F /T /C /L /Q
echo "Downloads"
Icacls  \\dc2isi00smb.oit.ncsu.edu\cos\stat\Redirect\%username%\Downloads /grant:r "WOLFTECH\COS-OU Admins":(OI)(CI)F /T /C /L /Q
echo "Favorites"
Icacls  \\dc2isi00smb.oit.ncsu.edu\cos\stat\Redirect\%username%\Favorites /grant:r "WOLFTECH\COS-OU Admins":(OI)(CI)F /T /C /L /Q
echo "Links"
Icacls  \\dc2isi00smb.oit.ncsu.edu\cos\stat\Redirect\%username%\Links /grant:r "WOLFTECH\COS-OU Admins":(OI)(CI)F /T /C /L /Q
echo "Music"
Icacls  \\dc2isi00smb.oit.ncsu.edu\cos\stat\Redirect\%username%\Music /grant:r "WOLFTECH\COS-OU Admins":(OI)(CI)F /T /C /L /Q
echo "Pictures"
Icacls  \\dc2isi00smb.oit.ncsu.edu\cos\stat\Redirect\%username%\Pictures /grant:r "WOLFTECH\COS-OU Admins":(OI)(CI)F /T /C /L /Q
echo "Saved Games"
Icacls  "\\dc2isi00smb.oit.ncsu.edu\cos\stat\Redirect\%username%\Saved Games" /grant:r "WOLFTECH\COS-OU Admins":(OI)(CI)F /T /C /L /Q
echo "Searches"
Icacls  \\dc2isi00smb.oit.ncsu.edu\cos\stat\Redirect\%username%\Searches /grant:r "WOLFTECH\COS-OU Admins":(OI)(CI)F /T /C /L /Q
echo "Start Menu"
Icacls  "\\dc2isi00smb.oit.ncsu.edu\cos\stat\Redirect\%username%\Start Menu" /grant:r "WOLFTECH\COS-OU Admins":(OI)(CI)F /T /C /L /Q
echo "Videos"
Icacls  \\dc2isi00smb.oit.ncsu.edu\cos\stat\Redirect\%username%\Videos /grant:r "WOLFTECH\COS-OU Admins":(OI)(CI)F /T /C /L /Q
echo "AppData"
Icacls \\dc2isi00smb.oit.ncsu.edu\cos\stat\Redirect\%username%\AppData /grant "WOLFTECH\COS-OU Admins":(OI)(CI)F /T /C /L /Q
echo "Documents\www"
md s:\Documents\www
Icacls \\dc2isi00smb.oit.ncsu.edu\cos\stat\Redirect\%username%\Documents\www /grant:r "WOLFTECH\STAT.web.service":(OI)(CI)RX /T /C /L /Q
echo "....[Finishing]"

set datestr=%date%
set result=%datestr:/=-%
@echo %result% > \\dc2isi00smb.oit.ncsu.edu\cos\stat\Redirect\%username%\Documents\.stat
GOTO :END

:END
