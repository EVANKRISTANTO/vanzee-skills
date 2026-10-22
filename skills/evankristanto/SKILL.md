---
name: evankristanto
description: >-
  Evan Kristanto's flagship web craft skill: high-signal token-efficient prompt engineering,
  ultra-modern anti-slop UI/UX design (dark bento, iridescent aura/mesh, sleek glassmorphism, midnight mobile),
  defensive security auditing (OWASP Top 10, sanitization, secure headers, auth hardening),
  and high-conversion SEO, AEO/GEO, and bulletproof responsive email marketing.
---

# Evan Kristanto Core Web Craft Skill

Built for developers and creators who demand **maximum token efficiency**, **award-winning modern anti-slop UI/UX**, **bulletproof defensive web security**, and **high-conversion SEO & email marketing**.

---

## Quick Routing: The 4 Core Modes

| Mode | Trigger Phrases | Action |
|------|----------------|--------|
| **1. Prompt Crafter** | *"buat prompt hemat token"*, *"optimize prompt"*, *"compress prompt"*, *"prompt engineer"* | Strip conversational fluff, convert logic to type-driven schemas, produce cache-friendly high-density prompts. |
| **2. Modern UI/UX Craft** | *"bikin web bento"*, *"modern UI"*, *"desain dashboard keren"*, *"aura gradient"*, *"dark mode aesthetic"*, *"anti slop"* | Apply Evan Kristanto's visual design systems (Bento, Aura, Midnight Mobile) with dynamic palette adaptation, tactile components (cards, buttons, dials), and anti-AI-slop rules. |
| **3. Security Shield** | *"audit security"*, *"amankan website"*, *"anti-hack"*, *"cek vuln website"*, *"harden api"* | Execute the defensive security audit: OWASP Top 10 checks, CSP headers, XSS/IDOR defense, sanitization, and rate limiting. |
| **4. Growth & Marketing** | *"bikin email marketing"*, *"seo audit"*, *"meta tags"*, *"copywriting email"*, *"schema json-ld"*, *"geo aeo"* | Produce high-converting responsive HTML emails (Outlook/Gmail safe), machine-readable JSON-LD schemas, and AI-optimized (GEO/AEO) landing page copy. |

---

## Mode 1: High-Signal, Token-Efficient Prompt Crafter

When tasked with generating or optimizing prompts:

1. **Calculate the Signal-to-Noise Ratio**:
   - Eliminate politeness markers (*"Please", "Could you kindly"*, *"I would really appreciate if"*).
   - Strip generic quality adjectives (*"ultra clean, robust, beautiful, high-performance"*). Replace with concrete functional criteria (*"sub-50ms latency, zero layout shift, strict Zod validation"*).
2. **Transform to Schema-First Structure**:
   - Represent input/output contracts as TypeScript types or JSON schemas rather than explanatory prose.
3. **Cache-Friendly Positioning**:
   - Order the prompt: `[Role & Static System Rules] -> [Schema & Boundary Types] -> [Dynamic Target Input]`.
4. **Use Explicit Deny-Lists**:
   - One line of explicit negation (*"Deny: any inline style, any any type, mock endpoints."*) saves dozens of prompt tokens and prevents model drift.

*Reference: Read [`references/prompt-optimization.md`](./references/prompt-optimization.md) for full compaction heuristics and examples.*

---

## Mode 2: Modern UI/UX Architecture & Dynamic Tactile Design

Implement web interfaces adhering to the 5 visual archetypes defined in Evan Kristanto's design references, fully adapted to prompt-specified colors and anti-slop standards:

### Dynamic Palette & Component Rules:
- **Color Adaptability**: Dynamically map the prompt's requested brand/theme color to `--primary` and compute perceptual `--bg`, `--surface`, `--border`, and `--glow` tokens.
- **The Tactile Bento Card**: 24px border radius (`rounded-2xl` / `rounded-3xl`), dual-layer elevation (`box-shadow: 0 20px 40px -15px rgba(0,0,0,0.6), inset 0 1px 0 rgba(255,255,255,0.08)`), and 1px borders (`rgba(255,255,255,0.08)`).
- **Tactile Buttons**: Pill (`rounded-full`) or 16px radius, active `scale(0.97)` physics, and accent glow shadows (`0 4px 20px -2px var(--glow)`).
- **Controls & Micro-Interactions**: Pill toggles (48x28px with 20px spring thumb translation), circular conic progress dials (`#6366F1` to `#EC4899`), avatar stacks with negative spacing, and tabular numeral metrics.

### Anti-Slop AI Design Laws:
- ❌ **No Centered 3-Column AI Clichés**: Use asymmetrical bento grids (`col-span-2` hero metric, `col-span-1` avatar/status stack, `col-span-3` feed).
- ❌ **No Emojis as UI Icons**: Always use crisp Lucide/Radix SVG icons with consistent 1.75px–2px stroke weights.
- ❌ **No Flat Grayscale**: Deep interfaces must feature subtle ambient backdrop glows, micro inner-borders, and high-contrast typographic hierarchy.

*Reference: Read [`references/ui-design-tokens.md`](./references/ui-design-tokens.md) for exact component specs and palette matrices.*

---

## Mode 3: Defensive Web Security Audit & Hacker Shield

When building or auditing a website/API against attacks:

### 1. Ingress & Injection Defense
- Validate all incoming payloads with strict schemas (`Zod`, `Valibot`, or `TypeBox`).
- Parameterize every database query (Prisma, Drizzle, Kysely, parameterized SQL).
- Sanitize HTML/rich-text rendering with `DOMPurify`. Grep and eradicate all unescaped DOM injections.

### 2. Access Control & Authorization (IDOR)
- Enforce session ownership verification at the service layer on every query:
  `WHERE id = :targetId AND user_id = :sessionUserId`.
- Never trust client-side IDs passed via headers, query strings, or body without session validation.

### 3. HTTP Security Headers Baseline
Ensure every production server/middleware returns:
- `Content-Security-Policy: default-src 'self'; frame-ancestors 'none';`
- `Strict-Transport-Security: max-age=63072000; includeSubDomains; preload`
- `X-Frame-Options: DENY`
- `X-Content-Type-Options: nosniff`
- `Referrer-Policy: strict-origin-when-cross-origin`

### 4. Session & Cookie Shield
- Cookies must always include: `HttpOnly; Secure; SameSite=Strict`.
- Prevent storing JWT access tokens in browser `localStorage`. Use rotating secure cookies or memory storage.

### 5. Rate Limiting & DoS Mitigation
- Apply IP and token-bucket rate limiting on authentication routes (max 5 attempts/min) and public APIs (max 60 req/min).
- Enforce JSON body limits (e.g. `limit: '100kb'`).

*Reference: Read [`references/security-hardening.md`](./references/security-hardening.md) for the complete OWASP audit checklist.*

---

## Mode 4: Growth, SEO & Email Engineering

When building for marketing, search discovery, and user retention:

1. **AEO / GEO & Semantic SEO**:
   - Provide direct 35-word factual answer blocks beneath headings for AI search engine scrapers (Perplexity, ChatGPT).
   - Inject structured JSON-LD schemas (`SoftwareApplication`, `Organization`, `FAQPage`, `Product`).
   - Title tag formula: `[Primary Keyword] — [Compelling Value Prop] | [Brand]` (Max 60 chars).
2. **Token-Efficient Responsive Email Marketing**:
   - Deliver single-column HTML email layouts tested for Outlook, Gmail, and Apple Mail dark mode.
   - Maintain 60/40 text-to-image ratio and enforce DMARC/SPF compliance to prevent spam folder relegation.
   - Employ single-CTA hook-story-offer copy formats.

*Reference: Read [`references/marketing-seo-email.md`](./references/marketing-seo-email.md) for full email templates and schema examples.*
