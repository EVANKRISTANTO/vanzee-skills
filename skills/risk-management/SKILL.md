---
name: risk-management
description: >-
  Proactive risk management, failure mode forecasting, and decision analysis. Evaluates severity,
  likelihood, blast radius, security/data risks, and trade-offs before taking action. Provides
  concrete pre-mortems, mitigation safeguards, and rollback strategies.
---

# Proactive Risk Management & Decision Analysis

Anticipate failure before it happens. Evaluates technical, operational, architectural, and business risks to ensure every decision, migration, and code change is resilient and reversible.

---

## Quick Routing: The 4 Assessment Modes

| Mode | Trigger Phrases | Action |
|:-----|:----------------|:-------|
| **1. Change Risk Audit** | *"cek resiko fitur ini"*, *"analisis dampak perubahan"*, *"blast radius check"*, *"risk assessment"* | Calculate Likelihood x Severity score, identify break points, and output concrete mitigation guards. |
| **2. Pre-Mortem Analysis** | *"pre mortem"*, *"apa kemungkinan gagal"*, *"worst case scenario"*, *"failure mode analysis"* | Simulate a catastrophic 6-month failure scenario and reverse-engineer preventative safeguards. |
| **3. Safe Migration Strategy** | *"cara aman migrasi"*, *"migrasi database tanpa downtime"*, *"zero downtime deployment"* | Formulate an Expand-Contract migration plan, data backup checkpoint, and instant rollback script. |
| **4. Architectural Trade-Offs** | *"pilih arsitektur mana"*, *"pro kontra keputusan teknis"*, *"trade-off evaluation"* | Compare options across 5 dimensions: Complexity, Latency, Operational Cost, Maintainability, Reversibility. |

---

## The 4 Laws of Risk Engineering

### 1. Reversibility Over Perfection (Two-Way Doors)
- Classify decisions into **Type 1 (One-Way Doors)**: Irreversible (e.g., dropping production data, changing public API contracts, picking an incompatible proprietary cloud provider) &rarr; Requires strict Pre-Mortem and executive review.
- **Type 2 (Two-Way Doors)**: Reversible with low cost (e.g., tweaking UI components, testing an internal utility) &rarr; Execute rapidly with feature flags.

### 2. Measure the Blast Radius
Before making any change, list every caller, dependent module, database relation, and external integration. If a service fails, will it take down the whole platform (cascade failure) or degrade gracefully?

### 3. Always Ship with a Rollback Plan
A code change without an automated rollback procedure or recovery checkpoint is incomplete. Always answer: *"If this crashes production in 5 minutes, how do we revert within 60 seconds?"*

### 4. Defense-in-Depth
Never rely on a single layer of protection. Input validation must exist on the client AND the server AND database constraints.

---

## Risk Output Template

When requested to assess risks for any plan, task, or codebase change:

```markdown
### ⚠️ Risk Assessment Report: [Task/Decision Name]

1. **Top Identified Risks**:
   - [Critical/High/Medium] - **Risk**: Description
     - *Cause*: Why it happens
     - *Blast Radius*: Who/what breaks
     - *Mitigation*: Exact code or configuration fix to prevent it
2. **Pre-Mortem Failure Scenario**:
   - "How this could fail in production: [...]"
3. **Rollback & Contingency Protocol**:
   - Immediate step-by-step procedure to revert if issues emerge.
```

*Reference: Read [`references/risk-assessment-matrix.md`](./references/risk-assessment-matrix.md) for full scoring matrices and domain-specific checklists.*
