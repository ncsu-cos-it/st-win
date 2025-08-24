@echo off
REM ***********************************************************************
REM *** L: = ST Class Directories                                       ***
REM *** --------------------------------------------------------------- ***
REM *** Modify UNITYID to be NCSU UNITYID if local user doesn't match   ***
REM *** Example: set UNITYID=tbyron                                     ***
REM ***********************************************************************
CLS
REM set UNITYID=tbyron
set UNITYID=%USERNAME%
set CD=C:\TEMP
if exist L:\ (
    net use L: /delete /global  
)
net use L: \\ncsudrive.ncsu.edu\cos\stat\files\shares\class_data /user:WOLFTECH\%UNITYID% /persistent:no
REM net use L: \\dc2isi00smb.oit.ncsu.edu\cos\stat\files\shares\class_data /user:WOLFTECH\%UNITYID% /persistent:no
set UNITYID=
set CD=
c:\windows\explorer L:
