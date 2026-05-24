# Antigravity 智能助理客製化與技能儲存庫 (Antigravity Skills & Workflows Repository)

歡迎來到全新的 **Gemini / Antigravity 智能儲存庫**！本儲存庫是從原本的知識庫中獨立拆分而來，專門用來存放與管理 **Antigravity**（進階 agentic AI 編碼助理）的**全域工作流 (Global Workflows)**、**客製化開發技能 (Custom Skills)**，以及**專案開發全局規範 (GEMINI.md)**。

藉由將此儲存庫獨立，可方便在多個不同的工作區或專案中，以 Git Submodule 或獨立儲存庫的形式引入這套強大的 AI 開發增強系統。

---

## 📂 目錄結構與模組說明 (Repository Structure)

本儲存庫的核心目錄結構如下：

```directory
C:\Users\phileo\Desktop\Google Drive\KM\Gemini\
├── GEMINI.md                     # 專案全局開發規範（包含敏感資訊防護、型別安全、繁體中文輸出限制等）
├── README.md                     # 本說明文件
├── split_SOP.md                  # 本儲存庫從母專案拆分出來的標準作業程序 (SOP)
├── sync.bat / sync1.bat          # 智能助理環境同步/配置自動化腳本
├── sync_config.ps1               # 同步設定設定腳本 (PowerShell)
└── antigravity/                  # Antigravity 核心增強目錄
    ├── global_workflows/         # 全域工作流 (工作流指引)
    │   ├── core-development-workflow.md  # 🚀 核心開發流程（規劃優先、原子化執行、強制中斷機制）
    │   └── review.md                     # 🔍 程式碼審查與品質控制工作流
    └── skills/                   # 智能助理客製化增強技能庫 (Custom Skills)
        ├── adk-tool-scaffold/    # 增強工具腳手架（自動生成客製化 Tool 類別）
        ├── code-review/          # 自動化程式碼審查與 Bug 掃描技能
        ├── database-schema-validator/  # SQL Schema 安全與命名規範自動驗證器
        ├── git-commit-formatter/ # 規範化 Commit Message 格式化工具 (Conventional Commits)
        ├── how/                  # 深層系統架構剖析與設計模式評估技能
        ├── json-to-pydantic/     # JSON 結構自動轉換為 Pydantic 資料模型工具
        ├── license-header-adder/ # 自動為新原始碼檔案添加企業授權標頭的工具
        ├── cloud/                # ☁️ Google Cloud 雲端架構與服務集成技能（AlloyDB, BigQuery, GKE 等）
        ├── CloudFlare/           # ⚡ Cloudflare 全套無伺服器與 Edge AI 開發技能（Workers, Agents SDK, Sandbox 等）
        └── AI_custom/            # 🧠 核心客製化 AI 專業能力模組 (Taiwan Context)
            ├── grammar-book-author/      # 英文文法教科書深度撰寫與語言學分析技能
            ├── skill-security-reviewer/  # 審查自訂技能之社交工程防範與安全漏洞技能
            ├── toeic-vocab-assistant/    # 專業多益 (TOEIC) 860+ 繁體中文商業單字資料庫庫建構技能
            └── windows-script-guard/     # 🛡️ 防止在 Windows 環境下編寫 PowerShell/Python 出現編碼或語法錯誤的規範技能
```

---

## 🚀 核心工作流簡介 (Global Workflows)

### 1. 核心開發流程 (`core-development-workflow.md`)
為避免盲目試錯與確保變更的「外科手術式精準」，AI 在執行任何非瑣碎任務時，皆強制執行以下四階段：
* **階段 1 (情資與 RCA)**：先進行深入分析，釐清依賴，不清楚就問，絕不默默猜測。
* **階段 2 (實施計畫)**：在動工前，必須提交 `implementation_plan.md` 並獲得使用者核准。
* **階段 3 (原子化執行)**：一次只做一件事，保持程式碼極簡，不做無關的順手優化。
* **階段 4 (自我驗證與中斷)**：核對四項自我檢查（範圍、成功指標、依賴、型別）。若失敗且重試超過 2 次，強制中斷還原，等待人類新指令。

### 2. 代碼審查流程 (`review.md`)
規範 AI 在進行 Merge Request 或代碼遞交前的審查基準，聚焦於可讀性、邊界條件、效能與架構一致性。

---

## 🧠 特色客製化技能 (Highlighted Custom Skills)

### 🛡️ Windows 腳本防禦守衛 (`windows-script-guard`)
專門為 Windows 環境（PowerShell/Cmd/Batch）打造的防禦規範。強制要求 AI：
* 處理中文字元與檔案寫入時，一律採用具備 **UTF-8 with BOM** 或明確編碼的處理機制，防止終端機中文字元破碎。
* 避免使用在 PowerShell 容易出錯的偏僻 Alias 或管線寫法，確保腳本在 Windows 上的極高穩定度。

### 📈 多益單字 AI 助教 (`toeic-vocab-assistant`)
專門針對台灣背景學生考取多益 860+ 的單字庫增強工具：
* 自動排版為乾淨的 Markdown 欄位，去除雜訊。
* 強制輸出符合台灣商業用語習慣的譯名（如：將 "Project Manager" 翻為 "專案經理" 而非 "項目經理"）。

---

## ⚙️ 專案開發全局規範 (GEMINI.md)

本儲存庫根目錄下的 `GEMINI.md` 定義了嚴格的開發邊界：
* **敏感資訊防護**：絕對不允許在程式碼中寫死（Hardcode）任何 API Key、金鑰或密碼，一律以環境變數讀取。
* **型別安全**：強制實作資料型別檢查與轉換，杜絕前端破版或出現 `NaN` / `undefined`。
* **語言輸出規範**：所有產出的註解、系統日誌、說明與對話，**一律嚴格使用繁體中文（zh-TW）與台灣科技用語**。

---

## 🔄 同步與更新指引 (Sync Guide)

當您在不同專案中引入此儲存庫後，可以執行根目錄下的自動化同步工具：
* 點擊 `sync.bat` 或 `sync1.bat`：將會讀取 `sync_config.ps1`，自動同步或更新本地的 Antigravity 智能配置，確保您的編碼助理隨時處於最強大、最合規的狀態！
