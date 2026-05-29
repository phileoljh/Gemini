---
name: windows-script-guard
description: 防止在 Windows 環境下編寫 PowerShell、Batch 與 Python 測試腳本時出現編碼與語法錯誤，以及處置工作區檔案解碼死結（failed to detect charset）的非破壞性規範技能。
---

# Windows 腳本開發與編碼死結處置規範 (windows-script-guard)

此技能旨在確保所有在 Windows (繁體中文環境) 下生成的腳本皆符合編碼規範，避免亂碼與執行錯誤，並提供非破壞性的檔案編碼死結處置方案。

## 1. PowerShell 腳本 (.ps1) 規範

### 編碼要求
- **必須使用「帶有 BOM 的 UTF-8」(UTF-8 with BOM)**。
- 理由：Windows PowerShell 5.1 (預設版本) 在處理包含繁體中文的「無 BOM UTF-8」檔案時會發生亂碼。

### 標頭設定
在所有包含中文註解或輸出的 `.ps1` 檔案開頭加入：
```powershell
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
```

---

## 2. Windows 批處理檔 (.bat) 規範

### 編碼要求
- **必須使用「不帶 BOM 的 UTF-8」或「ANSI (Big5)」**。
- 理由：CMD 解析器會將 UTF-8 BOM 誤認為字元，導致第一行指令（如 `@echo off`）失效。

### 語系切換
在檔案開頭加入以下指令以支援 UTF-8 輸出：
```batch
chcp 65001 >nul
```

### 括號與特殊字元處理
- **必須使用雙引號**：當指令（特別是 `title` 或 `echo`）中包含括號 `(` `)` 或其他特殊字元時，必須完整包覆。
- **錯誤範例**：`title 網段掃描器 (Python 版)`
- **正確範例**：`title "網段掃描器 (Python 版)"`

---

## 3. Python 測試腳本規範

### 異步處理 (asyncio)
- **適配原則**：在 Windows 上使用 Python 3.8+ 時，應直接使用 `asyncio.run()`。
- **避免行為**：不要手動設置 `set_event_loop_policy`，編譯器已預設使用穩定的 ProactorEventLoop。

---

## 4. Windows 工作區檔案字元集解碼死結（Failed to detect charset）之處置規範

### 4.1 死結現象
當編輯 Markdown 或程式碼檔案時，若寫入中斷或字元集混亂，系統編輯 API（如 `write_to_file` 或 `replace_file_content`）在讀取現有檔案時會報錯：
`while decoding file, failed to detect charset with sufficient confidence`
此時，高階編輯工具將拒絕執行任何操作，形成檔案編輯死結。

### 4.2 🚫 絕對禁止行為
* **嚴禁調用 `Remove-Item`、`del` 或任何指令刪除工作區檔案。** 任何未經用戶明確授權的刪檔行為皆為高風險操作，且可能造成珍貴研究數據的永久流失。

### 4.3 🟢 標準非破壞性處置方案（Python 強制串流覆寫）
當遭遇解碼死結時，必須**保留原檔案**，並透過臨時 Python 腳本強行以乾淨的 `utf-8` 位元組流重新覆寫該檔案：

1. **建立臨時修復腳本**：在系統暫存目錄（如 `scratch/`）建立一個名為 `fix_encoding.py` 的臨時 Python 檔案。
2. **編寫無損寫入邏輯**：利用 Python 的 `open(..., 'w', encoding='utf-8')` 或 `codecs.open`。寫入模式（`w`）會截斷（Truncate）檔案，直接清除損壞的字元組，而不讀取舊檔。
   ```python
   # -*- coding: utf-8 -*-
   import codecs
   
   # 將備份好的無損繁體中文內容放入 content 中
   content = """[備份好的乾淨報告內容]"""
   
   with codecs.open(r"D:\KM\目標檔案路徑.md", "w", "utf-8") as f:
       f.write(content)
   ```
3. **執行並清理**：使用終端機執行該 Python 腳本，驗證目標檔案編碼恢復正常後，**立即將臨時腳本刪除**。

---

## 5. 檔案驗證清單
在生成腳本或處置編碼死結後，請檢查：
1. [ ] 檔案副檔名與編碼是否匹配？
2. [ ] 是否已加入必要的 `chcp` 或 `OutputEncoding` 設定？
3. [ ] 所有的 `title` 是否已使用雙引號包覆？
4. [ ] 若發生編碼死結，是否已使用 Python 進行「非破壞性覆寫」，而非刪除檔案？

