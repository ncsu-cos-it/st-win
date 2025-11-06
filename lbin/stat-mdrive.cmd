@echo off
REM ***********************************************************************
REM *** M: = STAT Lockers Drive                                         ***
REM *** --------------------------------------------------------------- ***
REM *** Modify UNITYID to be NCSU UNITYID if local user doesn't match   ***
REM *** Example: set UNITYID=tbyron                                     ***
REM ***********************************************************************
CLS
set UNITYID=tbyron
REM set UNITYID=%USERNAME%
set CD=C:\TEMP
if exist M:\ (
    net use M: /delete /global  
)
REM net use M: \\wolftech.ad.ncsu.edu\cos\stat\files\shares /user:WOLFTECH\%UNITYID% /persistent:no
net use M: \\dc2isi00smb.oit.ncsu.edu\cos\stat\files\shares /user:WOLFTECH\%UNITYID% /persistent:no
set UNITYID=
set CD=
c:\windows\explorer M:
