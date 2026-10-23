# Lighthouse 100/100 Playbook & The Next.js Dev Mode Pitfall
> Deep-dive reference guide for `web-perf-optimizer` — Real-world diagnostics, eliminating 3-second TBT, and guaranteed 100/100 Core Web Vitals.

---

## 🚨 1. The Dev Mode Trap: Why Lighthouse Scores 50–60 on `localhost:3000`

If you run Google Lighthouse against a development server (`npm run dev` / `next dev`):
**Your performance score will almost ALWAYS drop to 50–65, even if your code is 100% optimized.**

### What Happens in `next dev`:
1. **Development Runtime Overhead**: React includes thousands of debugging invariants, hook verification checks, and the development scheduler (`scheduler.development.js`). In production, this scheduler is stripped completely.
2. **Hot Module Reloading (HMR) & WebSockets**: Next.js keeps open WebSocket channels to listen for file updates. This permanently disables Chrome's **Back/Forward Cache (bf-cache)** and causes high scripting CPU activity.
3. **No Code Minification or Tree-Shaking**: Scripts and CSS are served unminified with inline `eval()` source maps, triggering `Unminified JavaScript` and `Unminified CSS` audit penalties.
4. **Disabled HTTP Caching**: Next.js sends `Cache-Control: no-store` on every local dev request so your browser reloads changes, penalizing caching audits.

### ✅ The Golden Benchmark Rule:
> **ALWAYS test Lighthouse on the optimized production build:**
> ```bash
> npm run build
> npm run start
> # Or: npx serve out (for static export)
> ```
> Once built in production mode, `scheduler.development.js` disappears, code is minified by SWC/Terser, tree-shaking removes unused icons/libraries, and TBT typically drops from **2,900ms down to <50ms**!

---

## ⚡ 2. Eliminating Total Blocking Time (TBT < 100ms) & Main-Thread Freezes

If Total Blocking Time is high (> 300ms) even in production, follow these rules:

### A. The 0KB Hydration Rule (React Server Components First)
* **The Antipattern**: Placing `'use client'` at the top of a page (`app/page.tsx`) or wrapping massive static sections (e.g., a list of 80 partner logos or brand catalogs) inside a client component.
  - This forces React to ship JavaScript for all 80 items and hydrate them on load, blocking the CPU for 1–3 seconds!
* **The Production Fix**:
  - Keep the Page and all heavy static sections as **Pure React Server Components (RSC)**.
  - Only use `'use client'` on tiny, isolated leaf widgets (e.g., a search input, mobile hamburger toggle button, or modal dialog).
  - A server-rendered brand catalog ships **0 bytes of JavaScript** to the browser.

### B. Long Task Chunking with `scheduler.yield()`
When executing heavy data processing on the client:
```typescript
export async function yieldToMainThread() {
  if ('scheduler' in window && 'yield' in (window as any).scheduler) {
    await (window as any).scheduler.yield();
  } else {
    await new Promise((resolve) => setTimeout(resolve, 0));
  }
}
```

---

## 🎨 3. Eradicating Color Contrast Flaws in Dark Themes

Lighthouse Accessibility checks contrast strictly according to WCAG AA (Minimum **4.5:1** for regular text, **3:1** for large text `18pt+` or bold `14pt+`).

### The Common Dark Theme Failure:
Using `text-slate-500` (`#64748b`) or `text-zinc-500` (`#71717a`) over dark backgrounds (`#07080c`, `#0c111e`, `#0d1321`):
* Contrast ratio is only **~3.8:1 to 3.9:1** &rarr; **FAILS WCAG AA!**

### ✅ Safe Accessible Color Tokens:
| Background Color | Banned Failing Color | Compliant Replacement | Contrast Ratio |
|:-----------------|:---------------------|:----------------------|:---------------|
| `#07080c` / `#0c111e` | `text-slate-500` (`#64748b`) | **`text-slate-400` (`#94a3b8`)** | **5.3:1** (Passes AA) |
| `#07080c` / `#0c111e` | `text-zinc-500` (`#71717a`) | **`text-zinc-400` (`#a1a1aa`)** | **5.9:1** (Passes AA) |
| Small Text (`text-[10px]`, `text-xs`) | Muted grays (`#64748b`) | **`text-slate-300` (`#cbd5e1`)** | **8.4:1** (Passes AAA) |

---

## 🛑 4. Preventing Forced Reflows & Layout Thrashing

Forced reflow occurs when JavaScript reads geometry (`offsetHeight`, `clientWidth`, `getBoundingClientRect()`, `scrollTop`) immediately after a DOM mutation, forcing the browser to pause and recalculate the layout synchronously.

### Safe DOM Pattern:
```javascript
// ❌ VULNERABLE TO FORCED REFLOW: Read then Write inside loop
elements.forEach(el => {
  const height = el.offsetHeight; // READ
  el.style.height = (height + 10) + 'px'; // WRITE (forces synchronous reflow!)
});

// ✅ SECURE / HIGH-PERFORMANCE: Batch Reads, then Batch Writes
const heights = elements.map(el => el.offsetHeight); // Batch READs
elements.forEach((el, i) => {
  el.style.height = (heights[i] + 10) + 'px'; // Batch WRITEs
});
```

---

## 📱 5. Large DOM Virtualization & `content-visibility`

When a landing page has massive sections (e.g. 80+ clients, 100+ testimonials, height > 15,000px):
1. **Never Render All Offscreen Nodes at Full Paint Cost**:
   ```css
   .offscreen-heavy-section {
     content-visibility: auto;
     contain-intrinsic-size: 0 800px;
   }
   ```
   *Benefit*: The browser completely skips rendering, layout, and style calculations for offscreen elements until the user scrolls within 1–2 viewports of them.
2. **Images Below the Fold**:
   - Add `loading="lazy"` and `decoding="async"` to all images below the hero.
   - Never set `priority` or `loading="eager"` on below-the-fold images.

---

## ⚙️ 6. Next.js Production Configuration (`next.config.js`)

Add these compiler optimizations to eliminate package bloat:

```javascript
/** @type {import('next').NextConfig} */
const nextConfig = {
  reactStrictMode: true,
  poweredByHeader: false,
  compress: true,
  compiler: {
    removeConsole: process.env.NODE_ENV === 'production' ? { exclude: ['error'] } : false,
  },
  experimental: {
    optimizePackageImports: [
      'lucide-react',
      'date-fns',
      'lodash',
      '@radix-ui/react-icons',
    ],
  },
  images: {
    formats: ['image/avif', 'image/webp'],
    minimumCacheTTL: 31536000,
  },
};

module.exports = nextConfig;
```
