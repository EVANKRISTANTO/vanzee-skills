---
name: prompt-architect
description: >-
  Advanced prompt generator & idea expander. Deconstructs raw user ideas, proactively expands them
  with high-value recommendations, maps installed skills/rules (UI/UX, security, copywriting, SEO, reasoning),
  and synthesizes ultra-detailed, production-grade prompts with zero AI slop.
---

# Prompt Architect: Meta-Prompt Generator & Ideation Expander

Transforms rough, basic, or informal user ideas into **ultra-detailed, production-ready prompts** that AI coding agents execute flawlessly. Deconstructs what the user *really* needs, proactively expands the scope with creative recommendations, and automatically maps their installed skills and rules into the prompt.

---

## The 3-Step Execution Protocol

Whenever a user asks to generate, improve, or expand a prompt:

### Step 1: Deep Understanding & Ideation Expansion
Never just rephrase the user's input. First, understand the core problem, then proactively propose **2–3 High-Value Ideas** to make it significantly better:
> *"Ide dasar lo: [Ringkasan ide].*  
> *Biar hasilnya jauh lebih keren, maksimal, dan komplit, gw rekomendasiin tambahin poin-poin ini:*  
> 1. **[Ide Tambahan 1]**: *Penjelasan kenapa ini penting.*  
> 2. **[Ide Tambahan 2]**: *Penjelasan kenapa ini penting.*  
> 3. **[Ide Tambahan 3]**: *Penjelasan kenapa ini penting.*"

### Step 2: Automatic Skills & Rules Detection
Scan the prompt's domain and explicitly mandate the AI to activate matching skills:

| Domain | Matched Skills to Auto-Inject |
|:-------|:------------------------------|
| **UI/UX & Frontend** | `evankristanto`, `universal-responsive`, `web-perf-optimizer`, `ui-ux-pro`, `taste-skill` |
| **Copywriting & Marketing** | `conversion-copywriting`, `social-caption-maker` |
| **Architecture & Safety** | `deep-think-planner`, `risk-management`, `ponytail` |
| **Akademik & Humanizer** | `academic-student-support`, `zero-ai-detector`, `humanizer` |
| **SEO & Performance** | `seo` (agentic-seo), `web-perf-optimizer` |

### Step 3: Synthesis of the High-Density Anti-Slop Prompt
Generate the final prompt in a clean, copyable block using natural, assertive human authority (zero robotic AI preambles):

```markdown
```text
[ROLE]: Act as a [Senior Principal Engineer / Elite Specialist].

[OBJECTIVE & CONTEXT]:
[Clear, unambiguous statement of what is being built, why, and target outcome]

[APPLIED SKILLS & RULES]:
Activate and enforce the following skills: [e.g. evankristanto, universal-responsive]

[DETAILED SPECIFICATIONS]:
1. [Core Feature 1]: Exact logic, inputs, outputs, and edge-case behavior.
2. [Core Feature 2]: Exact logic, inputs, outputs, and edge-case behavior.
3. [Expanded Ideation Feature]: The proactive features agreed upon.

[AESTHETIC & ARCHITECTURAL DIRECTIVES] (If UI/Design):
- 24px border radius, dual-layer elevation, asymmetric bento layout.
- OKLCH dynamic color adaptation based on brand theme.
- Container queries (@container) and fluid clamp() typography.

[STRICT ANTI-PATTERNS (DENY-LIST)]:
- Deny: Generic AI 3-column layouts.
- Deny: Unhandled errors, inline styles, unescaped DOM rendering.
- Deny: Conversational filler in code responses.

[OUTPUT FORMAT]:
[Exact deliverable format required]
```
```

---

## Anti-Slop Prompting Rules
- **No Chatbot Preambles**: Strip all *"Could you kindly please help me to..."* or *"I hope you are doing well"*.
- **Direct Operational Stance**: Use strong imperatives: `Implement`, `Enforce`, `Eradicate`, `Sanitize`, `Structure`.
- **Exhaustive Clarity**: The description must leave zero room for the model to guess or hallucinate parameters.

*Reference: See [`references/prompt-expansion-and-skills-mapping.md`](./references/prompt-expansion-and-skills-mapping.md) for full expansion workflows and skills mapping matrices.*
