# Cosmetics, Personal Care & Physical Goods R&D Engineering

Production-grade Research & Development framework for formulating skincare, cosmetics, and engineering physical consumer products.

---

## 1. Skincare & Cosmetics Formulation Architecture

Commercial skincare formulation requires precise control of pH, emulsion stability, active delivery systems, and dermal safety.

```text
┌────────────────────────────────────────────────────────────────────────┐
│ CONTINUOUS PHASE (Base Carrier: 60% - 85%)                            │
│ • Hydrosol, deionized water, aloe vera leaf juice, humectants (Glycerin│
│   4%-8%, Butylene Glycol 2%-4%, Hyaluronic Acid cross-polymer 0.1%-1%) │
├────────────────────────────────────────────────────────────────────────┤
│ EMULSION / TEXTURE ARCHITECTURE (3% - 10%)                             │
│ • Emulsifier System: Cetearyl Olivate + Sorbitan Olivate (Liquid crystal│
│   structure) or Glyceryl Stearate + PEG-100 Stearate                  │
│ • Rheology Modifiers: Carbomer (neutralized with TEA/NaOH), Polyacrylate│
│   crosspolymer-6, or Xanthan gum (clear cosmetic grade 0.2%-0.5%)      │
├────────────────────────────────────────────────────────────────────────┤
│ ACTIVE INGREDIENT DELIVERY (1% - 12%)                                  │
│ • Brightening: Niacinamide (2%-5% at pH 6.0), 3-O-Ethyl Ascorbic (1%-3%)
│ • Barrier Repair: Ceramides NP/AP/EOP (1%-2% complex with cholesterol) │
│ • Exfoliation: Salicylic acid (1%-2% at pH 3.5-4.0), Glycolic acid     │
├────────────────────────────────────────────────────────────────────────┤
│ PRESERVATIVE & CHELATING SHIELD (0.8% - 1.5%)                          │
│ • Broad-Spectrum: Phenoxyethanol (0.8%) + Ethylhexylglycerin (0.2%)    │
│ • Chelator: Disodium EDTA (0.05%-0.1% disables metal ions for microbes)│
└────────────────────────────────────────────────────────────────────────┘
```

### Cosmetic Stability Testing Protocols:
1. **Centrifuge Stress Test**: Spin sample at 3,000 RPM for 30 minutes at room temperature. If phase separation (creaming or sedimentation) occurs, the surfactant HLB (Hydrophilic-Lipophilic Balance) requires immediate re-balancing.
2. **Freeze-Thaw Cycling**: Expose product to $-10^{\circ}\text{C}$ for 24 hours, followed by $+45^{\circ}\text{C}$ for 24 hours. Repeat for 3 full cycles. Check for crystallization, syneresis, or viscosity collapse.
3. **Real-Time vs. Accelerated In-Oven**:
   - Oven test: $45^{\circ}\text{C} \pm 2^{\circ}\text{C}$ for 90 days (correlates to 24 months ambient shelf-life).
   - Photostability: Expose in clear PET vs. UV-coated amber glass under daylight lamp to detect active oxidation and color fading.

### Indonesian BPOM Notifikasi Kosmetik (NA) Protocol:
- **DIP (Dokumen Informasi Produk)**: Part 1 Admin & Formula, Part 2 Quality & Raw Material Specs, Part 3 Safety Assessment by certified Safety Assessor, Part 4 Efficacy Confirmation.
- **CPKB Maklon**: Tolling must occur at an Indonesian certified CPKB factory (Golongan A for liquid/emulsion/powder, Golongan B for simple liquids/solids).

---

## 2. Physical Goods & Hardware Engineering

When designing physical consumer goods, ergonomics, material specifications, and failure-mode tolerances dictate unit durability.

```text
       Idea Concept ──► 3D CAD (SolidWorks/Fusion 360) ──► 3D Printed Rapid Prototype (SLA/FDM)
                                                                       │
                                                                       ▼
Mass Production ◄── Tooling / Steel Mold (T1-T3) ◄── DFM (Design for Manufacturing) Audit
```

### Material Selection Matrix for CPG & Hardware:
| Material | Tensile Strength | Thermal Resistance | Impact Durability | Best Application |
|:---------|:-----------------|:-------------------|:------------------|:-----------------|
| **Polypropylene (PP)** | Moderate | Up to 100°C (Microwave-safe) | High flexibility, living hinge | Reusable food containers, shampoo caps |
| **High-Density Polyethylene (HDPE)**| Moderate | Up to 80°C | Chemical & acid resistant | Detergent jugs, lotion pump bottles |
| **ABS Polymer** | High | Up to 85°C | Rigid, high impact impact | Electronic housings, consumer appliance shells |
| **Polycarbonate (PC)** | Very High | Up to 120°C | Crystal clear, shatterproof | Safety goggles, transparent display cases |
| **Stainless Steel 304 (18/8)**| Extreme | > 600°C | Food-grade corrosion proof | Vacuum tumblers, kitchenware, medical gear |

### Non-Negotiable Physical Testing:
- **Drop Test (MIL-STD-810G)**: 6 drops from 1.2m height onto concrete (face, corners, edges). No functional rupture permitted.
- **Hinge & Cycle Fatigue**: Minimum 10,000 continuous open/close cycles for flip-top caps and mechanical latches without plastic stress cracking.
- **Leak & Vacuum Chamber**: Submerge sealed package under water in a vacuum chamber at -0.5 bar for 5 minutes. Zero bubble leakage permitted.
