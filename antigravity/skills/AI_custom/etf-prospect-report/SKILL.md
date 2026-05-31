---
name: "etf-prospect-report"
description: "專業的美股 ETF 前景與分析報告技能。提供即時行情、基本資料、持股組成、配息資訊、績效比較、風險評估與綜合投資建議，嚴格遵循 ETF 專屬評價指標，禁止混用個股指標。"
metadata:
  version: 2.0.0
  author: "Antigravity (Custom)"
  category: "finance"
  updated: 2026-05-31
---

# ETF 前景與分析報告技能 (ETF Prospect Report)

## Overview

一個專門為美國上市 ETF 設計的深度分析技能。當使用者查詢 ETF 代號（如 SPY、QQQ、VOO、VTI、SCHD、ARKK 等）、ETF 名稱，或詢問 ETF 的配息、成分股、費用率與績效時，觸發本技能。

本技能與個股分析**完全隔離**：ETF 是一籃子股票的組合，沒有單一公司的財務報表，因此個股專屬指標（EPS、P/E、ROE 等）**嚴禁使用**。

---

## 觸發條件與適用範圍

> 🔒 **適用範圍**：ETF 分析專用。
>
> ✅ **觸發條件（符合任一即適用）**：
> - 使用者輸入 ETF 代號（如 SPY、QQQ、VOO、SCHD、IWM、ARKK）
> - 使用者提到 ETF 名稱（如「S&P 500 ETF」「Nasdaq 100 ETF」「Vanguard Total Stock Market」）
> - 使用者詢問 ETF 的配息、成分股、費用率、績效等
>
> ⛔ **禁止混用**：以下個股專屬指標**不可套用至 ETF**：
> - 單一公司 EPS、Earnings Beat/Miss、管理層 Guidance
> - 本益比 P/E（ETF 的加權 P/E 由多家公司平均計算，意義完全不同）
> - PEG、P/S、P/B（個股估值指標）
> - 負債權益比 D/E、流動比率、ROE、ROA（個股財務體質指標）
> - 單一公司營收年增率
> - 內部人交易（Form 4）
> - 分析師個股評等與目標價

---

## Architecture (架構)

本技能採用 **Orchestrator + References** 架構，將關注點分離為獨立的參考文件：

```
etf-prospect-report/
├── SKILL.md                         ← 你正在讀的這個檔案（指揮官）
└── references/
    ├── data-sources.md              ← 搜尋策略、關鍵字模板、來源優先序、交易時間意識
    ├── analysis-pipeline.md         ← 五步驟分析流程完整邏輯與量化門檻
    ├── risk-matrix.md               ← 風險等級標準、投資評等條件、信心標籤定義
    ├── output-template.md           ← 完整報告格式模板（含所有表格）
    └── self-check.md                ← 最終自我檢查清單與資料品質標準
```

---

## 執行流程

```
使用者輸入 ETF 代號或名稱
│
├─ 1. 讀取本檔案 (SKILL.md) → 確認觸發條件與禁止指標
│
├─ 2. 讀取 references/data-sources.md → 取得搜尋策略與交易時間判斷
│
├─ 3. 搜尋階段：依關鍵字模板完成所有必要搜尋
│     ↓
│     驗證階段：逐一確認每筆資料的日期與來源是否正確
│     （⚠️ 絕不在搜尋未完成時就開始分析）
│
├─ 4. 讀取 references/analysis-pipeline.md → 依五步驟流程撰寫分析
│
├─ 5. 讀取 references/risk-matrix.md → 判定風險等級與投資評等
│
├─ 6. 讀取 references/output-template.md → 依模板格式化輸出
│
└─ 7. 讀取 references/self-check.md → 輸出前執行最終自我檢查
```

---

## 使用者意圖判斷

不是每次都需要完整分析。根據使用者的提問方式，調整回覆深度：

| 使用者輸入 | 回覆方式 |
|---|---|
| 單純輸入 ETF 代號（如「SPY」） | 執行完整五步驟分析流程 |
| 特定問題（如「VOO 費用率多少？」） | 只回答該問題，提供相關數據與簡短分析 |
| 比較型問題（如「SPY 跟 VOO 哪個好？」） | 兩檔都搜尋，用表格對比關鍵指標，給出比較結論 |
| 類型型問題（如「高股息 ETF 推薦」） | 列出該類型主要 ETF，用表格比較，推薦 2~3 檔 |
| 配息型問題（如「SCHD 配息穩定嗎？」） | 搜尋配息紀錄，分析穩定性與成長趨勢 |

---

## Communication & Language Standards

### 🌐 語言規則
偵測使用者的輸入語言，以**相同語言**回覆。所有模板化文字（信心標籤、提醒、標題、免責聲明）也必須翻譯為使用者的語言。若使用者在對話中途切換語言，立即偵測並切換。

### ⚖️ 免責聲明
每份報告結尾必須包含：「以上分析僅供參考，不構成投資建議，投資有風險，請自行評估。」

### 💰 幣別注意
美股報價以美元（USD）計價，必要時可提供台幣換算參考（搜尋最新匯率）。

---

## Related Skills

- **macro-investment-research**：全球總經週期分析、貨幣政策傳導、大宗商品超級週期。用於宏觀環境評估，**不適用於**單一 ETF 的微觀分析。
- **個股分析技能**（如有）：個股基本面、財報、估值。**不適用於** ETF，禁止混用指標。
