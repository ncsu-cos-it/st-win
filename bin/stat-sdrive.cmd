@echo off
REM ***********************************************************************
REM *** S: = ST Redirect Home Directories                               ***
REM *** --------------------------------------------------------------- ***
REM *** Modify UNITYID to be NCSU UNITYID if local user doesn't match   ***
REM *** Example: set UNITYID=tbyron                                     ***
REM ***********************************************************************
CLS
REM set UNITYID=tbyron
set UNITYID=%USERNAME%
set CD=C:\TEMP
if exist S:\ (
    net use S: /delete /global  
)
net use S: \\wolftech.ad.ncsu.edu\cos\stat\redirect\%UNITYID% /user:WOLFTECH\%UNITYID% /persistent:no
REM net use S: \\dc2isi00smb.oit.ncsu.edu\cos\stat\redirect\%UNITYID% /user:WOLFTECH\%UNITYID% /persistent:no
set UNITYID=
set CD=
c:\windows\explorer S:
