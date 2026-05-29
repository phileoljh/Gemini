---
name: "macro-investment-research"
description: "Performs global macroeconomic cycle analysis, monetary policy transmission modeling (Fed rate, QE/QT), commodity supercycle tracking (oil, gold, silver, copper), multi-asset allocation planning (e.g., TLT bonds), and historical bubble comparison for investment decision-making."
license: MIT
metadata:
  version: 1.0.0
  author: "Antigravity (Custom)"
  category: "finance"
  updated: 2026-05-27
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

## How This Skill Works

This skill supports 3 modes:

### Mode 1: Greenfield Macro & Asset Research (`GREENFIELD_RESEARCH`)
Used when starting fresh on a new macroeconomic trend or asset class report. This mode builds a highly structured, deep-dive report featuring:
*   **Executive Summary**: Core thesis and main gray rhinos.
*   **LaTeX Mathematical Calculations**: Asset price sensitivity calculations (e.g., Duration sensitivity $\Delta P \approx -D \cdot \Delta y$).
*   **Mermaid Flowcharts**: Explicit visualization of money and risk transmission.
*   **Multi-Phase Sandbox Matrix**: Detailed table outlining chronological phases of yields, prices, and catalysts.

### Mode 2: Thesis Sandbox & Critique (`CRITIQUE_AND_SANDBOX`)
Used to stress-test a given investment view. The agent identifies hidden transmission gaps, challenges bullish/bearish assumptions, evaluates systemic liquidity risks, and structures a multi-phase "Trilogy" trajectory (e.g., phase 1: temporary drop, phase 2: sharp rebound, phase 3: crash/capitulation).

### Mode 3: Historical Cycle & Policy Transmission (`HISTORICAL_TRANSMISSION`)
Used to compare current structural conditions with historical cycles. It systematically contrasts:
*   **Monetary Tools**: Traditional rate cuts vs. Quantitative Easing (QE) and Yield Curve Control (YCC).
*   **Real Demand**: Global capital spending, infrastructure pull (e.g., China's 2008 stimulus), or technology cycles.
*   **Market Structure**: Leverage formats, retail/institutional participation, and liquidity traps.

---

## Core Content Sections & Workflow

### Phase 1: Macro Variable & Transmission Mapping
1. Identify **Primary Catalysts** (e.g., supply shock, policy rate hiking, refinancing wave).
2. Map out the **Transmission Path** (Catalyst ➔ Intermediary Variable ➔ Liquidity Effect ➔ Target Asset Impact).
3. Draw a **Mermaid Diagram** to visually represent these forces. Never leave relationships ambiguous.

### Phase 2: Quantitative Sensitivity & Math Formulations
Avoid vague descriptions like "bond prices will fall when interest rates rise". Use exact financial math:
*   For Bonds: Detail duration $D$ and calculate expected price change:
    $$\Delta P \approx -D \cdot \Delta y$$
*   For Equity Valuation: Use discount rate changes and free cash flow projections to illustrate compression:
    $$V = \sum_{t=1}^{n} \frac{CF_t}{(1 + r)^t}$$
*   For Commodities: Map marginal production cost vs. monetary liquidity levels.

### Phase 3: Chronological Sandbox Matrix (The Trilogy)
Economic trends rarely move in straight lines. Structure all forecasts in a multi-phase matrix:
*   **Phase 1 (The Trigger/Maturity)**: Immediate market reaction, policy intervention, or structural buffer.
*   **Phase 2 (The Friction/Peak)**: Counter-forces clash, peak liquidity strain, or secondary inflation spikes.
*   **Phase 3 (The Hard Landing/Capitulation)**: Ultimate cyclical resolution, bubble burst, or final systemic shift.

Format the sandbox as a rich Markdown table:
| 階段 | 預期走勢 | 關鍵指標區間/目標價 | 核心驅動因素 | 政策與市場變動機制 |
| :--- | :--- | :--- | :--- | :--- |

### Phase 4: Tactical Action & Risk Mitigation Guidelines
Deliver a clear, actionable guide with risk-hedging suggestions. Specifically:
*   **Asset Class Selection**: Distinguish between unleveraged spot assets (e.g., TLT) and leveraged derivatives (e.g., TMF/options).
*   **Phased Entry/Exit Rules**: Use dollar-cost averaging or pyramid structures based on key macro triggers rather than arbitrary dates.
*   **Tail Risk Identification**: Explicitly state the "Survival Condition" (e.g., avoiding margin calls during temporary liquidity spikes).

---

## Proactive Triggers

Surface these macro risks and transmission blocks without being asked:

*   **CapEx vs. Depreciation Lifespan Divergence**: Flag when massive capital spending (CapEx) in new infrastructure (e.g., AI compute, fiber optic networks) faces rapid depreciation/obsolescence cycles, generating cash flow squeezes before profitability matures.
*   **The Debt Interest Crowding-Out Effect**: Flag when explosive government debt issuance coupled with elevated interest rates causes net interest expenses to exceed major budget categories, signaling a fiscal trap that will inevitably force central bank yield suppression (e.g., Twist or YCC).
*   **Systemic Liquidity Squeeze (Cash is King)**: Flag when rapid deleveraging forces institutional players to sell defensive liquid assets (like gold or high-grade bonds) to meet margin calls, warning the user of potential temporary price drops in otherwise solid assets.
*   **High-Interest Refinancing Shock**: Flag when cheap historical debt (0%-2% from previous easy money periods) faces a mandatory rollover in a sustained high-rate environment (4%-6%), threatening corporate margins.

---

## Output Artifacts

| When the user requests... | You deliver... |
| :--- | :--- |
| **"分析某總經主題/事件"** | **Macro & Asset Research Report**: A deep, multi-phase report featuring an Executive Summary, Mermaid transmission diagram, LaTeX equations, and a comprehensive chronological sandbox matrix. |
| **"評估/挑戰某個投資看法"** | **Investment Thesis Sandbox & Critique**: A rigorous pressure test pointing out gray rhinos, structural liquidity blocks, and chronological staging tables. |
| **"對比歷史泡沫/週期"** | **Historical Precedent Matrix**: A comparative grid highlighting policy tools, real demand drivers, cash dynamics, and key takeaways for the current cycle. |

---

## Communication & Language Standards

### 🌐 Strict Traditional Chinese & Taiwanese Jargon Standard
All outputs, system summaries, comments, and reports generated under this skill **MUST be entirely in Traditional Chinese (zh-TW) using standard Taiwanese financial and macroeconomic terminology**. Never use mainland Chinese jargon.

**Mandatory Terminology Map:**
*   *Federal Reserve* ➔ **聯準會**
*   *Yield* ➔ **殖利率**
*   *Duration (存續期)* ➔ **存續期間** (or **久期**)
*   *Hedge Fund* ➔ **避險基金**
*   *Capital Expenditure (CapEx)* ➔ **資本支出**
*   *Free Cash Flow (FCF)* ➔ **自由現金流**
*   *Liquidity Squeeze* ➔ **流動性緊縮**
*   *Margin Call* ➔ **保證金追繳**
*   *Quantitative Easing (QE)* ➔ **量化寬鬆**
*   *Refinancing* ➔ **再融資** (or **借新還舊**)
*   *Treasury Bill* ➔ **超短期國庫券** (or **國庫券**)
*   *Yield Curve Control (YCC)* ➔ **殖利率曲線控制**
*   *Operation Twist* ➔ **扭曲操作**

### ✍️ Communication Structure Standard
Every research finding or strategic recommendation must follow this format:
1.  **BOTTOM LINE**: A single-sentence core answer or strategy.
2.  **WHAT**: Detailed findings with **Confidence Tagging** (🟢 Verified / 🟡 Medium / 🔴 Assumed).
3.  **WHY**: Theoretical and real-world transmission logic.
4.  **HOW TO ACT**: Actionable step-by-step guidance with conditions and wind-down guidelines.

---

## Related Skills

*   **financial-analyst**: Performs micro-level corporate financial ratio calculations and single-stock DCF valuation. **NOT** for global macroeconomic transmission, central bank policies, or commodity cycles.
*   **business-investment-advisor**: Guides small/medium business capital allocation decisions (purchasing assets, scaling team). **NOT** for secondary financial market asset trading or bond yield modeling.
*   **c-level-advisor**: High-level corporate strategy and startup fundraising advice. **NOT** for tactical macroeconomic portfolio analysis.
