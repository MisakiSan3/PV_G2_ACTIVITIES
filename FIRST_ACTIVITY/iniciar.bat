@echo off

set "DEV=%~dp0"

set "PATH=%DEV%flutter\bin;%PATH%"

set "PUB_CACHE=%DEV%pub-cache"

start "" "%DEV%vscode\Code.exe"

call "%DEV%flutter\bin\flutter.bat" --version

cmd /k