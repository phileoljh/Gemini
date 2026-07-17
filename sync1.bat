@echo off
REM Use pure ASCII to avoid encoding issues with CMD
setlocal

echo --- Starting Sync Process (Pure Batch Mode) ---
echo.

REM Get script directory (includes trailing backslash)
set "SourceDir=%~dp0"
REM [舊版紀錄] Set target directory
REM [舊版紀錄] set "DestDir=%USERPROFILE%\.gemini"
set "DestDir=%USERPROFILE%\.gemini"
set "DestConfigDir=%USERPROFILE%\.gemini\config"

echo [DEBUG] Source : %SourceDir%
echo [DEBUG] Target : %DestConfigDir%
echo.

REM Ensure target directory exists
if not exist "%DestConfigDir%" (
    mkdir "%DestConfigDir%"
    echo [INFO] Created target directory: %DestConfigDir%
)

REM === Item 1: Sync GEMINI.md (File) ===
if exist "%SourceDir%GEMINI.md" (
    echo [SYNC] Syncing item: GEMINI.md
    echo        From: %SourceDir%GEMINI.md
    echo        To  : %DestConfigDir%\AGENTS.md
    
    REM [舊版紀錄] copy /Y "%SourceDir%GEMINI.md" "%DestDir%\" >nul
    copy /Y "%SourceDir%GEMINI.md" "%DestConfigDir%\AGENTS.md" >nul
    
    REM 保留舊版路徑備份
    copy /Y "%SourceDir%GEMINI.md" "%DestDir%\GEMINI.md" >nul
) else (
    echo [WARN] Source item not found: %SourceDir%GEMINI.md
)

REM === Item 2: Sync antigravity (Directory) ===
if exist "%SourceDir%antigravity\" (
    echo [SYNC] Syncing item: antigravity contents (skills, workflows, etc)
    echo        From: %SourceDir%antigravity\*
    echo        To  : %DestConfigDir%
    
    REM [舊版紀錄] xcopy "%SourceDir%antigravity" "%DestDir%\antigravity" /E /I /H /Y /C >nul
    xcopy "%SourceDir%antigravity\*" "%DestConfigDir%\" /E /I /H /Y /C >nul
) else (
    echo [WARN] Source item not found: %SourceDir%antigravity
)

echo.
echo Sync completed!
pause
