Write-Host "--- 正在啟動同步程序 (UTF-8 模式) ---" -ForegroundColor Cyan

# 定義路徑 (透過 Get-Location 抓取當前工作目錄)
$SourceDir = Get-Location
$DestDir = Join-Path $env:USERPROFILE ".gemini"

# 顯示偵錯資訊
Write-Host "[DEBUG] 來源目錄 (Source): $SourceDir" -ForegroundColor Gray
Write-Host "[DEBUG] 目標目錄 (Dest)  : $DestDir" -ForegroundColor Gray
Write-Host ""

# 定義要拷貝的項目
$ItemsToSync = @("GEMINI.md", "antigravity")

# 確保目標目錄存在
if (!(Test-Path -Path $DestDir)) {
    New-Item -ItemType Directory -Path $DestDir | Out-Null
    Write-Host "[INFO] 已建立目標目錄: $DestDir" -ForegroundColor Yellow
}

# 執行同步
foreach ($Item in $ItemsToSync) {
    $SrcPath = Join-Path -Path $SourceDir -ChildPath $Item
    
    if (Test-Path -Path $SrcPath) {
        Write-Host "[SYNC] 正在同步項目: $Item" -ForegroundColor White
        Write-Host "       從: $SrcPath" -ForegroundColor Gray
        Write-Host "       到: $DestDir" -ForegroundColor Gray
        
        Copy-Item -Path $SrcPath -Destination $DestDir -Recurse -Force
    } else {
        Write-Warning "[WARN] 找不到來源項目: $SrcPath"
    }
}

Write-Host ""
Write-Host "同步完成！" -ForegroundColor Green
