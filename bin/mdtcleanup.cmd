@echo off
del "C:\Opt\COS\etc\*.txt" /q
if exist "c:\_SMSTaskSequence" (
  del /q /s c:\_SMSTaskSequence
  rd /q /s c:\_SMSTaskSequence
)

if exist "c:\MININT" (
  del /q /s c:\MININT
  rd /q /s c:\MININT
)

if exist "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup\LiteTouch.lnk" (
  del /q "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup\LiteTouch.lnk"
)

echo "Changing Permissions"
Icacls  c:\ProgramData\anaconda3 /grant:r "Everyone":(OI)(CI)RX /T /C /L /Q
call "C:\Opt\COS\bin\cos-info.cmd"
call "C:\Opt\COS\bin\bginfo.cmd"
