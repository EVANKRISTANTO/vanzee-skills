---
name: web-perf-optimizer
description: >-
  Ultra-lightweight website performance optimization skill across all devices: achieve 100/100
  Lighthouse scores, sub-second LCP, zero CLS (Cumulative Layout Shift), sub-50ms INP/TBT, next-gen
  image encoding (AVIF/WebP), bundle trimming, RSC 0KB hydration, and main-thread relief.
---

# `web-perf-optimizer` &mdash; 100/100 Lighthouse & High-Performance Engineering Engine

A production-grade performance engineering runbook for shipping lightning-fast, ultra-lightweight web applications that achieve **100/100 Lighthouse scores**, load in under 1 second, and run at smooth 60–120 FPS across budget mobile devices and desktop workstations.

---

## ⚡ The 5 Core Web Vitals Benchmarks (Gold Standard)

| Metric | Target | Fatal Culprit | Immediate Engineering Fix |
|:-------|:-------|:--------------|:--------------------------|
| **LCP** (Largest Contentful Paint) | **< 1.2s** | Late-loaded hero images, un-preloaded fonts, or client-rendered hero text | Preload hero with `fetchpriority="high"`, serve AVIF/WebP, inline critical CSS, SSR hero text. |
| **TBT** (Total Blocking Time) | **< 50ms** | Client hydration of massive DOM, development runtime scheduler, or heavy JS bundles | Keep static sections as Pure RSC (0KB client JS), isolate `'use client'` to leaves, chunk tasks with `scheduler.yield()`. |
| **INP** (Interaction to Next Paint) | **< 50ms** | Long JavaScript tasks blocking the main thread on user interaction | Passive event listeners, debouncing search inputs, offloading heavy calculations to Web Workers. |
| **CLS** (Cumulative Layout Shift) | **= 0.00** | Images, ads, or embeds missing explicit dimensions; font swapping shifts | Always specify `width`, `height`, and `aspect-ratio`; match fallback font metrics with `@font-face` overrides. |
| **FCP** (First Contentful Paint) | **< 0.8s** | Slow server TTFB, render-blocking stylesheets or synchronous `<script>` tags | Edge CDN caching, critical CSS inlining, defer non-critical scripts (`async`/`defer`). |

---

## 🚨 The Golden Benchmark Rules: Production & Clean Incognito

1. **Always Audit on Production Builds**:
   Never benchmark Lighthouse on `npm run dev` or `next dev` (`localhost:3000`)! Always run:
   ```bash
   npm run build
   npm run start
   ```
2. **Always Audit in Clean Incognito Mode (`Ctrl + Shift + N`)**:
   Chrome extensions (Adblockers, password managers, devtools) inject unminified content scripts (`chrome-extension://...`) that execute on the main thread, adding **100ms–350ms of artificial Total Blocking Time (TBT)** and triggering unminified JS warnings. Running in Incognito guarantees clean zero-interference testing.

---

## 🛠️ The 5 Pillars of Performance Optimization

### Pillar 1: The 0KB Hydration Architecture (Server-Component-First)
- **RSC by Default**: Keep pages and heavy static grids (catalogs, brand lists, client showcases, testimonials) as **Pure React Server Components (RSC)**. They emit clean HTML and **0 bytes of client JavaScript**.
- **Push `'use client'` to the Leaves**: Only wrap interactive widgets (search bars, mobile menus, modal toggles) in client components. Never mark a root layout or main page with `'use client'`.

### Pillar 2: Asset Diet & Next-Gen Media
1. **Next-Gen Imagery**: Convert all images to AVIF (1st choice, ~50% smaller than JPEG) or WebP. Use `<picture>` with responsive `srcset` and `sizes`.
2. **Explicit Media Dimensions**: Never render an `<img>` or `<video>` without reserving space (`width="..." height="..." style="aspect-ratio: ...;"`).
3. **Font Hygiene**:
   - Use only `.woff2` font files.
   - Apply `font-display: swap` (or `optional` for zero CLS).
   - Match fallback font metrics (`size-adjust`, `ascent-override`, `descent-override`) to eliminate FOUT shifts.

### Pillar 3: Rendering & CSS Containment
1. **Content Visibility for Massive Offscreen Sections**:
   Apply `content-visibility: auto; contain-intrinsic-size: 0 800px;` to all sections below the fold so the browser skips layout and painting work until scrolled into view.
2. **60 FPS Animation Rule**: Only animate CSS `transform` and `opacity`. Never animate `width`, `height`, `margin`, `top`, or layout properties.
3. **Eliminate Forced Reflows**: Never read layout properties (`offsetHeight`, `getBoundingClientRect`) immediately followed by style mutations inside loops. Batch all reads first, then batch all writes.

### Pillar 4: Accessibility & Form Control Hygiene (100 A11y)
1. **WCAG AA 4.5:1 Contrast Guarantee**:
   - Never use `text-slate-500` (`#64748b`) on dark backgrounds (`#07080c`, `#0c111e`).
   - Use `text-slate-400` (`#94a3b8`) for standard body text (5.3:1) and `text-slate-300` (`#cbd5e1`) for small captions and tags (8.4:1).
2. **Accessible Form Names**:
   - Every `<input>`, `<textarea>`, and `<select>` MUST have an associated `<label htmlFor="...">` or explicit `aria-label`.

### Pillar 5: Production Bundling & Caching Directives
1. **Next.js Compiler Optimization (`next.config.js`)**:
   ```javascript
   experimental: {
     optimizePackageImports: ['lucide-react', 'date-fns', 'lodash'],
   },
   compiler: {
     removeConsole: process.env.NODE_ENV === 'production',
   }
   ```
2. **Aggressive Static Caching**:
   Set `Cache-Control: public, max-age=31536000, immutable` for all static hashed assets (JS, CSS, images, fonts).

---

## 📚 Deep-Dive References

For detailed diagnostic scripts and metric override tables, consult:
- [`references/lighthouse-100-playbook-and-dev-pitfalls.md`](file:///C:/Users/Administrator/.gemini/config/skills/web-perf-optimizer/references/lighthouse-100-playbook-and-dev-pitfalls.md) &mdash; In-depth diagnostics for eliminating 3-second TBT, fixing dev vs prod testing, contrast matrices, and `next.config.js` setups.
- [`references/performance-audit-checklist.md`](file:///C:/Users/Administrator/.gemini/config/skills/web-perf-optimizer/references/performance-audit-checklist.md) &mdash; Step-by-step checklist, CLS formulas, font swap overrides, and code snippets.
