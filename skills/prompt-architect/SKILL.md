---
name: prompt-architect
description: Advanced meta-prompt generator, ideation expander, and multi-skill orchestrator. Deconstructs raw user ideas, uncovers hidden technical and business constraints, proactively expands scope with high-value recommendations, and automatically maps and injects the user's full catalog of installed skills (all 16 Vanzee Flagship skills, specialized UI/UX design tools, and platform built-ins) into production-grade prompts with zero AI slop.
---

# `prompt-architect` &mdash; Meta-Prompt Generator, Ideation Expander & Multi-Skill Orchestrator

The master prompt engineering and skill-orchestration engine of the Vanzee suite. Transforms rough, ambiguous, or casual thoughts into **ultra-detailed, production-ready master prompts** that autonomous AI agents execute with surgical precision. 

Deconstructs what the user *really* needs, proactively expands the scope with creative and strategic recommendations, and automatically detects and binds the user's entire installed skill catalog into coherent **Multi-Skill Synergy Recipes**.

---

## 🧠 The 4-Stage Prompt Architect Engine

```text
┌─────────────────────────────────────────────────────────────────────────────┐
│                       PROMPT ARCHITECT WORKFLOW                             │
├─────────────────────┬─────────────────────┬─────────────────────────────────┤
│ 1. Deconstruction   │ 2. Proactive Ideas  │ 3. Multi-Skill Orchestration    │
│ • Uncover intent    │ • 2-3 High-Value    │ • Map all 16 Vanzee skills      │
│ • Identify missing  │   recommendations   │ • Inject specialized UI tools   │
│   edge cases/layers │   user didn't see   │ • Formulate Power Stack recipes │
├─────────────────────┴─────────────────────┴─────────────────────────────────┤
│ 4. Master Prompt Synthesis (Anti-Slop Production Blueprint)                 │
│ • Role & Operating Posture • Functional Specs • Applied Skills Directives   │
│ • Strict Deny-List Clichés • Design & Security Directives • Deliverables    │
└─────────────────────────────────────────────────────────────────────────────┘
```

### Stage 1: Deep Deconstruction & Scope Clarification
Never just echo or dress up a raw user prompt. Look beneath the surface:
1. **Core Business / Technical Objective**: What is the root problem to be solved?
2. **Missing Architectural Layers**: Did the user forget database schemas, authentication persistence, responsive breakpoints, error boundaries, rate limiting, or input validation?
3. **Commercial & Regulatory Realities**: Did they miss unit economics, pricing margin structures, licensing (OSS-RBA/BPOM/HKI), or contract terms?

### Stage 2: Proactive Ideation (2–3 High-Value Upgrades)
Before outputting the final prompt, provide **2–3 strategic recommendations**:
> *"Ide dasar lo: [Ringkasan ide awal]*  
> *Biar hasilnya jauh lebih keren, maksimal, dan berdaya saing tinggi, gw rekomendasiin tambahin 3 poin krusial ini:*  
> 1. **[Ide Tambahan 1]**: *Penjelasan kenapa fitur/sudut pandang ini penting.*  
> 2. **[Ide Tambahan 2]**: *Penjelasan kenapa fitur/sudut pandang ini penting.*  
> 3. **[Ide Tambahan 3]**: *Penjelasan kenapa fitur/sudut pandang ini penting.*"

### Stage 3: Multi-Skill Auto-Orchestration
Scan the domain and bind matching skills from the user's master library:

| Domain | Available Skills to Auto-Inject |
|:-------|:--------------------------------|
| **Web Craft & Modern UI** | `evankristanto`, `universal-responsive`, `web-perf-optimizer`, `design-taste-frontend`, `animate`, `ui-ux-pro-max`, `theme-factory` |
| **Backend & Architecture** | `fullstack-developer`, `ponytail`, `deep-think-planner` |
| **Cybersecurity & Safety** | `cyber-security-auditor`, `risk-management` |
| **Business, Finance & R&D**| `business-growth-strategist`, `pricing-decision-strategist`, `product-rnd-architect` |
| **Editorial & Copywriting**| `conversion-copywriting`, `social-caption-maker`, `editorial-article-maker`, `agentic-seo`, `zero-ai-detector`, `humanizer` |
| **Academic & Pedagogy** | `academic-student-support`, `zero-ai-detector` |
| **Platform Automation** | `automation`, `generative_ui`, `agy-customizations` |

#### Proven Multi-Skill "Power Stacks":
- **SaaS Startup MVP**: `fullstack-developer` + `evankristanto` + `cyber-security-auditor` + `pricing-decision-strategist` + `business-growth-strategist`.
- **F&B / Physical Product Launch**: `product-rnd-architect` + `pricing-decision-strategist` + `conversion-copywriting` + `social-caption-maker`.
- **Media & Viral Content**: `editorial-article-maker` + `agentic-seo` + `zero-ai-detector` + `social-caption-maker`.
- **Enterprise Refactoring & Security**: `deep-think-planner` + `cyber-security-auditor` + `risk-management` + `ponytail`.

### Stage 4: Production-Grade Master Prompt Synthesis
Generate the final prompt in a clean, copyable block using natural, assertive human authority (zero robotic AI preambles):

```markdown
```text
[ROLE & EXPERTISE]:
Act as a [Principal Fullstack Architect / Elite Cyber Security Lead / Senior Growth Strategist].

[OBJECTIVE & HIGH-LEVEL GOAL]:
[Clear, unambiguous statement of what is being built, the target audience, and primary success metric]

[APPLIED SKILLS & DIRECTIVES]:
Activate and enforce the following installed skills:
- [skill-name-1]: [Specific reason / scope]
- [skill-name-2]: [Specific reason / scope]
- [skill-name-3]: [Specific reason / scope]

[TECHNICAL & FUNCTIONAL SPECIFICATIONS]:
1. [Core Requirement 1]: Specific input/output, data structures, and edge-case behaviors.
2. [Core Requirement 2]: Validation, error handling, state management, and persistence.
3. [Proactive Enhancement]: The expanded feature agreed upon in Stage 2.

[DESIGN & ARCHITECTURAL STANDARDS] (If Applicable):
- Bento Grid geometry: 24px border radiuses, dual-layer elevation, subtle border-white/10.
- Typography & Spacing: Fluid clamp() mathematics and container queries (@container).
- Defensive Security: Parameterized queries, sanitization, strict CSP, OWASP Top 10 compliance.

[STRICT ANTI-PATTERNS (DENY-LIST)]:
- NEVER use generic AI cliches: "delve", "testament", "seamlessly", "in today's fast-paced world".
- NEVER output unstyled 3-card templates or raw SQL string concatenations.
- NO conversational filler in code responses.

[OUTPUT FORMAT & DELIVERABLES]:
[Exact file paths, unified diffs, structured report, or single-file deployment instructions]
```
```

---

## 🚫 Anti-Slop Prompting Rules
- **No Chatbot Preambles**: Strip all *"Could you kindly please help me to..."* or *"I hope you are doing well"*.
- **Direct Operational Stance**: Use strong imperatives: `Implement`, `Enforce`, `Eradicate`, `Sanitize`, `Structure`.
- **Exhaustive Clarity**: The description must leave zero room for the model to guess, hallucinate parameters, or cut corners.

---

## 📚 Deep-Dive References

For the complete catalog and expansion templates, consult:
- [`references/installed-skills-catalog-and-taxonomy.md`](file:///C:/Users/Administrator/.gemini/config/skills/prompt-architect/references/installed-skills-catalog-and-taxonomy.md) &mdash; Directory of all 16 Vanzee Flagship skills + specialized UI/Design skills + Antigravity built-ins with triggers and synergy recipes.
- [`references/prompt-expansion-and-skills-mapping.md`](file:///C:/Users/Administrator/.gemini/config/skills/prompt-architect/references/prompt-expansion-and-skills-mapping.md) &mdash; The 4-stage expansion workflow, master prompt archetypes, and anti-slop rules.
