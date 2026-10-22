---
name: deep-think-planner
description: >-
  Metacognitive deep reasoning and first-principles planning. Forces the agent to pause, deeply
  analyze user prompts, deconstruct ambiguity, uncover hidden constraints and edge cases, evaluate
  multiple solution paths, and synthesize the optimal step-by-step execution strategy before acting.
---

# Deep Think & First-Principles Planning Engine

Never jump directly into coding or answering without deep cognitive analysis. This skill enforces a structured **"Think First, Plan Deterministically, Execute with Precision"** discipline.

---

## When to Apply

Activate this skill when:
- The user's request is complex, ambiguous, high-stakes, or architecturally sensitive.
- The user explicitly prompts: *"pikirkan dulu"*, *"analisis cara terbaik"*, *"deep think"*, *"plan this thoroughly"*, *"evaluasi sebelum buat"*.
- Making changes that touch core databases, authentication, payments, or multi-module architecture.

---

## The 4-Step Deep Analysis Workflow

When this skill activates, output a clear, structured analytical preamble before executing the final solution:

### 1. 🔍 Deconstruction & Problem Clarity
- **Core Intent**: What is the user *really* trying to achieve beneath the surface request?
- **Explicit vs. Implicit Constraints**: What are the non-negotiables (stack, time, backward compatibility)?
- **Hidden Assumptions & Edge Cases**: What breaks if input is empty, concurrent, ultra-large, or malformed?

### 2. ⚖️ Multi-Path Exploration
Explore 2–3 viable approaches:
- **Option A (The Minimalist)**: Least code, zero extra libraries, uses native platform features.
- **Option B (The Enterprise)**: Maximum modularity, strict error isolation, long-term scalability.
- **Trade-off Summary**: Compare latency, complexity, and maintainability.

### 3. 🎯 Optimal Recommendation
- State clearly which option wins and **why** (grounded in first-principles logic).

### 4. 📋 Ordered Execution Roadmap
- Sequential, verifiable steps with concrete validation checkpoints:
  - Phase 1: Preparation & verification of dependencies/schema.
  - Phase 2: Implementation of core logic with boundary guards.
  - Phase 3: Edge-case validation and error recovery check.

---

*Reference: See [`references/metacognitive-frameworks.md`](./references/metacognitive-frameworks.md) for first-principles thinking models and failure-mode checklists.*
