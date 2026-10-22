---
name: universal-responsive
description: >-
  Universal multi-device layout engine: comprehensive responsive architecture across mobile,
  tablet, desktop, foldable, and ultra-wide screens. Covers container queries (@container),
  fluid clamp() typography/spacing, safe-area insets, touch vs pointer adaptation, and zero-break layouts.
---

# Universal Responsive Layout Engine

The evolution of modern multi-device layout architecture. A website is not just a desktop canvas shrunk to a mobile phone; it is an intelligent, self-adapting surface that reflows across every form factor: **Mobile Portrait (320px–430px)**, **Foldable Devices**, **Tablets (768px–1024px)**, **Standard Laptops (1280px–1440px)**, and **Ultra-Wide / 4K Monitors (1920px–3840px)**.

---

## The 6 Universal Laws of Responsive Layout

### 1. Container Queries Over Viewport Coupling
Do not design components coupled to the total browser window width.
- Use `@container` so cards, forms, and charts adjust based on the space allocated to their parent column.
- A card placed in a 320px sidebar column must automatically adopt its compact stacked variant even when viewed on a 32-inch 4K monitor.

### 2. Fluidity via `clamp()` Math (Zero Breakpoint Jumps)
Avoid jarring abrupt font-size and padding jumps when crossing arbitrary pixel thresholds.
- Typography: Use `font-size: clamp(min, preferred, max)` to smoothly glide between mobile and desktop dimensions.
- Section Gaps: Scale spacing dynamically from `clamp(24px, 5vw, 80px)`.

### 3. Modality Awareness (Touch vs Pointer Ergonomics)
Never assume every user has a precision mouse:
- **Touch Screen / Coarse Pointer**:
  - Enforce minimum `48px x 48px` tap targets with minimum `8px` separation.
  - Disable `:hover` pseudo-classes using `@media (hover: hover)` to eliminate sticky touch artifacts.
  - Provide immediate `:active` scale/opacity feedback.
- **Mouse / Fine Pointer**:
  - Enable subtle hover elevations and tooltips.

### 4. Safe-Area Inset & Modern Viewport Resilience
Prevent content from being clipped by hardware cutouts:
- Use `100dvh` or `min-height: 100svh` instead of buggy `100vh`.
- Inset floating footers and sticky bars using `max(16px, env(safe-area-inset-bottom))` for iPhone home bars and Android gesture pills.
- Account for camera cutouts using `env(safe-area-inset-top)`.

### 5. Asymmetrical Reflow & Content Prioritization
When screen real estate constrains:
- Re-order with intent: Critical actions (primary CTA, active status, search) stay pinned or surface top. Secondary metrics collapse into swipeable carousels or tabs.
- Tables: Convert wide tabular data to stacked definition cards on narrow viewports (`< 640px`) rather than letting the entire page overflow horizontally.

### 6. Zero Horizontal Overflow (`overflow-x: clip`)
A page that scrolls horizontally by even 1px on mobile is broken.
- Wrap the page in `overflow-x: clip` (which preserves `position: sticky`, unlike `overflow-x: hidden`).
- Set `max-width: 100%` and `box-sizing: border-box` on all images, videos, canvas, and containers.
- Bound ultra-wide screens with `max-width: 1440px; margin-inline: auto` to prevent 3000px line lengths.

---

## Responsive Breakpoint Reference Hierarchy

```text
[320px - 479px]  Mobile Small: Single-column stacked, 16px horizontal gutter, 48px tap targets.
[480px - 767px]  Mobile Large & Phablet: 2-column micro-grids, inline search bars.
[768px - 1023px] Tablet & Foldable Unfolded: Asymmetrical 2-column bento, collapsible sidebars.
[1024px - 1439px] Desktop Standard: Full multi-column dashboard, sticky navigation panels.
[1440px+]        Ultra-Wide & 4K: Constrained content frame (max-w-7xl), centered canvas.
```

*Reference: See [`references/responsive-patterns.md`](./references/responsive-patterns.md) for full clamp formulas and container query boilerplate.*
