# Risk Assessment Matrix & Mitigation Formulas

A systematic framework to forecast, evaluate, and neutralize technical, operational, and business risks before executing changes.

---

## 1. The 5x5 Risk Matrix

| Severity \ Likelihood | Rare (1) | Unlikely (2) | Moderate (3) | Likely (4) | Almost Certain (5) |
|:----------------------|:---------|:-------------|:-------------|:-----------|:-------------------|
| **Catastrophic (5)** | High (5) | High (10) | Extreme (15)| Extreme (20)| Critical (25) |
| **Major (4)** | Moderate (4)| High (8) | High (12) | Extreme (16)| Extreme (20) |
| **Moderate (3)** | Low (3) | Moderate (6) | Moderate (9) | High (12) | High (15) |
| **Minor (2)** | Low (2) | Low (4) | Moderate (6) | Moderate (8)| High (10) |
| **Insignificant (1)** | Low (1) | Low (2) | Low (3) | Moderate (4)| Moderate (5) |

---

## 2. Core Risk Domains

### A. Data Loss & Persistence Risk
- **Trigger**: Dropping database columns, altering primary keys, migrating schemas, bulk updates, cache invalidation.
- **Fail-Safe Protocol**:
  1. Mandatory snapshot / backup before migration.
  2. Non-destructive multi-phase migration (Expand &rarr; Migrate &rarr; Contract). Never rename a column in one migration; add the new column first, write to both, backfill, then drop the old column.
  3. Pre-tested rollback scripts verified against a staging clone.

### B. Security & Compliance Risk
- **Trigger**: New API endpoints, auth token refactors, third-party webhook integrations, permissions changes.
- **Fail-Safe Protocol**:
  1. IDOR check: Is the logged-in user explicitly verified as the owner of the requested object ID?
  2. Input boundary schemas: Zero unvalidated parameters reaching the service or database layer.
  3. Secrets leakage: Verify `.env` and sensitive credentials are excluded from client bundles and git history.

### C. Breaking Changes & User Experience (Blast Radius)
- **Trigger**: Modifying public function signatures, changing REST/GraphQL contracts, moving routes.
- **Fail-Safe Protocol**:
  1. Deprecation window with backwards-compatible fallbacks.
  2. Feature flags (split testing or canary release to 5% of traffic).
  3. Clear error messaging with non-breaking recovery options.

### D. Scalability & Latency Regressions
- **Trigger**: New database joins without indexes, N+1 query loops, un-memoized heavy client computations.
- **Fail-Safe Protocol**:
  1. Benchmark against 10x projected production volume.
  2. Query explain-plan analysis (`EXPLAIN ANALYZE`).
  3. Enforce query timeouts and rate limits.

---

## 3. The Pre-Mortem Protocol

Before launching or merging a critical feature, conduct a 3-step Pre-Mortem:
1. **The Post-Catastrophe Assumption**: Assume it is 6 months from now and the project suffered a catastrophic failure (data leaked, system went down, client cancelled).
2. **Failure Mode Brainstorming**: List the top 3 plausible causes for the failure.
3. **Preventative Immunity**: For each cause, assign an immediate preventive guard in today's code before shipping.
