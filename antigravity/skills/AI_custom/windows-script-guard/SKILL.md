---
name: windows-script-guard
description: 防止在 Windows 環境下編寫 PowerShell、Batch 與 Python 測試腳本時出現編碼與語法錯誤的規範技能。
---

# Windows 腳本開發規範 (windows-script-guard)

此技能旨在確保所有在 Windows (繁體中文環境) 下生成的腳本皆符合編碼規範，避免亂碼與執行錯誤。

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
- **避免行為**：不要手動設置 `set_event_loop_policy`，因為新版本已預設使用穩定的 ProactorEventLoop。

---

## 4. 檔案驗證清單
在生成腳本後，請檢查：
1. [ ] 檔案副檔名與編碼是否匹配？
2. [ ] 是否已加入必要的 `chcp` 或 `OutputEncoding` 設定？
3. [ ] 所有的 `title` 是否已使用雙引號包覆？
