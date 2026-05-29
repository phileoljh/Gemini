# 繁體中文金融術語對照表與 Fallback 規則

## 使用說明

本檔案定義了所有總經研究輸出中**必須遵守**的台灣標準金融術語。AI 在產出任何報告、註解、圖表標籤或系統摘要時，必須依照以下對照表將英文術語轉換為對應的繁體中文。

---

## 核心術語對照表

### 央行與貨幣政策

| 英文術語 | 台灣標準繁體中文 | 備註 |
|:---------|:-----------------|:-----|
| Federal Reserve (Fed) | 聯準會 | 非「美联储」 |
| Quantitative Easing (QE) | 量化寬鬆 | |
| Quantitative Tightening (QT) | 量化緊縮 | |
| Balance Sheet Runoff | 縮表 | 聯準會被動縮減資產負債表 |
| Tapering | 縮減購債 | QE 退場前的漸進縮減 |
| Operation Twist | 扭曲操作 | |
| Yield Curve Control (YCC) | 殖利率曲線控制 | |
| Forward Guidance | 前瞻指引 | 央行對未來政策路徑的溝通 |
| Federal Funds Rate | 聯邦基金利率 | |
| Discount Rate | 貼現率 | 央行對銀行的放款利率 |
| Reserve Requirement | 存款準備率 | |
| Open Market Operations | 公開市場操作 | |

### 利率與債券

| 英文術語 | 台灣標準繁體中文 | 備註 |
|:---------|:-----------------|:-----|
| Yield | 殖利率 | 非「收益率」 |
| Duration | 存續期間 | 或「久期」，衡量債券價格對利率變動的敏感度 |
| Treasury Bill (T-Bill) | 超短期國庫券 / 國庫券 | 期限 ≤ 1 年 |
| Treasury Note (T-Note) | 中期公債 | 2-10 年期 |
| Treasury Bond (T-Bond) | 長期公債 | 20-30 年期 |
| Term Premium | 期限溢酬 | 投資人持有長天期債券所要求的額外補償 |
| Real Rate / Real Interest Rate | 實質利率 | 名目利率 - 通膨率 |
| Nominal Rate | 名目利率 | |
| Inverted Yield Curve | 殖利率曲線倒掛 | |
| Credit Spread | 信用利差 | |
| Refinancing | 再融資 / 借新還舊 | |
| Coupon | 票面利率 | |

### 通膨與經濟週期

| 英文術語 | 台灣標準繁體中文 | 備註 |
|:---------|:-----------------|:-----|
| Inflation | 通貨膨脹 / 通膨 | |
| Deflation | 通貨緊縮 | |
| Stagflation | 停滯性通膨 | 高通膨 + 經濟停滯 |
| Reflation | 再通膨 / 通貨再膨脹 | 經濟復甦初期的溫和通膨回升 |
| Disinflation | 通膨趨緩 | 通膨率下降但仍為正 |
| CPI (Consumer Price Index) | 消費者物價指數 | |
| PCE (Personal Consumption Expenditures) | 個人消費支出物價指數 | 聯準會偏好的通膨指標 |
| GDP (Gross Domestic Product) | 國內生產毛額 | |
| Business Cycle | 景氣循環 | |
| Soft Landing | 軟著陸 | |
| Hard Landing | 硬著陸 | |
| Recession | 衰退 | |

### 資產類別與市場結構

| 英文術語 | 台灣標準繁體中文 | 備註 |
|:---------|:-----------------|:-----|
| Hedge Fund | 避險基金 | 非「对冲基金」 |
| Capital Expenditure (CapEx) | 資本支出 | |
| Free Cash Flow (FCF) | 自由現金流 | |
| Liquidity Squeeze | 流動性緊縮 | |
| Margin Call | 保證金追繳 | |
| Carry Trade | 套息交易 | 借低利貨幣投入高利資產 |
| Deleveraging | 去槓桿 | |
| Short Squeeze | 軋空 | |
| Risk-On / Risk-Off | 風險偏好上升 / 風險趨避 | |
| Flight to Quality | 資金避險 / 避險資金湧入 | |
| Equity Risk Premium (ERP) | 股權風險溢酬 | |
| P/E Ratio | 本益比 | 非「市盈率」 |
| Futures | 期貨 | 非「期货」 |
| Options | 選擇權 | 非「期权」 |
| ETF (Exchange-Traded Fund) | 指數股票型基金 | |

### 商品與原物料

| 英文術語 | 台灣標準繁體中文 | 備註 |
|:---------|:-----------------|:-----|
| Commodity Supercycle | 商品超級週期 | |
| Marginal Production Cost | 邊際生產成本 | |
| Contango | 正價差 / 期貨溢價 | 遠月合約高於近月 |
| Backwardation | 逆價差 / 期貨折價 | 近月合約高於遠月 |
| Crude Oil (WTI / Brent) | 原油（西德州中質原油 / 布蘭特原油） | |
| Spot Price | 現貨價格 | |

---

## Fallback 規則

當 AI 遇到**不在上述對照表中**的英文金融術語時，必須依照以下優先順序決定翻譯：

1. **優先查閱**：台灣證券交易所 (TWSE)、中華民國中央銀行、金融監督管理委員會 (金管會) 的官方用語。
2. **次要參考**：台灣主流財經媒體（如：經濟日報、工商時報、財訊）的慣用譯法。
3. **避免使用**：中國大陸金融用語（如：「美联储」、「收益率」、「市盈率」、「对冲基金」、「期权」等）。
4. **無法判斷時**：保留英文原文並以括號附註中文解釋，格式為：`英文術語（中文解釋）`。

> [!IMPORTANT]
> 任何情況下，**絕對不允許**在同一份報告中混用台灣與中國大陸金融術語。一致性優先於翻譯精確性。
