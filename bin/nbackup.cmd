@ECHO OFF
REM **** RSYNC Environment **********
SET CWRSYNCHOME=C:\Program Files\CWRSYNC
SET CYGWIN=nontsec
SET CWOLDPATH=%PATH%
SET PATH=%CWRSYNCHOME%\BIN;%PATH%
REM *** This variable is needed to find .ssh directory ***
SET HOME=%ARCHIVE%
cd %ARCHIVE%

REM [MOZILLA Firefox/Thunderbird Addressbook and Bookmark BACKUP]
REM *** Change the * to be the correct Directory and Remove REM ***
REM ===========================================================================
echo .
echo Copying [Mozilla] Files to My Documents
REM if NOT EXIST "%ARCHIVE%\Documents\Mozilla"   mkdir "%ARCHIVE%\Documents\Mozilla"
REM xcopy /q /y "%APPDATA%\mozilla\Firefox\Profiles\2gedh81j.default\bookmarks.html" "%ARCHIVE%\Documents\Mozilla"
REM xcopy /q /y "%APPDATA%\Thunderbird\Profiles\rnicy702.default\*.mab" "%ARCHIVE%\Documents\Mozilla"

REM *** Must pass a directory name if you want the --delete feature to work ***
REM ===========================================================================
echo .
echo Backing up..... [.ssh]
rsync -e ssh -rltvz --delete ".ssh" %USER%@%SERVER%:%SRVDIR%
echo .
echo .
echo Backing up..... [Contacts]
rsync -e ssh -rltvz --delete "Contacts" %USER%@%SERVER%:%SRVDIR%
echo .
echo .
echo Backing up..... [Desktop]
rsync -e ssh -rltvz --delete "Desktop" %USER%@%SERVER%:%SRVDIR%
echo .
echo .
echo Backing up..... [Documents]
rsync -e ssh -rltvz --delete "Documents" %USER%@%SERVER%:%SRVDIR% 
echo .
echo .
echo Backing up..... [Favorites]
rsync -e ssh -rltvz --delete "Favorites" %USER%@%SERVER%:%SRVDIR% 
echo .
echo .
echo Backing up..... [Music]
rsync -e ssh -rltvz --delete "Favorites" %USER%@%SERVER%:%SRVDIR% 
echo .
echo .
echo Backing up.... [Pictures]
rsync -e ssh -rltvz --delete "Pictures" %USER%@%SERVER%:%SRVDIR%
echo .
echo .
echo Backing up.... [Videos]
rsync -e ssh -rltvz --delete "Videos" %USER%@%SERVER%:%SRVDIR%
