# Web Performance Optimization Checklist & Recipes

Actionable audit recipes for achieving perfect 100/100 Lighthouse scores, sub-second LCP, zero CLS, and sub-50ms INP across all mobile and low-powered devices.

---

## 1. Zero Cumulative Layout Shift (CLS = 0)

1. **Image & Video Space Reservation**:
   Never insert an image without aspect-ratio or explicit dimensions:
   ```html
   <!-- ✅ Space is pre-calculated before bytes download -->
   <img
     src="hero.avif"
     alt="Hero banner"
     width="1200"
     height="630"
     fetchpriority="high"
     decoding="async"
     style="width: 100%; height: auto; aspect-ratio: 1200 / 630;"
   />
   ```
2. **Dynamic Content & Ad Slots**:
   Reserve minimum bounding height for dynamically injected elements (banners, ads, user feeds):
   ```css
   .ad-slot, .feed-placeholder {
     min-height: 250px;
     contain: layout-inline-size;
   }
   ```
3. **Font Swapping FOUT/FOIT Prevention**:
   Match fallback font metrics using `@font-face` metric overrides:
   ```css
   @font-face {
     font-family: 'Inter Fallback';
     src: local('Arial');
     ascent-override: 90%;
     descent-override: 22%;
     line-gap-override: 0%;
     size-adjust: 107%;
   }
   ```

---

## 2. Ultra-Fast LCP (Largest Contentful Paint < 1.2s)

1. **Preload the Hero Asset**:
   Inject critical image preload directly into the `<head>`:
   ```html
   <link rel="preload" as="image" href="/hero.avif" type="image/avif" fetchpriority="high">
   ```
2. **Serve Next-Gen Formats**:
   Deliver AVIF first, WebP second, JPG/PNG only as fallback:
   ```html
   <picture>
     <source srcset="image.avif" type="image/avif">
     <source srcset="image.webp" type="image/webp">
     <img src="image.jpg" alt="Description" loading="lazy" decoding="async">
   </picture>
   ```
3. **Critical CSS Inlining**:
   Inline the CSS needed for the above-the-fold hero directly into `<style>` in `<head>`. Defer non-critical stylesheets using `media="print" onload="this.media='all'"`.

---

## 3. Interaction to Next Paint (INP < 50ms) & Main Thread Relief

1. **Chunk Long Tasks (> 50ms)**:
   Use `scheduler.yield()` or `requestIdleCallback` to prevent UI freezing during heavy processing:
   ```js
   async function processLargeDataset(items) {
     for (let i = 0; i < items.length; i++) {
       processItem(items[i]);
       if (i % 100 === 0 && 'scheduler' in window && 'yield' in scheduler) {
         await scheduler.yield(); // Lets browser paint and handle user clicks
       }
     }
   }
   ```
2. **Passive Scroll Listeners**:
   Never attach non-passive scroll/touch event listeners:
   ```js
   window.addEventListener('scroll', onScroll, { passive: true });
   window.addEventListener('touchstart', onTouch, { passive: true });
   ```
3. **Content Visibility for Off-Screen Nodes**:
   Skip rendering work for elements outside the viewport:
   ```css
   .below-fold-section {
     content-visibility: auto;
     contain-intrinsic-size: 0 800px; /* Estimates height so scrollbar doesn't jump */
   }
   ```

---

## 4. JavaScript Diet & Bundle Elimination

1. **Audit Heavy Dependencies**:
   - Replace `moment.js` (70KB) with `date-fns` (tree-shaken) or native `Intl.DateTimeFormat` (0KB).
   - Replace `lodash` (72KB) with native ES6 methods or micro-utilities (`lodash-es/pick`).
   - Replace heavy UI icon packs (importing 5MB font) with individual inline SVGs.
2. **Lazy-Load Off-Screen Components**:
   In React/Next.js/Vue, dynamic import non-critical components:
   ```tsx
   const HeavyChartModal = dynamic(() => import('@/components/HeavyChartModal'), {
     ssr: false,
     loading: () => <SkeletonCard />
   });
   ```

---

## 5. Network & Caching Directives

Deliver aggressive immutable caching for static hashed assets:
```http
# Static JS, CSS, fonts, and hashed images:
Cache-Control: public, max-age=31536000, immutable

# HTML Documents:
Cache-Control: public, max-age=0, must-revalidate
```

---

## 6. Accessibility & Form Labels (Preventing Lighthouse A11y Penalties)

1. **Every Form Control Needs a Accessible Name**:
   - Every `<input>`, `<textarea>`, and `<select>` MUST have an associated `<label>` or explicit `aria-label`:
   ```html
   <!-- Method A: Explicit htmlFor -->
   <label htmlFor="service-select" className="text-sm font-medium text-slate-200">Pilih Layanan</label>
   <select id="service-select" name="service" aria-label="Pilih Layanan">
     <option value="pengadaan">Pengadaan Alat Industri</option>
   </select>

   <!-- Method B: aria-label for compact/icon inputs -->
   <input type="text" name="search" placeholder="Cari brand..." aria-label="Cari brand dan produk" />
   ```
2. **WCAG AA 4.5:1 Contrast Guarantee on Dark Themes**:
   - Never use `text-slate-500` (`#64748b`) on `#0c111e` or `#07080c` for small text (`text-[10px]` or `text-xs`).
   - Use `text-slate-400` (`#94a3b8`) for regular text or `text-slate-300` (`#cbd5e1`) for small captions and tags.

---

## 7. The Golden Audit Mandate: Production vs Dev Benchmarking

When testing with Lighthouse:
```bash
# ❌ NEVER benchmark 'npm run dev' / 'next dev' (will report 50-60 due to scheduler.development.js & HMR)
# ✅ ALWAYS benchmark the production build:
npm run build
npm run start
```
*In production mode, tree-shaking removes unused icons, the React development scheduler is eliminated, bundles are minified, and TBT drops from 2,900ms to under 50ms.*
