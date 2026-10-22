# Metacognitive Reasoning & First-Principles Frameworks

Thinking tools to deconstruct complex, ambiguous prompts and determine the mathematically and architecturally optimal solution path.

---

## 1. The 4-Stage Deep Reasoning Protocol

```text
[STAGE 1: DECONSTRUCTION]  -> Strip jargon, identify core truth, map hidden assumptions
[STAGE 2: DIVERGENCE]      -> Generate 3 distinct solution paths (Minimal, Robust, Frontier)
[STAGE 3: EVALUATION]      -> Stress-test each path against constraints, edge cases & trade-offs
[STAGE 4: SYNTHESIS]       -> Pick optimal path, outline step-by-step deterministic plan
```

---

## 2. Stage Breakdown

### Stage 1: Deconstruction & First Principles
- **Strip the Framing**: Ignore how the user framed the problem initially. Ask: *"What is the physical/logical core of what needs to happen?"*
- **Assumption Audit**: List every unstated assumption (e.g., "Assumes internet connection", "Assumes relational database", "Assumes single-tenant").
- **Edge-Case Matrix**:
  - Boundary limits (0 items, 1 item, 1,000,000 items).
  - Empty / null / malformed inputs.
  - Network timeouts, race conditions, concurrency conflicts.

### Stage 2: Divergence (The Rule of 3 Paths)
Never jump to the first solution that comes to mind. Force the generation of 3 distinct approaches:
1. **The Minimal Viable Path (Ponytail Mode)**: The shortest, cleanest change that fully solves the core need with minimum code and zero added dependencies.
2. **The Scalable Enterprise Path**: Uses established production patterns, strict isolation, and comprehensive error handling.
3. **The Radical Simplification Path**: Deletes existing complexity or uses native platform/standard library primitives to render the problem obsolete.

### Stage 3: Evaluation Matrix
Score each path on a 1–5 scale:
- **Implementation Speed** (Time to working state)
- **Maintenance Burden** (Code surface area added)
- **Blast Radius** (Risk of breaking surrounding systems)
- **Performance / Latency Impact**

### Stage 4: Synthesis & Deterministic Blueprint
Convert the winning path into an ordered sequence of verifiable micro-steps with clear exit criteria:
- Step 1 &rarr; Check &rarr; Step 2 &rarr; Check &rarr; Step 3.
