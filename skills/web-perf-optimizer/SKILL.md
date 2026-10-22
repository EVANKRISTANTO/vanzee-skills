---
name: web-perf-optimizer
description: >-
  Ultra-lightweight website performance optimization skill across all devices: achieve 100/100
  Lighthouse scores, sub-second LCP, zero CLS (Cumulative Layout Shift), sub-50ms INP, next-gen
  image encoding (AVIF/WebP), bundle trimming, content-visibility, and main-thread relief.
---

# Web Performance & Speed Optimization Skill

A dedicated engineering runbook for shipping lightning-fast, ultra-lightweight web applications that load in under 1 second and run smoothly at 60–120 FPS on all devices, from budget mobile phones to high-end desktop workstations.

---

## The 4 Performance Pillars

### 1. Core Web Vitals Benchmarks (Gold Standard)
| Metric | Threshold | Primary Culprit | Immediate Fix |
|--------|-----------|-----------------|---------------|
| **LCP** (Largest Contentful Paint) | **< 1.2s** | Late-loaded hero images or client-rendered hero text | Preload hero with `fetchpriority="high"`, serve AVIF/WebP, inline critical CSS. |
| **INP** (Interaction to Next Paint) | **< 50ms** | Long JavaScript tasks blocking the main thread | Break long loops with `scheduler.yield()`, use passive event listeners, debounce search inputs. |
| **CLS** (Cumulative Layout Shift) | **= 0.00** | Images/ads/embeds missing explicit dimensions | Always specify `width`, `height`, and `aspect-ratio` on all media and container wrappers. |

---

## Performance Optimization Protocols

### A. Asset Diet (Zero Byte Waste)
1. **Next-Gen Imagery**: Convert all images to AVIF (1st choice, ~50% smaller than JPEG) or WebP. Use `<picture>` with responsive `srcset` and `sizes` attributes.
2. **Explicit Media Dimensions**: Never render an `<img>` or `<video>` without reserving layout space (`width="..." height="..." style="aspect-ratio: ...;"`).
3. **Font Hygiene**:
   - Use only `.woff2` font files.
   - Strip unused character ranges via unicode subsetting.
   - Always apply `font-display: swap` and match fallback font metrics (`size-adjust`) to prevent layout shifts.

### B. Rendering & CSS Containment
1. **Content Visibility**: Apply `content-visibility: auto; contain-intrinsic-size: 0 600px;` to all sections below the fold so the browser skips layout and painting work until scrolled into view.
2. **60 FPS Animation Rule**: Only animate CSS `transform` and `opacity`. Never animate `width`, `height`, `margin`, `top`, or layout properties.
3. **Passive Listeners**: Always append `{ passive: true }` to touch and wheel listeners.

### C. JavaScript Execution & Bundle Pruning
1. **Dependency Audit**:
   - Strip monolithic libraries (`moment.js`, full `lodash`, un-shaken icon bundles).
   - Use native browser APIs (`Intl`, `crypto.randomUUID()`, native ES array methods).
2. **Dynamic Code Splitting**:
   - Route-based code splitting.
   - Lazy load heavy modals, rich text editors, and chart libraries on demand (`import()` or dynamic imports).

### D. Network & Caching Directives
1. **Preconnect & DNS-Prefetch**: Preconnect to critical third-party origins (e.g. font providers, image CDNs) in `<head>`.
2. **Cache-Control**: Set `Cache-Control: public, max-age=31536000, immutable` for static hashed assets.

*Reference: See [`references/performance-audit-checklist.md`](./references/performance-audit-checklist.md) for full audit recipes, code snippets, and metric override tables.*
