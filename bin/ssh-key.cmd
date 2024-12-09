@ECHO OFF
SET HOME=%HOMEDRIVE%%HOMEPATH%
SET CYGWIN=nontsec
SET CWRSYNCHOME=C:\Program Files (x86)\CWRSYNC
SET CWOLDPATH=%PATH%
SET PATH=%CWRSYNCHOME%\BIN;%PATH%

ssh-keygen -t rsa
copy /y "%HOME%\.ssh\id_rsa.pub" "%HOME%\.ssh\authorized_keys"

set HOME=
set CWRSYNCHOME=
set CYGWIN=
set PATH=%CWOLDPATH%
set CWOLDPATH=
