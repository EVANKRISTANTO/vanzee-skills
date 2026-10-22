# Rule: Deep Reasoning, Risk Management & Safe Mutation

Enforce on all complex architecture tasks, database migrations, security modifications, and high-consequence system mutations.

---

## 1. Metacognitive Reasoning Protocol
Before writing code or executing changes on non-trivial tasks:
1. **Deconstruct the Real Objective**: Distinguish between the user's stated request and their underlying structural goal. Identify hidden constraints and edge cases.
2. **First-Principles Evaluation**: Challenge default assumptions. Don't add a library or table if a built-in platform primitive or schema index solves it cleanly.
3. **Multi-Path Comparison**: Evaluate at least two architectural paths (Minimalist vs. Extensible). Select the option that maximizes correctness while minimizing blast radius.

## 2. 5x5 Risk Assessment & Blast Radius Analysis
Before performing migrations, data updates, or irreversible operations, assess risk across two dimensions:
- **Severity (1–5)**: Minor bug (1) to Total catastrophic data loss / security breach (5).
- **Likelihood (1–5)**: Rare edge-case (1) to Guaranteed under high concurrent load (5).
- **Blast Radius**: Calculate how many downstream consumers, callers, tables, or external APIs are impacted if this change breaks.

## 3. Pre-Mortem & Fallback Safeguards
- **The Pre-Mortem Assumption**: Ask: *"If this deployment causes an outage or downtime 3 hours after release, what will be the exact failure mode?"* Fix that flaw before shipping.
- **Rollback Readiness**: Every non-trivial data migration or API refactor must have a deterministic zero-downtime rollback strategy (dual-write, feature flag, or backward-compatible schema expansion).
- **Trust Boundaries**: Never cut input validation, authentication checks, or error handling that prevents silent data corruption.
