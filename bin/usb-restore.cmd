@ECHO OFF
set USBDRIVE=D
SET CWRSYNCHOME=C:\Program Files\CWRSYNC
SET CYGWIN=nontsec
SET CWOLDPATH=%PATH%
SET PATH=%CWRSYNCHOME%\BIN;%PATH%
REM *** This variable is needed to find .ssh directory ***
REM *** Set userid for Server ***
SET USER=%USERNAME%

SET ARCHIVE=C:\Users\%USER%
SET SRVDIR=/cygdrive/%USBDRIVE%/%USERNAME%
SET HOME=%HOMEDRIVE%%HOMEPATH%

cd %ARCHIVE%
rsync -rltvzpog "%SRVDIR%/.ssh" .
rsync -rltvzpog "%SRVDIR%/Contacts" .
rsync -rltvzpog "%SRVDIR%/Desktop" .
rsync -rltvzpog "%SRVDIR%/Documents" . 
rsync -rltvzpog "%SRVDIR%/Favorites" .
rsync -rltvzpog "%SRVDIR%/Music" .
rsync -rltvzpog "%SRVDIR%/Pictures" .
rsync -rltvzpog "%SRVDIR%/Videos" .

    
set HOME=
set CWRSYNCHOME=
set CYGWIN=
set ARCHIVE=
set SRVDIR=
set PATH=%CWOLDPATH%
set CWOLDPATH=
