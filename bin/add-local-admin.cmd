@echo off
SET ARG=%1
IF DEFINED ARG (
echo net localgroup Administrators /add WOLFTECH\%1
GOTO :END
)
:ERROR
echo ERROR: Must pass valid NCSU ID.

:END
set ARG=
