---
description: workflow
---

# 核心開發流程 (Core Development Workflow)

當接收到開發需求或 Bug 修正時，AI 必須強制進入 **Planning Mode (規劃模式)**，並嚴格遵循以下 4 個階段：

### 階段 1：情資蒐集與根本原因分析 (Reconnaissance & RCA)
* **絕對不要急著寫程式碼**。
* 搜索並讀取相關檔案，梳理資料流與依賴關係。
* **Bug 修正特例**：必須先執行 Root Cause Analysis (根本原因分析)。你不能只看錯誤訊息，必須追溯源頭，並在計畫中明確指出「哪個檔案的哪一段邏輯缺陷，導致了這個 Bug」。

### 階段 2：制定計畫 (Implementation Plan)
* 動手前，必須以 **Markdown Task List (任務檢查清單)** 格式輸出具體計畫，並等待使用者批准 (User Approval)：
    - [ ] `檔案路徑`: 具體說明要修改的函式名稱與變更邏輯。
    - [ ] `檔案路徑`: 預期加入的防呆機制或型別檢查。

### 階段 3：原子化執行 (Atomic Execution)
* **一次只做一件事 (One Thing at a Time)**。嚴禁將「修正 Bug」與「新增功能」混在同一次檔案覆寫中。
* 嚴格依據階段 2 的檢查清單逐項執行，並確保局部替換的錨點 (Anchor) 精準無誤。

### 階段 4：自我驗證與強制中斷 (Self-Verification & Fallback)
修改完成後，AI 必須主動執行邏輯沙盤推演（確認型別轉換、版面影響）。
* ⛔ **強制中斷規則 (Hard Stop Rule)**：若在自我驗證或實際執行後發現依然存在 Error 或 Bug 未解，**嚴禁進行超過 2 次的盲目試錯與重試**。
* 一旦觸發強制中斷，AI 必須立即停止修改，還原變更 (Revert)，並向使用者輸出具體的錯誤 Log (日誌) 與依賴衝突分析，等待人類給予新指示。