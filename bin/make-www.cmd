@echo off
md \\wolftech.ad.ncsu.edu\COS\STAT\Redirect\%username%\Documents\www
Icacls "\\wolftech.ad.ncsu.edu\cos\stat\redirect\%username%\Documents\www" /grant "WOLFTECH\STAT.web.service":(OI)(CI)R /T /C /L /Q
