---
name: "macro-investment-research"
description: "Performs global macroeconomic cycle analysis, monetary policy transmission modeling (Fed rate, QE/QT), commodity supercycle tracking (oil, gold, silver, copper), multi-asset allocation planning (e.g., TLT bonds), and historical bubble comparison for investment decision-making."
license: MIT
metadata:
  version: 2.0.0
  author: "Antigravity (Custom)"
  category: "finance"
  updated: 2026-05-29
---

# Macroeconomic & Multi-Asset Investment Research Skill

## Overview

A high-performance research toolkit designed for global macroeconomics and multi-asset tactical investment research. This skill guides the user in building, analyzing, and stress-testing macroeconomic transmission channels, policy rate dynamics (Federal Reserve QE/QT), commodity supercycles, and tactical asset allocations.

Unlike micro-level corporate finance skills, this skill operates at the **macroeconomic, policy-transmission, and asset-class level**, enabling chronological sandboxing (e.g., "Trilogy" phases) and strict historical cycle comparisons (e.g., comparing current AI CapEx trends with the 2000 Dot-com bubble or 2008 Subprime crisis).

---

## Before Starting

**Check for context first:**
If `macro-context.md` or existing investment/macro research files in the current workspace or relevant directories exist, read them to understand the user's historical opinions, asset targets, and preferred formats.

Gather this context (ask if not provided):
1. **Core Macro Theme**: What macro topic or event is being analyzed? (e.g., US Treasury Debt Wall, secondary inflation risks, central bank transition, AI CapEx bubble).
2. **Target Assets**: Which asset classes are being researched? (e.g., 10Y/30Y yields, TLT, Crude Oil, Gold, Silver, Copper, Equities).
3. **Reference Epochs**: Are there historical precedents to compare against? (e.g., 1999–2004 commodity bottom, 2000 Dot-com crash, 2008 Lehman liquidity squeeze, 2011 QE2).

---

## Architecture

This skill follows an **Orchestrator + References** architecture:

```
macro-investment-research/
├── SKILL.md                         ← 你正在讀的這個檔案（指揮官）
└── references/
    ├── core-toolkit.md              ← 四大總經模型組合拳（共用引擎）
    ├── mode-greenfield.md           ← Mode 1 聚焦指令與輸出模板
    ├── mode-critique.md             ← Mode 2 聚焦指令與輸出模板
    ├── mode-historical.md           ← Mode 3 聚焦指令與輸出模板
    ├── proactive-triggers.md        ← 主動風險偵測觸發器（含量化門檻）
    └── terminology.md               ← 繁體中文金融術語對照表
```

**執行流程**：讀取本檔案 → 分派模式 → 讀取 `core-toolkit.md` + 對應的 `mode-*.md` → 執行 → 讀取 `proactive-triggers.md` 進行風險掃描 → 輸出時遵守 `terminology.md`。

---

## Mode Selection — Decision Tree (模式分派邏輯)

根據使用者的 prompt 內容，依照以下規則選擇模式：

```
使用者的 prompt
│
├─ 是否包含一個「既有的投資觀點/論述」要求挑戰或驗證？
│  ├─ YES → Mode 2: CRITIQUE_AND_SANDBOX
│  │         讀取 references/mode-critique.md
│  └─ NO ─┐
│          │
├─ 是否明確要求與「歷史事件/週期」進行對比？
│  ├─ YES → Mode 3: HISTORICAL_TRANSMISSION
│  │         讀取 references/mode-historical.md
│  └─ NO ─┐
│          │
└─ 預設 → Mode 1: GREENFIELD_RESEARCH
            讀取 references/mode-greenfield.md
```

### 混合情境處理規則
當使用者的 prompt **同時觸及多個模式**時（這是常態）：
- **主模式**：選擇最匹配的模式作為框架結構。
- **嵌入子模組**：從其他模式中引入相關工具作為報告的附加章節。
- **範例**：「分析 AI CapEx 泡沫並與 2000 年達康泡沫對比」→ 主模式 = Mode 1 (Greenfield)，嵌入 Mode 3 的歷史對比矩陣作為附加章節。

---

## Modes (模式定義)

### Mode 1: Greenfield Macro & Asset Research (`GREENFIELD_RESEARCH`)
從零開始對新總經主題進行全方位深度研究。使用**全部四大總經模型組合拳**，產出包含 PESTEL 掃描、Mermaid 傳導圖、Trilogy 時間軸與美林投資時鐘配置的完整報告。

**完整工作流程與輸出模板** → 讀取 `references/mode-greenfield.md`

### Mode 2: Thesis Sandbox & Critique (`CRITIQUE_AND_SANDBOX`)
對使用者既有的投資觀點進行結構化壓力測試。以「魔鬼代言人」角色解構論點、驗證傳導路徑、提出替代情境（灰犀牛 + 黑天鵝），並檢驗資產配置與週期定位的一致性。

**完整工作流程與輸出模板** → 讀取 `references/mode-critique.md`

### Mode 3: Historical Cycle & Policy Transmission (`HISTORICAL_TRANSMISSION`)
將當前結構條件與歷史週期進行深度參數對比。建立 PESTEL 跨時代結構表、三維度對比矩陣（貨幣工具/實質需求/市場結構）、並排 Mermaid 傳導圖與歷史三部曲映射。

**完整工作流程與輸出模板** → 讀取 `references/mode-historical.md`

---

## Core Toolkit (核心工具組)

所有模式共用的四大總經模型組合拳：
1. **PESTEL 結構性掃描**：六面向環境掃描
2. **Mermaid 傳導路徑與部門餘額視覺化**：資金流向與阻塞點
3. **三部曲時間軸沙盤 (Trilogy Sandbox)**：多階段動態預測
4. **美林投資時鐘配置 (Investment Clock)**：週期定位與資產配置

**完整定義、公式與各模式引用規則** → 讀取 `references/core-toolkit.md`

---

## Anti-Static Analysis Rule (NO PURE SWOT)

If a user asks for a "SWOT analysis" for macroeconomic research, acknowledge the request but **strictly override the static nature of SWOT**. You must append dynamic models (Mermaid Transmission, Trilogy Sandbox, Investment Clock) to ensure the analysis captures chronological evolution and liquidity dynamics, as SWOT alone cannot price assets or project time horizons.

---

## Proactive Risk Detection (主動風險偵測)

在任何模式的分析過程中，必須主動掃描四大灰犀牛觸發器：
1. 資本支出與折舊週期錯位
2. 債務利息排擠效應
3. 系統性流動性緊縮 (Cash is King)
4. 高息再融資衝擊

**完整定義、量化門檻與 false positive 控制** → 讀取 `references/proactive-triggers.md`

---

## Output Artifacts (輸出產物對照)

| 使用者請求 | 觸發模式 | 輸出產物 |
| :--- | :--- | :--- |
| 「分析某總經主題/事件」 | Mode 1 (Greenfield) | 總經與資產研究報告：PESTEL + Mermaid + LaTeX 公式 + Trilogy 矩陣 + 投資時鐘配置 |
| 「評估/挑戰某個投資看法」 | Mode 2 (Critique) | 論點沙盤推演報告：論點解構 + 傳導驗證 + 替代情境矩陣 + 配置一致性檢驗 |
| 「對比歷史泡沫/週期」 | Mode 3 (Historical) | 歷史對比研究：PESTEL 跨時代表 + 三維度矩陣 + 並排傳導圖 + 三部曲映射 |

---

## Communication & Language Standards

### 🌐 Strict Traditional Chinese & Taiwanese Jargon Standard
All outputs, system summaries, comments, and reports generated under this skill **MUST be entirely in Traditional Chinese (zh-TW) using standard Taiwanese financial and macroeconomic terminology**.

**完整術語對照表與 fallback 規則** → 讀取 `references/terminology.md`

### ✍️ Communication Structure Standard
Every research finding or strategic recommendation must follow this format:
1. **BOTTOM LINE**: A single-sentence core answer or strategy.
2. **WHAT**: Detailed findings with **Confidence Tagging** (🟢 Verified / 🟡 Medium / 🔴 Assumed).
3. **WHY**: Theoretical and real-world transmission logic.
4. **HOW TO ACT**: Actionable step-by-step guidance with conditions and wind-down guidelines.

---

## Related Skills

*   **financial-analyst**: Performs micro-level corporate financial ratio calculations and single-stock DCF valuation. **NOT** for global macroeconomic transmission, central bank policies, or commodity cycles.
*   **business-investment-advisor**: Guides small/medium business capital allocation decisions (purchasing assets, scaling team). **NOT** for secondary financial market asset trading or bond yield modeling.
*   **c-level-advisor**: High-level corporate strategy and startup fundraising advice. **NOT** for tactical macroeconomic portfolio analysis.
