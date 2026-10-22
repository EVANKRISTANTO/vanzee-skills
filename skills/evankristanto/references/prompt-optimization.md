# Token-Efficient Prompt Engineering Heuristics

Created by Evan Kristanto for high-signal, minimum-token LLM interactions.

---

## 1. The High-Signal / Zero-Fluff Rule

Every prompt token costs compute, context window, and latency. Default model behavior responds proportionally to signal density: crisp, direct instructions yield focused, deterministic code.

### What to Cut Immediately (Prompt Slop)
- **Conversational preambles**: *"Please can you kindly help me to write a function that..."* -> `Implement <fn_name>:`
- **Redundant affirmations**: *"Make sure it is clean, robust, high quality, production-ready, readable, and modern."* -> Define 1 concrete constraint: `Strict TypeScript, error boundary included.`
- **Speculative meta-instructions**: *"Think step by step and explain your reasoning in detail before writing code"* (unless chain-of-thought is genuinely needed) -> `Output implementation only.`
- **Repetitive context copying**: Do not paste entire files when only an interface or function signature is needed.

---

## 2. Type-Driven & Schema-First Prompting

LLMs parse schemas and TypeScript signatures with 60% fewer tokens and higher accuracy than natural language paragraphs.

### ❌ Low-Efficiency (Natural Language Prompt - ~110 tokens)
> "Please create an endpoint for creating a user. The user should have an id which is a string, an email which must be valid, a name which is a string, and an optional avatar URL. If the user creation fails because the email is already in the database, return a 409 conflict error with a message saying email already registered."

### ✅ High-Efficiency (Schema-Driven - ~35 tokens)
```ts
// Implement POST /users with Zod validation:
const CreateUserSchema = z.object({
  id: z.string().uuid(),
  email: z.string().email(),
  name: z.string().min(1),
  avatarUrl: z.string().url().optional()
});
// Handle 409 Conflict if email exists.
```

---

## 3. Structural Prompt Architecture (Cache-Friendly)

Arrange prompt components to maximize prompt caching (Anthropic, Gemini, OpenAI):

```text
[STATIC CONTEXT & ROLES]      <- Placed once at top (Cached)
[EXACT SCHEMAS & CONSTRAINTS] <- Static rules (Cached)
---
[DYNAMIC USER INPUT / TASK]   <- Changes per turn (At bottom)
```

### Prompt Compaction Formulas:
1. **Action Verb + Output Format + Core Constraint**:
   `"Create <component> in <framework>. Return single-file code. No explanation."`
2. **Delimited Input**:
   Use XML tags (`<data>...</data>`) or Markdown fences to separate task instructions from raw data to prevent context confusion without verbose explanations.
3. **Negative Constraints via Strict Deny-Lists**:
   A one-line deny-list beats three paragraphs of positive pleading:
   `Deny: any inline CSS, any `any` type, any mock data.`
