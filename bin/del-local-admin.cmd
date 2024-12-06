@echo off
SET ARG=%1
IF DEFINED ARG (
echo net localgroup Administrators /delete WOLFTECH\%1
GOTO :END
)
:ERROR
echo ERROR: Must pass valid NCSU ID.

:END