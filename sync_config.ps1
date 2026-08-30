Write-Host "--- 正在啟動同步程序 (UTF-8 模式) ---" -ForegroundColor Cyan

# 定義路徑 (透過 Get-Location 抓取當前工作目錄)
$SourceDir = Get-Location
# [舊版紀錄] $DestDir = Join-Path $env:USERPROFILE ".gemini"
$DestDir = Join-Path $env:USERPROFILE ".gemini"
$DestConfigDir = Join-Path $env:USERPROFILE ".gemini\config"

# 顯示偵錯資訊
Write-Host "[DEBUG] 來源目錄 (Source): $SourceDir" -ForegroundColor Gray
Write-Host "[DEBUG] 目標目錄 (Dest)  : $DestConfigDir" -ForegroundColor Gray
Write-Host ""

# [舊版紀錄] 定義要拷貝的項目
# [舊版紀錄] $ItemsToSync = @("GEMINI.md", "antigravity")

# 確保目標目錄存在
if (!(Test-Path -Path $DestConfigDir)) {
    New-Item -ItemType Directory -Path $DestConfigDir -Force | Out-Null
    Write-Host "[INFO] 已建立新版目標目錄: $DestConfigDir" -ForegroundColor Yellow
}

# --- 1. 同步自訂功能包 (plugins, skills, workflows 等) ---
$SrcAntigravity = Join-Path -Path $SourceDir -ChildPath "antigravity"
if (Test-Path -Path $SrcAntigravity) {
    Write-Host "[SYNC] 正在同步自訂功能包 (plugins, skills, workflows 等)" -ForegroundColor White
    Write-Host "       從: $SrcAntigravity" -ForegroundColor Gray
    Write-Host "       到: $DestConfigDir" -ForegroundColor Gray
    
    # 清理舊版已廢棄的殘留項目 (如 skills.json 與舊分類目錄)
    $LegacyItems = @(
        (Join-Path $DestConfigDir "skills.json"),
        (Join-Path $DestConfigDir "skills\AI_custom"),
        (Join-Path $DestConfigDir "skills\CloudFlare"),
        (Join-Path $DestConfigDir "skills\cloud")
    )
    foreach ($item in $LegacyItems) {
        if (Test-Path -Path $item) {
            Remove-Item -Path $item -Recurse -Force -ErrorAction SilentlyContinue
            Write-Host "[CLEAN] 已清理舊版殘留項目: $item" -ForegroundColor DarkGray
        }
    }

    # 同步新版目錄
    Copy-Item -Path "$SrcAntigravity\*" -Destination $DestConfigDir -Recurse -Force
} else {
    Write-Warning "[WARN] 找不到來源項目: $SrcAntigravity"
}

# --- 2. 同步全域規範檔 (GEMINI.md -> AGENTS.md) ---
$SrcGemini = Join-Path -Path $SourceDir -ChildPath "GEMINI.md"
if (Test-Path -Path $SrcGemini) {
    Write-Host "[SYNC] 正在同步全域規範檔 (GEMINI.md)" -ForegroundColor White
    $TargetAgents = Join-Path -Path $DestConfigDir -ChildPath "AGENTS.md"
    Write-Host "       到新版 IDE: $TargetAgents" -ForegroundColor Gray
    Copy-Item -Path $SrcGemini -Destination $TargetAgents -Force
    
    # 保留一份舊版路徑以防萬一
    $TargetOldGemini = Join-Path -Path $DestDir -ChildPath "GEMINI.md"
    Write-Host "       到舊版備份: $TargetOldGemini" -ForegroundColor Gray
    Copy-Item -Path $SrcGemini -Destination $TargetOldGemini -Force
} else {
    Write-Warning "[WARN] 找不到來源項目: $SrcGemini"
}

Write-Host ""
Write-Host "同步完成！" -ForegroundColor Green
