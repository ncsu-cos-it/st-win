@echo off
REM *** Set userid for Server ***
set USER=%USERNAME%

set LOGFILE=bkup-log.txt
set ARCHIVE=C:\Users\%USERNAME%
set SRVDIR=%COMPUTERNAME%
set SERVER=geek.stat.ncsu.edu


echo Backing up files......
echo ======================================================================= > "%ARCHIVE%\%LOGFILE%"
echo . >> "%ARCHIVE%\%LOGFILE%"
date /t >> "%ARCHIVE%\%LOGFILE%"
time /t >> "%ARCHIVE%\%LOGFILE%"
call c:\local\bin\nbackup >> "%ARCHIVE%\%LOGFILE%"
echo . >> "%ARCHIVE%\%LOGFILE%"
echo ======================================================================= >> "%ARCHIVE%\%LOGFILE%"

cd %ARCHIVE%
rsync -e ssh -rltvz --delete %LOGFILE% %USER%@%SERVER%:%SRVDIR%

REM *** Removing the RSYNC Environment Variables ****
set USER=
set SERVER=
set SRVDIR=
set ARCHIVE=
set HOME=
set CWRSYNCHOME=
set CYGWIN=
set PATH=%CWOLDPATH%
set CWOLDPATH=
:END
