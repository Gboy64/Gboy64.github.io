@echo off
SETLOCAL
:: Fuck you NVIDIA
:: Fuck you Valve
:: This script is for getting freedom back to play any games we want
title Unsupported Steam Games #FuckNVIDIAandValve - Developed by SoftwareRat [Version 1.0]
%HOMEDRIVE%
:: Checking if Batch was already executed
IF EXIST "%PROGRAMFILES(X86)%\Steam\NVIDIAGRIDDISABLED.ini" (GOTO ENABLENVIDIAGRIDquestion) >NUL 2>&1
:DISABLENVIDIAGRIDquestion:
:: Generate white on a green background.
color 2F
@CHOICE /C:YN /m "Do you really want to disable NVIDIA GRID?"
IF %ERRORLEVEL% EQU 1 GOTO DISABLENVIDIAGRID
IF %ERRORLEVEL% EQU 2 GOTO TerminateBatch
:DISABLENVIDIAGRID:
:: Delete json file to disable GFN mode in Steam
:: Steam need to be restarted to apply this change
del "C:\Users\kiosk\AppData\Local\NVIDIA Corporation\GfnRuntimeSdk\GFNSDK_Steam.json" >NUL 2>&1
cd "%PROGRAMFILES(X86)%\Steam\"
:: Killing Steam Process to be sure steamapps is not used
cls
ECHO Kill steam with a shortcut then continue
pause
:: Renaming original Steamapps Folder to GRIDsteamapps
IF EXIST "%PROGRAMFILES(X86)%\Steam\GRIDsteamapps" (GOTO NotFirstTime) 
ren "steamapps" "GRIDsteamapps" >NUL 2>&1
GOTO continue
:NotFirstTime:
:: Deteting created Steamapps Folder (games arent deleted)
rd /Q /S "steamapps" >NUL 2>&1
:continue:
:: Creating new Steamapps Folder
md "steamapps" >NUL 2>&1
:: Make a junction to original common folder for downloading on B: Drive
mklink /J "steamapps\common" "GRIDsteamapps\common" >NUL 2>&1
:: Starting Steam and navigate automaticly to games
start "" "steam://nav/games"
:: Creating the File to make the script known that GRID is already bypassed
fsutil file createnew "%PROGRAMFILES(X86)%\Steam\NVIDIAGRIDDISABLED.ini" 0 >NUL 2>&1
ENDLOCAL
:: End this batch
goto TerminateBatch

:ENABLENVIDIAGRIDquestion:
:: Asking User if he really want to enable GRID
:: Generate white on a red background.
color 4F
@CHOICE /C:YN /m "Do you really want to enable NVIDIA GRID?"
IF %ERRORLEVEL% EQU 1 GOTO ENABLENVIDIAGRID
IF %ERRORLEVEL% EQU 2 GOTO TerminateBatch
:ENABLENVIDIAGRID:
:: Create json file to enable GFN mode in Steam
fsutil file createnew "C:\Users\kiosk\AppData\Local\NVIDIA Corporation\GfnRuntimeSdk\GFNSDK_Steam.json" 0 >NUL 2>&1
:: Killing Steam Process to be sure steamapps is not used
taskkill /F /IM STEAM* >NUL 2>&1
:: Deteting created Steamapps Folder (games arent deleted)
rd /Q /S "steamapps" >NUL 2>&1
:: Creating junction because for some reason you get access denied
mklink /J "steamapps" "GRIDsteamapps" >NUL 2>&1
:: Starting Steam and navigate automaticly to games
start "" "steam://nav/games"
:: Deleting the File to make the script known that GRID is not bypassed
del "%PROGRAMFILES(X86)%\Steam\NVIDIAGRIDDISABLED.ini"
:: End this batch
GOTO TerminateBatch
:TerminateBatch:
:: To end this batch file
exit
