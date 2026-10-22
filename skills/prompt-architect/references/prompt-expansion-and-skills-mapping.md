# Prompt Expansion & Skills Auto-Mapping Framework

A systematic engine that transforms rough, ambiguous user thoughts into comprehensive, production-grade prompts that autonomous AI agents execute with zero hallucination.

---

## 1. The 4-Stage Expansion Protocol

```text
[STAGE 1: DECONSTRUCTION]   -> Extract core desire, identify unstated goals & technical boundaries.
[STAGE 2: PROACTIVE IDEATION]-> Suggest 2-3 high-value features or angles the user didn't think of.
[STAGE 3: SKILLS MATCHING]  -> Scan the user's installed skills & rules to inject exact skill triggers.
[STAGE 4: PROMPT SYNTHESIS]  -> Assemble the final high-density, anti-slop prompt blueprint.
```

---

## 2. Stage Breakdown

### Stage 1: Deconstruct & Understand First
Never simply copy-paste or reformat a raw user prompt. Look beneath the surface:
- What is the user *actually* building?
- What are the missing pieces? (e.g., If they ask for a "login page", did they mention auth state, error handling, session persistence, responsive layout, rate limiting?)
- What is the target AI agent's role?

### Stage 2: Ideation Expansion (Value-Add Recommendations)
Before outputting the final prompt, provide **2–3 Proactive Ideas**:
> *"Ide lo udah bagus, tapi biar hasilnya jauh lebih keren & tahan banting, gw rekomendasiin tambahin fitur ini:*
> 1. *[Fitur Tambahan 1]: Penjelasan singkat value-nya.*
> 2. *[Fitur Tambahan 2]: Penjelasan singkat value-nya.*
> 3. *[Fitur Tambahan 3]: Penjelasan singkat value-nya."*

### Stage 3: Skills & Rules Auto-Mapping Directory
The prompt generator automatically scans the user's environment and embeds explicit instructions to utilize available skills:

| Domain | When Prompt Involves... | Auto-Inject These Skills |
|:-------|:------------------------|:-------------------------|
| **UI/UX & Frontend** | Dashboard, landing page, cards, components, aesthetics | `evankristanto`, `universal-responsive`, `web-perf-optimizer`, `ui-ux-pro`, `taste-skill` |
| **Copywriting & Growth** | Landing page text, value props, sales pitch, social caption | `conversion-copywriting`, `social-caption-maker` |
| **Logic & Safety** | Architecture, refactoring, database changes, migrations | `deep-think-planner`, `risk-management`, `ponytail` |
| **Academic & Writing** | Makalah, paper, skripsi, esai, tugas kuliah, humanizer | `academic-student-support`, `zero-ai-detector`, `humanizer` |
| **Marketing & SEO** | SEO audit, meta tags, schema markup, Core Web Vitals | `seo` (agentic-seo), `web-perf-optimizer` |

### Stage 4: High-Density Prompt Synthesis Architecture
The generated prompt must follow this structured, anti-slop blueprint:

```markdown
### 🎯 ROLE & OPERATING POSTURE
[Clear expert role, e.g. Senior Full-Stack Architect / Elite Conversion Copywriter]

### 📌 GOAL & CONTEXT
[Crystal-clear summary of what is being built, why, and for whom]

### ⚡ APPLIED SKILLS & RULES
[Explicit list of matched skills to activate: e.g. evankristanto, universal-responsive]

### 🛠️ FUNCTIONAL SPECIFICATIONS & REQUIREMENTS
- Requirement 1: Concrete detail with boundary rules.
- Requirement 2: Concrete detail with boundary rules.

### 🎨 DESIGN & AESTHETIC DIRECTIVES (If UI)
[Asymmetric Bento, OKLCH dynamic tokens, 24px radius, anti-AI slop]

### 🚫 STRICT ANTI-PATTERNS & DENY-LIST
- Deny: Generic AI 3-column layouts.
- Deny: Unhandled edge cases, inline styling, un-sanitized inputs.

### 📦 EXACT DELIVERABLE FORMAT
[Single-file code, modular components, or structured markdown output]
```

---

## 3. Strict Anti-Slop Language Rules

1. **Natural Human Authority**: Write prompts that sound like a senior tech lead delegating to a principal engineer—sharp, direct, confident, zero artificial filler.
2. **No Robot Cliches**: Ban phrases like *"Please make sure to...", "I would like you to kindly...", "In order to ensure maximum excellence..."*.
3. **Assertive Directives**: Use direct action verbs: `Build`, `Implement`, `Enforce`, `Eradicate`, `Sanitize`.
