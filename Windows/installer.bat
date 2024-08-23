@echo off
setlocal

REM Define the directory where the script is located
set "scriptDir=%~dp0"

REM Define the name of the folder and environment variable
set "folderName=IPseen"
set "envVarName=IPseen"

REM Define the full path for the folder
set "folderPath=%scriptDir%%folderName%"

REM Create the folder if it does not exist
if not exist "%folderPath%" (
    echo Creating folder "%folderPath%"
    mkdir "%folderPath%"
) else (
    echo Folder "%folderPath%" already exists.
)

REM Set the user environment variable
echo Setting user environment variable "%envVarName%" to "%folderPath%"...
setx %envVarName% "%folderPath%"

REM Notify the user
echo User environment variable "%envVarName%" has been set to "%folderPath%".
echo You can now use "%envVarName%" in your command prompts to reference the folder.

REM Wait for a key press to close the prompt
pause
