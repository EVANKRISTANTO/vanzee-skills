# Rule: Anti-Slop Web Craft, UI/UX & Defensive Architecture

Enforce on all frontend, UI/UX, responsive layout, performance, and web security tasks.

---

## 1. Aesthetic & UI/UX Non-Negotiables
- **Bento Grid Architecture**: Prefer asymmetric, multi-span grid layouts over identical repeating cards. Use 24px border radiuses (`rounded-3xl` / `1.5rem`) for cards and 12px for interactive controls.
- **Dual-Depth Elevation**: Combine subtle borders (`border border-white/10` or `oklch(1 0 0 / 0.1)`) with soft, multi-layer diffuse drop shadows. Never use flat 1px harsh black borders.
- **Color Space**: Use perceptual OKLCH color spaces. Ensure text contrast satisfies WCAG AA minimums (4.5:1 for body copy, 3:1 for large display headers and active UI components).
- **Tactile Micro-Interactions**: Use CSS spring physics (`cubic-bezier(0.16, 1, 0.3, 1)`) for hover and active states. Interactive buttons must have sunken active states (`active:scale-[0.98]`).
- **Typography Discipline**: Pair expressive display serifs or geometric grotesks with high-legibility body type. Always enable `font-feature-settings: "cv02", "cv03", "cv04", "cv11"` and tabular figures (`tabular-nums`) for numerical data.

## 2. Universal Multi-Device Layout Rules
- **Component-First Container Queries**: When writing responsive components, default to `@container` queries instead of viewport-level `@media` queries.
- **Fluid Mathematics**: Use `clamp()` for typography and spacing between 360px and 1440px viewports (e.g., `clamp(1.125rem, 0.95rem + 0.8vw, 1.75rem)`).
- **Touch vs. Pointer Modality**: Enforce minimum 48x48px tap targets for mobile touchscreens. Guard `:hover` pseudo-classes behind `@media (hover: hover) and (pointer: fine)`.
- **Zero Horizontal Overflow**: Apply `overflow-x: clip` on root layout containers to eliminate unwanted horizontal scrollbars across all screen sizes.
- **Hardware Notch & Dynamic Island**: Incorporate `env(safe-area-inset-*)` on fixed navigation bars, floating action buttons, and mobile bottom sheets.

## 3. Web Performance & Core Web Vitals (Lighthouse 100)
- **Zero Cumulative Layout Shift (CLS = 0.00)**: Every `<img>`, `<video>`, and canvas must declare explicit `width`, `height`, or CSS `aspect-ratio`. Use `size-adjust` on custom fonts to prevent layout pop.
- **Sub-Second LCP (< 1.2s)**: Preload above-the-fold hero images with `fetchpriority="high"`. Serve modern AVIF/WebP formats. Defer non-critical third-party scripts.
- **Sub-50ms INP (Interaction to Next Paint)**: Break up long JavaScript tasks using `scheduler.yield()` or microtask chunking. Use passive event listeners (`{ passive: true }`) on scroll and touch handlers.
- **CSS Containment**: Apply `content-visibility: auto` with `contain-intrinsic-size` on long lists and below-the-fold sections.

## 4. Defensive Security Shield
- **Sanitization**: Never render unsanitized user content into innerHTML. Always pass through `DOMPurify.sanitize()`.
- **Database Safety**: Never concatenate user input into SQL or NoSQL queries. Enforce parameterized queries or ORM schema-safe builders.
- **Security Headers**: Always configure `Content-Security-Policy`, `X-Content-Type-Options: nosniff`, `X-Frame-Options: DENY`, and `Strict-Transport-Security`.
- **Authentication & Authorization**: Verify session ownership and tenant ID on every protected data access (prevent Insecure Direct Object References - IDOR).
