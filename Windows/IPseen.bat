@echo off
REM IPseen 0.01

REM Get current WiFi's name
for /f "tokens=2 delims=: " %%i in ('netsh WLAN show interfaces ^| findstr /r /c:"^    SSID"') do (
    set "networkName=%%i"
    goto :done
)
:done

REM Get the Public IP
for /f "delims=" %%i in ('curl -s https://ifconfig.me') do set "publicIP=%%i"

if "%1"=="-mac" (
    ipconfig /all | findstr "Physical Address"
) else if "%1"=="--private" (
    ipconfig | findstr IPv4
) else if "%1"=="--public" (
    echo Public IP Address:
    echo    %networkName%...........: %publicIP%
) else if "%1"=="--help" (
    echo "IPseen		Show Private, Public and MAC Addresses"
    echo " "
    echo "IPseen --help 	Show this help command"
    echo "IPseen --version 	Show the current IPseen version"
    echo "IPseen --public	Show your Public IP Address"
    echo "IPseen --private	Show your Private IP Address"
    echo "IPseen --mac		Show your MAC Address"
) else if "%1"=="--version" (
    echo "IPseen 0.01"
)
) else (
    ipconfig /all
    echo.
    echo Public IP Address:
    echo    %networkName%...........: %publicIP%
)
