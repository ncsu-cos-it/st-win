@ECHO OFF
SET USER=%USERNAME%

SET ARCHIVE=C:\Users\%USER%
SET SRVDIR=WINDOWS
SET SERVER=geek.stat.ncsu.edu

SET CWRSYNCHOME=C:\Program Files\CWRSYNC
SET CYGWIN=nontsec
SET HOME=%HOMEDRIVE%%HOMEPATH%
SET CWOLDPATH=%PATH%
SET PATH=%CWRSYNCHOME%\BIN;%PATH%

cd %ARCHIVE%
rsync -e ssh -avz %USER%@%SERVER%:%SRVDIR%/"Contacts" .
rsync -e ssh -avz %USER%@%SERVER%:%SRVDIR%/"Desktop" .
rsync -e ssh -avz %USER%@%SERVER%:%SRVDIR%/"Documents" . 
rsync -e ssh -avz %USER%@%SERVER%:%SRVDIR%/"Favorites" .
rsync -e ssh -avz %USER%@%SERVER%:%SRVDIR%/"Music" .
rsync -e ssh -avz %USER%@%SERVER%:%SRVDIR%/"Pictures" .
rsync -e ssh -avz %USER%@%SERVER%:%SRVDIR%/"Videos" .

    
set HOME=
set CWRSYNCHOME=
set CYGWIN=
set SERVER=
set SRVDIR=
set ARCHIVE=
set PATH=%CWOLDPATH%
set CWOLDPATH=
