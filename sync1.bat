@echo off
REM Use pure ASCII to avoid encoding issues with CMD
setlocal

echo --- Starting Sync Process (Pure Batch Mode) ---
echo.

REM Get script directory (includes trailing backslash)
set "SourceDir=%~dp0"
REM Set target directory
set "DestDir=%USERPROFILE%\.gemini"

echo [DEBUG] Source : %SourceDir%
echo [DEBUG] Target : %DestDir%
echo.

REM Ensure target directory exists
if not exist "%DestDir%" (
    mkdir "%DestDir%"
    echo [INFO] Created target directory: %DestDir%
)

REM === Item 1: Sync GEMINI.md (File) ===
if exist "%SourceDir%GEMINI.md" (
    echo [SYNC] Syncing item: GEMINI.md
    echo        From: %SourceDir%GEMINI.md
    echo        To  : %DestDir%
    copy /Y "%SourceDir%GEMINI.md" "%DestDir%\" >nul
) else (
    echo [WARN] Source item not found: %SourceDir%GEMINI.md
)

REM === Item 2: Sync antigravity (Directory) ===
if exist "%SourceDir%antigravity\" (
    echo [SYNC] Syncing item: antigravity
    echo        From: %SourceDir%antigravity
    echo        To  : %DestDir%\antigravity
    xcopy "%SourceDir%antigravity" "%DestDir%\antigravity" /E /I /H /Y /C >nul
) else (
    echo [WARN] Source item not found: %SourceDir%antigravity
)

echo.
echo Sync completed!
pause
