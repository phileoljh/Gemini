@echo off
setlocal
:: Use pure ASCII for the batch file to avoid encoding issues with CMD
:: [更新說明] 本啟動器會呼叫 sync_config.ps1 將技能與工作流同步至 Antigravity IDE 新版 config 目錄下。
set "SCRIPT_DIR=%~dp0"
set "PS_FILE=%SCRIPT_DIR%sync_config.ps1"

:: 1. Push-Location ensures we are in the script's directory
:: 2. Force PowerShell to read the script as UTF-8
powershell -ExecutionPolicy Bypass -Command "Push-Location '%SCRIPT_DIR%'; . ([scriptblock]::Create((Get-Content '%PS_FILE%' -Raw -Encoding UTF8)))"

pause
