:: Global USG bat.
@echo off
color 57
title Global USG Bat
cls
echo Starting...
timeout 2 /nobreak > nul
taskkill /f /im steam.exe
cls
IF exist "B:\msqrd" B:&cd "B:\msqrd\temp"&cd "_temp*"&cd "programfilesx86\steam"&start "" "steam.exe"
IF exist "D:\msqrd" D:&cd "D:\msqrd\temp"&cd "_temp*"&cd "programfilesx86\steam"&start "" "steam.exe"
IF exist "E:\msqrd" B:&cd "B:\msqrd\temp"&cd "_temp*"&cd "programfilesx86\steam"&start "" "steam.exe"
IF exist "F:\msqrd" D:&cd "D:\msqrd\temp"&cd "_temp*"&cd "programfilesx86\steam"&start "" "steam.exe"

cls

echo Download ShareX, then press any key...
pasue > nul
IF exist "E:\msqrd" E:&cd "E:\msqrd\temp"&cd "_temp_*"&cd "programfilesx86\steam"&start "" "steam.exe" steam://rungameid/400040
IF exist "F:\msqrd" F:&cd "F:\msqrd\temp"&cd "_temp_*"&cd "programfilesx86\steam"&start "" "steam.exe" steam://rungameid/400040
IF exist "G:\msqrd" G:&cd "G:\msqrd\temp"&cd "_temp_*"&cd "programfilesx86\steam"&start "" "steam.exe" steam://rungameid/400040
IF exist "H:\msqrd" H:&cd "H:\msqrd\temp"&cd "_temp_*"&cd "programfilesx86\steam"&start "" "steam.exe" steam://rungameid/400040
IF exist "D:\msqrd" D:&cd "D:\msqrd\temp"&cd "_temp_*"&cd "programfilesx86\steam"&start "" "steam.exe" steam://rungameid/400040
pause > nul
cls
start "" "C:\windows\syswow64\cmd.exe" C:\Users\kiosk
exit
