@echo off
md \\ncsudrive.ncsu.edu\cos\stat\Redirect\%username%\Documents\www
Icacls "\\ncsudrive.ncsu.edu\cos\stat\redirect\%username%\Documents\www" /grant "WOLFTECH\STAT.web.service":(OI)(CI)R /T /C /L /Q
