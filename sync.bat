@echo off
setlocal
:: Use pure ASCII for the batch file to avoid encoding issues with CMD
set "SCRIPT_DIR=%~dp0"
set "PS_FILE=%SCRIPT_DIR%sync_config.ps1"

:: 1. Push-Location ensures we are in the script's directory
:: 2. Force PowerShell to read the script as UTF-8
powershell -ExecutionPolicy Bypass -Command "Push-Location '%SCRIPT_DIR%'; . ([scriptblock]::Create((Get-Content '%PS_FILE%' -Raw -Encoding UTF8)))"

pause
