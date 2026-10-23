# COGS Anatomy, Markup vs. Margin Mathematics & Break-Even Engineering

Financial engineering reference for calculating true Cost of Goods Sold (HPP), mastering markup-to-margin conversions, and determining break-even thresholds.

---

## 1. The True COGS (HPP) Anatomy

Never calculate pricing based on raw materials alone. True COGS (Harga Pokok Penjualan) includes every direct and allocable variable cost incurred to place a finished unit in the warehouse.

```text
┌────────────────────────────────────────────────────────────────────────┐
│ DIRECT RAW MATERIALS (Bahan Baku Utama & Aditif)                       │
│ • Active ingredients, base carrier, flavors, stabilizers, functional   │
├────────────────────────────────────────────────────────────────────────┤
│ PRIMARY & SECONDARY PACKAGING (Kemasan & Label)                        │
│ • Bottle / Pouch / Box, inner seal, tamper-evident band, carton box    │
├────────────────────────────────────────────────────────────────────────┤
│ DIRECT LABOR & TOLL MANUFACTURING FEE (Biaya Maklon / Tenaga Kerja)    │
│ • Production run fee per unit, labor hours for assembly & QC inspection│
├────────────────────────────────────────────────────────────────────────┤
│ INBOUND LOGISTICS & WASTE ALLOWANCE (Ongkir Bahan & Susut/Waste 3-5%)  │
│ • Freight of raw ingredients to factory, scraping & spillage loss      │
├────────────────────────────────────────────────────────────────────────┤
│ = TRUE COGS (HPP RIIL PER UNIT) ──> The Absolute Financial Floor       │
└────────────────────────────────────────────────────────────────────────┘
```

---

## 2. Markup % vs. Margin %: The Fatal Confusion

Confusing **Markup** with **Gross Margin** bankrupts growing businesses. Markup is calculated on top of cost; Margin is calculated as a percentage of the selling price.

$$\text{Markup \%} = \left(\frac{\text{Selling Price} - \text{COGS}}{\text{COGS}}\right) \times 100$$

$$\text{Gross Margin \%} = \left(\frac{\text{Selling Price} - \text{COGS}}{\text{Selling Price}}\right) \times 100$$

### Conversion Formulas:
$$\text{Margin} = \frac{\text{Markup}}{1 + \text{Markup}} \qquad \Longleftrightarrow \qquad \text{Markup} = \frac{\text{Margin}}{1 - \text{Margin}}$$

### Universal Conversion Cheat Sheet:
| Desired Gross Margin % | Required Cost Markup % | Price Multiplier ($x \text{ COGS}$) | Practical Application |
|:-----------------------|:-----------------------|:-----------------------------------|:----------------------|
| **20%** | **25%** | $1.25\times$ | Low-margin B2B commodities, wholesale trading |
| **33.3%** | **50%** | $1.50\times$ | Supermarket FMCG, distributor wholesale |
| **50.0%** | **100%** | $2.00\times$ (Keystone) | Traditional retail, basic apparel, F&B outlets |
| **60.0%** | **150%** | $2.50\times$ | Standard D2C e-commerce, consumer packaged goods |
| **70.0%** | **233%** | $3.33\times$ | High-growth D2C brands, specialized supplements |
| **80.0%** | **400%** | $5.00\times$ | Premium skincare, cosmetics, luxury fashion |
| **90.0%** | **900%** | $10.00\times$ | Digital SaaS, proprietary IP, fine fragrances |

---

## 3. Contribution Margin (CM) & Break-Even Analysis

Gross margin indicates theoretical health, but **Contribution Margin** determines whether each sale contributes cash toward covering fixed corporate overhead (salaries, rent, software).

$$\text{Unit Contribution Margin (UCM)} = \text{Selling Price} - \text{Variable Costs per Unit (COGS + Payment Fee + Packaging Box + Shipping Subsidy)}$$

$$\text{Contribution Margin Ratio (CMR)} = \frac{\text{Unit Contribution Margin}}{\text{Selling Price}}$$

### Break-Even Point (BEP) Calculations:
$$\text{BEP in Units} = \frac{\text{Total Monthly Fixed Overhead (SG\&A)}}{\text{Unit Contribution Margin}}$$

$$\text{BEP in Revenue (Rp)} = \frac{\text{Total Monthly Fixed Overhead (SG\&A)}}{\text{Contribution Margin Ratio}}$$

### The Safety Margin Metric:
$$\text{Margin of Safety \%} = \left(\frac{\text{Current Sales Volume} - \text{BEP Volume}}{\text{Current Sales Volume}}\right) \times 100$$
- `> 30%`: Healthy operational cushion. The business can withstand demand shocks.
- `< 10%`: Dangerous knife-edge. A 10% drop in sales causes operational cash loss.
