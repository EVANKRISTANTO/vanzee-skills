# Universal Responsive Patterns & Formulas

Comprehensive code patterns across Mobile, Tablet, Desktop, Foldable, and Ultra-Wide displays.

---

## 1. Container Queries: Component-Driven Responsiveness

Never rely exclusively on viewport media queries (`@media (min-width: 768px)`). A card inside a 300px sidebar needs a mobile layout even on a 4K display.

### Setup Container Context:
```css
.card-container {
  container-type: inline-size;
  container-name: card;
}
```

### Component Adaptive Styles:
```css
/* Default: Stacked Mobile Appearance */
.bento-card {
  display: flex;
  flex-direction: column;
  gap: 16px;
  padding: 16px;
}

/* When the card container has at least 420px of space */
@container card (min-width: 420px) {
  .bento-card {
    display: grid;
    grid-template-columns: 120px 1fr;
    align-items: center;
    padding: 24px;
    gap: 20px;
  }
}

/* When the card container has at least 680px of space */
@container card (min-width: 680px) {
  .bento-card {
    grid-template-columns: 180px 1fr auto;
    padding: 32px;
  }
}
```

---

## 2. Fluid Typography & Spacing without Breakpoint Jumps

Use mathematical `clamp()` functions to smoothly scale typography and gaps between 360px and 1440px viewport widths without sudden jarring jumps:

```css
:root {
  /* Fluid Body Text: 15px at 360px -> 17px at 1440px */
  --font-body: clamp(0.9375rem, 0.8958rem + 0.1852vw, 1.0625rem);

  /* Fluid H1: 28px at 360px -> 54px at 1440px */
  --font-h1: clamp(1.75rem, 1.2083rem + 2.4074vw, 3.375rem);

  /* Fluid H2: 22px at 360px -> 36px at 1440px */
  --font-h2: clamp(1.375rem, 1.0833rem + 1.2963vw, 2.25rem);

  /* Fluid Section Spacing: 32px at 360px -> 80px at 1440px */
  --section-gap: clamp(2rem, 1rem + 4.4444vw, 5rem);

  /* Fluid Card Padding: 16px at 360px -> 32px at 1440px */
  --card-padding: clamp(1rem, 0.6667rem + 1.4815vw, 2rem);
}
```

---

## 3. Safe Area Insets & Modern Viewport Units

Mobile devices with notches, Dynamic Island, and home indicator bars require dynamic viewport units and safe-area insets.

### Dynamic Viewport Units:
- Avoid `100vh` on mobile (causes jump when address bar shows/hides).
- Use `100dvh` (dynamic) or `min-height: 100svh` for full-screen hero elements.

### Notch & Home Bar Inset Handling:
```css
/* Bottom Navigation or Floating Bar */
.bottom-nav {
  position: fixed;
  bottom: 0;
  left: 0;
  right: 0;
  padding-bottom: max(16px, env(safe-area-inset-bottom));
  padding-left: max(16px, env(safe-area-inset-left));
  padding-right: max(16px, env(safe-area-inset-right));
}

/* Header with Notch Accommodation */
.site-header {
  padding-top: max(16px, env(safe-area-inset-top));
}
```

---

## 4. Input Modality: Pointer vs Touch Adaptation

Avoid "sticky hover" bugs on touch devices where hover states remain stuck after tapping:

```css
/* Hover styles ONLY for mice and trackpads */
@media (hover: hover) and (pointer: fine) {
  .interactive-card:hover {
    transform: translateY(-3px);
    border-color: rgba(255, 255, 255, 0.2);
  }
}

/* Active tap feedback for mobile & touch */
@media (pointer: coarse) {
  .interactive-card:active {
    transform: scale(0.98);
    transition: transform 80ms ease;
  }

  /* Enforce 48px touch target ergonomics */
  button, a, input, select, [role="button"] {
    min-height: 48px;
    min-width: 48px;
  }
}
```

---

## 5. Ultra-Wide & High-DPI Display Framing

On 2560px (QHD) and 3840px (4K) monitors, unconstrained content stretches into illegible single-line ribbons.

```css
.site-wrapper {
  /* Prevent horizontal overflow bugs without killing position: sticky */
  overflow-x: clip;
  width: 100%;
}

.content-container {
  width: 100%;
  max-width: 1440px; /* Optimal bounding width */
  margin-inline: auto;
  padding-inline: clamp(16px, 4vw, 48px);
}
```
