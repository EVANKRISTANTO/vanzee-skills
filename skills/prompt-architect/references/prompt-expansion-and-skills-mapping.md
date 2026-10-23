# Prompt Expansion & Skills Auto-Mapping Framework
> Reference guide for `prompt-architect` — 4-stage expansion protocol, domain routing, and production-grade master prompt synthesis templates.

---

## 1. The 4-Stage Prompt Architect Engine

```text
[STAGE 1: DECONSTRUCTION]   -> Uncover core intent, missing edge cases, business assumptions & technical limits.
[STAGE 2: PROACTIVE IDEATION]-> Offer 2-3 high-value features or strategic angles the user didn't think of.
[STAGE 3: MULTI-SKILL MAP]  -> Auto-detect & inject optimal combination of installed skills (Vanzee + System).
[STAGE 4: MASTER SYNTHESIS] -> Generate copy-paste ready, high-density, anti-slop operational prompt.
```

---

## 2. Detailed Execution Guidelines

### Stage 1: Deconstruction & Scope Clarification
Never blindly repeat or dress up a raw prompt. Deconstruct it into first principles:
- **Core Intent**: What is the root problem the user wants to solve?
- **Missing Technical Layers**: Did the user forget database schemas, state management, auth token expiration, responsive breakpoints, rate limits, or error handling?
- **Commercial & Legal Blindspots**: Did they consider unit economics, pricing markup, terms of service, or licensing (OSS-RBA/BPOM)?

### Stage 2: Proactive Ideation (2–3 High-Value Upgrades)
Before outputting the final prompt, present **2–3 strategic recommendations**:
> *"Ide lo: [Ringkasan ide awal]*  
> *Biar hasilnya jauh lebih maksimal, tahan banting, dan berdaya saing tinggi, gw rekomendasikan tambahin 3 poin krusial ini:*  
> 1. **[Ide Tambahan 1]**: *Penjelasan kenapa fitur/sudut pandang ini penting.*  
> 2. **[Ide Tambahan 2]**: *Penjelasan kenapa fitur/sudut pandang ini penting.*  
> 3. **[Ide Tambahan 3]**: *Penjelasan kenapa fitur/sudut pandang ini penting.*"

### Stage 3: Skills Auto-Mapping & Recipe Assembly
Scan the domain and auto-inject matching skills from [`references/installed-skills-catalog-and-taxonomy.md`](./installed-skills-catalog-and-taxonomy.md):

| Domain | Matching Skill Triggers |
|:-------|:------------------------|
| **Web Craft & Aesthetics** | `evankristanto`, `universal-responsive`, `web-perf-optimizer`, `design-taste-frontend`, `animate`, `ui-ux-pro-max` |
| **Backend & Architecture** | `fullstack-developer`, `ponytail`, `deep-think-planner` |
| **Security & Auditing** | `cyber-security-auditor`, `risk-management` |
| **Commercial, Pricing & R&D**| `business-growth-strategist`, `pricing-decision-strategist`, `product-rnd-architect` |
| **Content, Copy & Viral Growth**| `conversion-copywriting`, `social-caption-maker`, `editorial-article-maker`, `agentic-seo`, `zero-ai-detector` |
| **Academic & Pedagogy** | `academic-student-support`, `zero-ai-detector`, `humanizer` |
| **Platform Automation** | `automation`, `generative_ui`, `agy-customizations` |

### Stage 4: Production-Grade Master Prompt Synthesis
Generate the finalized prompt inside a dedicated, copyable markdown block following this standard architecture:

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

## 3. Master Prompt Archetypes

### Archetype A: Fullstack SaaS Application
```text
Role: Senior Principal Fullstack Systems Architect
Skills Injected: fullstack-developer, evankristanto, cyber-security-auditor, universal-responsive
Focus: Clean Architecture, Next.js RSC, PostgreSQL UUIDv7 schema, row-level locking, OWASP Top 10 defense, and tactile modern Bento UI.
```

### Archetype B: Cyber Security Code Audit & Remediation
```text
Role: Elite Lead Security Auditor & DevSecOps Engineer
Skills Injected: cyber-security-auditor, risk-management, ponytail
Focus: Source-to-sink data flow tracing, CWE/OWASP mapping, deterministic CVSS v3.1 vector calculation, dual-lens remediation (ELI5 layman analogy + drop-in unified git diff), and defensive negative unit tests.
```

### Archetype C: Product Formulation & Commercial Pricing
```text
Role: Chief Product Officer & CFO Dual-Lens Commercial Strategist
Skills Injected: product-rnd-architect, pricing-decision-strategist, business-growth-strategist
Focus: Ingredient percentage formulation, ASLT Arrhenius shelf-life testing, BPOM MD/Halal checkpoints, true HPP/COGS breakdown, and 3-tier markup decision matrix with retail waterfall margin simulation.
```

### Archetype D: Publication-Grade Journalism & SEO Blog
```text
Role: Senior Editorial Journalist & Technical SEO Director
Skills Injected: editorial-article-maker, agentic-seo, zero-ai-detector, social-caption-maker
Focus: Inverted pyramid newsroom structure (5W+1H lede, nut graph, future kicker), featured snippet direct-answer blocks (45 words), 3-sentence mobile paragraph rhythm, schema-ready FAQs, and zero AI cliches.
```
