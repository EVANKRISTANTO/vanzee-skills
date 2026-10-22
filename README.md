<div align="center">

# ⚡ vanzee-skills

**The definitive web craft & growth skills suite for autonomous AI coding agents.**  
*High-signal prompt engineering, modern tactile UI/UX, zero-break responsive layouts, sub-second web performance, and enterprise-grade conversion copywriting.*

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg?style=flat-square)](https://opensource.org/licenses/MIT)
[![Agent Skills](https://img.shields.io/badge/Spec-Agent%20Skills-purple.svg?style=flat-square)](https://agenticskills.io)
[![Antigravity](https://img.shields.io/badge/AI-Antigravity%202.0-orange.svg?style=flat-square)](https://github.com/google-deepmind)
[![Claude Code](https://img.shields.io/badge/AI-Claude%20Code-d97706.svg?style=flat-square)](https://claude.ai)
[![Zero AI Slop](https://img.shields.io/badge/Design-Anti--AI%20Slop-00E5FF.svg?style=flat-square)](#)

[Overview](#-suite-overview) • [Installation](#-installation) • [The 4 Flagship Skills](#-the-4-flagship-skills) • [Prompt Recipes](#-interactive-usage-recipes) • [Contributing](#-contributing)

---

</div>

## 🌐 Suite Overview

Most AI coding agents produce repetitive, generic output: cliché 3-column layouts, bloated prompts that burn context tokens, unoptimized images causing layout shifts, robotic corporate prose, and basic security oversights.

**`vanzee-skills`** transforms your AI assistant (Google Antigravity, Claude Code, OpenAI Codex, Cursor, Windsurf) into a world-class senior design engineer, defensive security architect, performance specialist, and conversion copywriter.

```text
vanzee-skills/
├── skills/
│   ├── evankristanto/          # Prompt Compaction, Modern Bento/Aura UI, Security Shield, SEO & Email
│   ├── universal-responsive/    # Container Queries, Fluid clamp(), Foldables to 4K Ultra-Wide
│   ├── web-perf-optimizer/      # 100/100 Lighthouse, Sub-second LCP, Zero CLS, Sub-50ms INP
│   └── conversion-copywriting/  # Anti-AI Voice Engine, B2B Enterprise Copy, Landing Page Blueprints
```

---

## 🚀 Installation

### Option 1: Automatic One-Line Install (Recommended)

#### For Windows (PowerShell):
```powershell
# Install for Antigravity (Default)
irm https://raw.githubusercontent.com/EVANKRISTANTO/vanzee-skills/main/install.ps1 | iex

# Or install for all supported agents (Antigravity, Claude Code, Codex)
& { irm https://raw.githubusercontent.com/EVANKRISTANTO/vanzee-skills/main/install.ps1 } -Target all
```

#### For macOS & Linux (Bash):
```bash
# Clone and install locally
git clone https://github.com/EVANKRISTANTO/vanzee-skills.git
cd vanzee-skills
./install.sh all
```

---

### Option 2: Manual Installation by Agent

<details>
<summary><b>Google Antigravity</b> (Global Installation)</summary>

Copy the folders from `skills/` directly to your global Antigravity customizations directory:
```bash
# Windows
Copy-Item -Path "skills\*" -Destination "$HOME\.gemini\config\skills\" -Recurse -Force

# Linux / macOS
cp -R skills/* ~/.gemini/config/skills/
```
</details>

<details>
<summary><b>Claude Code</b></summary>

```bash
# Windows
Copy-Item -Path "skills\*" -Destination "$HOME\.claude\skills\" -Recurse -Force

# Linux / macOS
cp -R skills/* ~/.claude/skills/
```
</details>

<details>
<summary><b>OpenAI Codex CLI</b></summary>

```bash
# Linux / macOS
cp -R skills/* ~/.codex/skills/
```
</details>

<details>
<summary><b>Cursor / Windsurf / Project Workspace</b></summary>

Copy to your project's `.agents/skills/` or `.cursor/skills/` folder:
```bash
mkdir -p .agents/skills
cp -R skills/* .agents/skills/
```
</details>

---

## 💎 The 4 Flagship Skills

### 1. `evankristanto` &mdash; Flagship Web Craft & Systems Architecture
> **The core engine: High-signal prompt engineering, modern tactile UI/UX, defensive web security, and growth marketing.**

- **Token Compaction**: Cuts 40%–70% of prompt fluff by converting instructions into schema-first TypeScript interfaces and cache-friendly delimiter blocks.
- **Modern UI/UX Design System**:
  - **Tactile Bento Cards**: 24px radius, dual-layer depth (`box-shadow: 0 20px 40px -15px rgba(0,0,0,0.6)`), 1px subtle borders.
  - **Dynamic Palette Matrix**: Automatically maps any brand color into harmonized, high-contrast OKLCH semantic tokens (Cyber Dark, Fintech Neon, Sunset Aura, Clean Porcelain, Emerald Wealth, Midnight Navy).
  - **Controls & Micro-Interactions**: Tactile buttons with active scale physics (`0.97`), sunken inputs, pill switches, and circular conic dials.
- **Defensive Security Shield**: Complete OWASP Top 10 checklist, IDOR prevention, DOMPurify HTML sanitization, strict CSP headers, and rate-limiting rules.
- **Growth & Marketing**: Machine-readable JSON-LD schemas, AEO/GEO optimization for AI search engines, and bulletproof responsive single-column HTML emails (Outlook & Gmail dark mode tested).

---

### 2. `universal-responsive` &mdash; Multi-Device Layout Engine
> **A layout architecture that reflows seamlessly from 320px mobile screens to 3840px 4K ultra-wide monitors.**

- **Container Queries (`@container`)**: Components adjust based on their parent container's allocated width, not the arbitrary viewport width. A card inside a 320px sidebar renders in compact mode even on an ultra-wide display.
- **Fluid clamp() Mathematics**: Smoothly glides font sizes, line heights, and section padding from mobile to desktop without abrupt breakpoint jumps.
- **Touch vs. Pointer Modality**: Enforces 48px tap targets and disables sticky hover pseudo-classes on touchscreen devices.
- **Notch & Hardware Insets**: Native handling of iPhone Dynamic Island and Android navigation bars with `env(safe-area-inset-*)`.
- **Zero Horizontal Overflow**: Guaranteed 0px horizontal layout spill using `overflow-x: clip`.

---

### 3. `web-perf-optimizer` &mdash; Ultra-Lightweight Speed & Core Web Vitals
> **Guaranteed 100/100 Lighthouse performance, sub-second LCP, zero CLS, and sub-50ms INP.**

- **Zero Layout Shift (CLS = 0.00)**: Mandatory dimension reservation with CSS `aspect-ratio` and font-fallback metric overrides (`size-adjust`).
- **Sub-Second LCP (< 1.2s)**: AVIF/WebP next-gen image serving, critical CSS inlining, and hero image preloading with `fetchpriority="high"`.
- **Main-Thread Relief (INP < 50ms)**: Long-task chunking using `scheduler.yield()`, passive scroll event listeners, and virtualized lists.
- **CSS Containment**: Uses `content-visibility: auto` to skip rendering off-screen sections until the user scrolls them into view.

---

### 4. `conversion-copywriting` &mdash; Enterprise-Grade Marketing Copy
> **Persuasive, authoritative marketing prose that closes enterprise deals and sounds unmistakably human.**

- **The Anti-AI Human Voice Engine**: Permanently bans generic AI tropes (*"In today's fast-paced world"*, *"unlock your potential"*, *"delve"*, *"game-changer"*, *"testament to"*).
- **The Specificity Equation**: Replaces vague corporate puffery with concrete mechanisms, measurable numbers, and time constraints.
- **Cadence & Rhythm**: Breaks monotone AI syntax by alternating punchy 3-word statements with detailed technical explanations.
- **Conversion Blueprints**: Complete copy architectures for SaaS landing pages, B2B proposals, 4-sentence cold emails to executives, and objection-annihilating pricing FAQs.

---

## 🎯 Interactive Usage Recipes

Once installed, your AI agent automatically activates these skills based on your natural language requests:

### Example 1: Build a Modern Tactile Dashboard
```text
"Create a modern financial analytics dashboard using the evankristanto skill.
Use an emerald-green theme with asymmetrical bento cards, circular sleep/volume dials,
and ensure the layout is anti-slop with Lucide icons."
```

### Example 2: Optimize a Prompt for Token Economy
```text
"Use evankristanto prompt optimization to compress this 400-word prompt into a high-density,
schema-driven prompt that saves tokens and eliminates conversational filler."
```

### Example 3: Full Multi-Device Responsive Refactor
```text
"Apply universal-responsive to this landing page. Convert the pricing grid to use
container queries, replace fixed font sizes with clamp() fluid math, and ensure 48px
tap targets on mobile."
```

### Example 4: Core Web Vitals Performance Audit
```text
"Audit this Next.js page using web-perf-optimizer. Fix our LCP, eliminate layout shifts (CLS),
and implement content-visibility for our heavy table components."
```

### Example 5: Enterprise Landing Page Copy
```text
"Write the hero section and value proposition for our enterprise database monitoring tool
using conversion-copywriting. Make it sound like a confident senior engineer speaking to a CTO,
with zero AI buzzwords."
```

---

## 📁 Repository Structure

```text
vanzee-skills/
├── skills/
│   ├── evankristanto/
│   │   ├── SKILL.md
│   │   └── references/
│   │       ├── prompt-optimization.md
│   │       ├── ui-design-tokens.md
│   │       ├── security-hardening.md
│   │       └── marketing-seo-email.md
│   ├── universal-responsive/
│   │   ├── SKILL.md
│   │   └── references/
│   │       └── responsive-patterns.md
│   ├── web-perf-optimizer/
│   │   ├── SKILL.md
│   │   └── references/
│   │       └── performance-audit-checklist.md
│   └── conversion-copywriting/
│       ├── SKILL.md
│       └── references/
│           ├── anti-ai-voice-engine.md
│           ├── landing-page-blueprints.md
│           └── b2b-sales-and-pitches.md
├── install.ps1
├── install.sh
├── LICENSE
└── README.md
```

---

## 🤝 Contributing

Contributions, feature requests, and new aesthetic archetypes are welcome!
1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingSkill`)
3. Commit your Changes (`git commit -m 'feat: add new tactile micro-interaction'`)
4. Push to the Branch (`git push origin feature/AmazingSkill`)
5. Open a Pull Request

---

## 📄 License

Distributed under the **MIT License**. See [`LICENSE`](./LICENSE) for more information.

Developed with passion by **[Evan Kristanto](https://github.com/EVANKRISTANTO)**.
