@echo off

REM Get the directory of this script
setlocal
set "scriptDir=%~dp0"

REM Remove trailing backslash if exists
if "%scriptDir:~-1%"=="\" set "scriptDir=%scriptDir:~0,-1%"

REM Add the directory to the PATH environment variable
setx PATH "%PATH%;%scriptDir%"

:: Inform the user
echo Directory "%scriptDir%" has been added to the PATH environment variable.
echo Please restart your Command Prompt for changes to take effect.
