@echo off
set OUTFILE=index.html
echo ^<!DOCTYPE html^> > %OUTFILE%
echo ^<html^> >> %OUTFILE%
echo ^<head^> >> %OUTFILE%
echo ^<meta charset="utf-8"^> >> %OUTFILE%
echo ^<title^>Directory Listing^</title^> >> %OUTFILE%
echo ^</head^> >> %OUTFILE%
echo ^<body^> >> %OUTFILE%
echo ^<h1^>Directory Listing^</h1^> >> %OUTFILE%
echo ^<hr^> >> %OUTFILE%
for /d %%a in (*) do (
    echo ^<a href="%%a/"^>%%a/^</a^>^<br^> >> %OUTFILE%
)
for %%a in (*) do (
    echo ^<a href="%%a"^>%%a^</a^>^<br^> >> %OUTFILE%
)
echo ^</body^> >> %OUTFILE%
echo ^</html^> >> %OUTFILE%
set OUTFILE=
