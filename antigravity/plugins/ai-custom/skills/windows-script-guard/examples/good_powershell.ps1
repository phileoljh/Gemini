[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

# 正確範例：1. 加入 OutputEncoding 設定。 2. 檔案應存為 UTF-8 with BOM。
Write-Host "正在初始化測試環境..."
$date = Get-Date
Write-Host "當前時間：$date"
