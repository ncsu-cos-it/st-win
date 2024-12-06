@echo off
md \\wolftech.ad.ncsu.edu\COS\STAT\Redirect\%username%\Documents\www
Icacls "\\wolftech.ad.ncsu.edu\cos\stat\redirect\%username%\Documents\www" /grant "WOLFTECH\STAT.web.service":(OI)(CI)R /T /C /L /Q
icacls "\\wolftech.ad.ncsu.edu\cos\stat\redirect\%username%\AppData" /grant "WOLFTECH\COS-OU Admins":(OI)(CI)F /T /Q
icacls "\\wolftech.ad.ncsu.edu\cos\stat\redirect\%username%\Contacts" /grant "WOLFTECH\COS-OU Admins":(OI)(CI)F /T /Q
icacls "\\wolftech.ad.ncsu.edu\cos\stat\redirect\%username%\Desktop" /grant "WOLFTECH\COS-OU Admins":(OI)(CI)F /T /Q
icacls "\\wolftech.ad.ncsu.edu\cos\stat\redirect\%username%\Documents" /grant "WOLFTECH\COS-OU Admins":(OI)(CI)F /T /Q
icacls "\\wolftech.ad.ncsu.edu\cos\stat\redirect\%username%\Downloads" /grant "WOLFTECH\COS-OU Admins":(OI)(CI)F /T /Q
icacls "\\wolftech.ad.ncsu.edu\cos\stat\redirect\%username%\Favorites" /grant "WOLFTECH\COS-OU Admins":(OI)(CI)F /T /Q
icacls "\\wolftech.ad.ncsu.edu\cos\stat\redirect\%username%\Links" /grant "WOLFTECH\COS-OU Admins":(OI)(CI)F /T /Q
icacls "\\wolftech.ad.ncsu.edu\cos\stat\redirect\%username%\Music" /grant "WOLFTECH\COS-OU Admins":(OI)(CI)F /T /Q
icacls "\\wolftech.ad.ncsu.edu\cos\stat\redirect\%username%\Pictures" /grant "WOLFTECH\COS-OU Admins":(OI)(CI)F /T /Q
icacls "\\wolftech.ad.ncsu.edu\cos\stat\redirect\%username%\Saved Games" /grant "WOLFTECH\COS-OU Admins":(OI)(CI)F /T /Q
icacls "\\wolftech.ad.ncsu.edu\cos\stat\redirect\%username%\Searches" /grant "WOLFTECH\COS-OU Admins":(OI)(CI)F /T /Q
icacls "\\wolftech.ad.ncsu.edu\cos\stat\redirect\%username%\Start Menu" /grant "WOLFTECH\COS-OU Admins":(OI)(CI)F /T /Q
icacls "\\wolftech.ad.ncsu.edu\cos\stat\redirect\%username%\Videos" /grant "WOLFTECH\COS-OU Admins":(OI)(CI)F /T /Q
