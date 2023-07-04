@echo off

REM Ottieni il nome della rete corrente
for /f "tokens=2 delims=: " %%i in ('netsh WLAN show interfaces ^| findstr /r /c:"^    SSID"') do (
    set "networkName=%%i"
    goto :done
)
:done

REM Ottieni l'indirizzo IP pubblico
for /f "delims=" %%i in ('curl -s https://ifconfig.me') do set "publicIP=%%i"

if "%1"=="-mac" (
    ipconfig /all | findstr "Physical Address"
) else if "%1"=="-private" (
    ipconfig | findstr IPv4
) else if "%1"=="-public" (
    echo Public IP Address:
    echo    %networkName%...........: %publicIP%
) else (
    ipconfig /all
    echo.
    echo Public IP Address:
    echo    %networkName%...........: %publicIP%
)
