@echo off
REM ***********************************************************************
REM *** B: = NCSU Windows Share                                         ***
REM *** --------------------------------------------------------------- ***
REM *** Modify UNITYID to be NCSU UNITYID if local user doesn't match   ***
REM *** Example: set UNITYID=tbyron                                     ***
REM ***********************************************************************
CLS
REM set UNITYID=tbyron
set UNITYID=%USERNAME%
set CD=C:\TEMP
if exist M:\ (
    net use M: /delete /global  
)
net use M: \\wolftech.ad.ncsu.edu\cos\stat\files\shares /user:WOLFTECH\%UNITYID% /persistent:no
REM net use M: \\dc2isi00smb.oit.ncsu.edu\cos\stat\files\shares /user:WOLFTECH\%UNITYID% /persistent:no
set UNITYID=
set CD=
c:\windows\explorer M:
