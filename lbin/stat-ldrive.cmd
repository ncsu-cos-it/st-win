@echo off
REM ***********************************************************************
REM *** L: = STAT Class Material                                        ***
REM *** --------------------------------------------------------------- ***
REM *** Modify UNITYID to be NCSU UNITYID if local user doesn't match   ***
REM *** Example: set UNITYID=tbyron                                     ***
REM ***********************************************************************
CLS
set UNITYID=tbyron
REM set UNITYID=%USERNAME%
set CD=C:\TEMP
if exist L:\ (
    net use L: /delete /global  
)
REM net use L: \\wolftech.ad.ncsu.edu\cos\stat\files\shares\class_data /user:WOLFTECH\%UNITYID% /persistent:no
net use L: \\dc2isi00smb.oit.ncsu.edu\cos\stat\files\shares\class_data /user:WOLFTECH\%UNITYID% /persistent:no
set UNITYID=
set CD=
c:\windows\explorer L:
