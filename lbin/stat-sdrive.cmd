@echo off
REM ***********************************************************************
REM *** S: = STAT Users Home Space                                      ***
REM *** --------------------------------------------------------------- ***
REM *** Modify UNITYID to be NCSU UNITYID if local user doesn't match   ***
REM *** Example: set UNITYID=tbyron                                     ***
REM ***********************************************************************
CLS
set UNITYID=tbyron
REM set UNITYID=%USERNAME%
set CD=C:\TEMP
if exist S:\ (
    net use S: /delete /global  
)
REM net use S: \\wolftech.ad.ncsu.edu\cos\stat\redirect\%UNITYID% /user:WOLFTECH\%UNITYID% /persistent:no
net use S: \\dc2isi00smb.oit.ncsu.edu\cos\stat\redirect\%UNITYID% /user:WOLFTECH\%UNITYID% /persistent:no
set UNITYID=
set CD=
c:\windows\explorer S:
