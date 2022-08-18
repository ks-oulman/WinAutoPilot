@echo off
cd /d %~dp0
Color c0

ECHO *********************************************************************************
ECHO *   THIS SCRIPT WILL CHANGE THE EXECUTION POLICY FOR POWERSHELL TO UNRESTRICTED * 
ECHO *   NOTE: THIS SCRIPT WILL NOT FUNCTION UNLESS IT IS RUN AS ADMINISTRATOR       *
ECHO *********************************************************************************

ECHO Are you sure you want to run this script? 

Set /P A=[Y/N]:

IF /I %A%==Y GOTO YES
IF /I %A%==N GOTO NO

:NO
Pause
Exit

:YES
color 0f
reg.exe ADD HKLM\SOFTWARE\Microsoft\PowerShell\1\ShellIds\Microsoft.PowerShell /v ExecutionPolicy /t REG_SZ /d Unrestricted /f
powershell.exe -file GetDeviceInfo.ps1
exit