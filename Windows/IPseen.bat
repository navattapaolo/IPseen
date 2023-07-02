@echo off
if "%1"=="-mac" (
    ipconfig /all | findstr "Physical Address"
) else if "%1"=="-private" (
    ipconfig | findstr IPv4
) else if "%1"=="-public" (
    curl -s https://ifconfig.me
) else (
    ipconfig /all
	echo Public IP Address:
	curl -s https://ifconfig.me
)