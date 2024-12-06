@echo off
set USBDRIVE=D
SET CWRSYNCHOME=C:\Program Files\CWRSYNC
SET CYGWIN=nontsec
SET CWOLDPATH=%PATH%
SET PATH=%CWRSYNCHOME%\BIN;%PATH%
REM *** This variable is needed to find .ssh directory ***
REM *** Set userid for Server ***
set USER=%USERNAME%

set LOGFILE=bkup-log.txt
set ARCHIVE=%USERPROFILE%
cd %ARCHIVE%

rsync -rltvzpog "Desktop" --delete "/cygdrive/%USBDRIVE%/%USERNAME%"
rsync -rltvzpog "Documents" --delete "/cygdrive/%USBDRIVE%/%USERNAME%"
rsync -rltvzpog "Downloads" --delete "/cygdrive/%USBDRIVE%/%USERNAME%"
rsync -rltvzpog "Favorites" --delete "/cygdrive/%USBDRIVE%/%USERNAME%"
rsync -rltvzpog "Music" --delete "/cygdrive/%USBDRIVE%/%USERNAME%"
rsync -rltvzpog "Pictures" --delete "/cygdrive/%USBDRIVE%/%USERNAME%"
rsync -rltvzpog "Videos" --delete "/cygdrive/%USBDRIVE%/%USERNAME%"
 


REM *** Removing the RSYNC Environment Variables ****
set USER=
set SERVER=
set SRVDIR=
set ARCHIVE=
set HOME=
set CWRSYNCHOME=
set CYGWIN=
set PATH=%CWOLDPATH%

:END