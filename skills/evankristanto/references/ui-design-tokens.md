# Modern UI/UX Design System & Component Craft (Evan Kristanto Standard)

High-craft tactile visual architecture. Combines the geometry of modern Bento grids, Iridescent Aura, and Midnight Mobile with dynamic color adaptability and strict Anti-AI-Slop standards.

---

## 1. Dynamic Color Adaptation Engine

Never hardcode a single fixed color palette when a prompt specifies a brand or industry. Instead, derive semantic tokens from the user's prompt while keeping the high-end tactile tactile geometry (24px curves, subtle borders, deep elevations).

### Palette Adaptor Matrix:
| Prompt Theme / Vibe | Background (`--bg`) | Surface Card (`--surface`) | Border (`--border`) | Primary Accent (`--primary`) | Glow / Ambient (`--glow`) |
|---------------------|---------------------|---------------------------|---------------------|------------------------------|----------------------------|
| **Cyber Dark / Bento (Default)** | `#090A0F` | `#15171F` / `#1C1E28` | `rgba(255,255,255,0.08)` | Electric Coral (`#FF5B61`) | `rgba(255, 91, 97, 0.35)` |
| **Fintech / Neon Growth** | `#080B11` | `#111622` / `#171E2E` | `rgba(0, 240, 255, 0.12)` | Neon Cyan (`#00F0FF`) | `rgba(0, 240, 255, 0.25)` |
| **Sunset Aura / Creative Studio** | `#0D0E14` | `#181924` (or frosted `rgba(255,255,255,0.04)`) | `rgba(255,255,255,0.1)` | Vivid Violet (`#8B5CF6`) & Amber (`#F59E0B`) | `rgba(139, 92, 246, 0.3)` |
| **Clean Light / Porcelain Luxe** | `#F8F9FA` | `#FFFFFF` | `rgba(0, 0, 0, 0.06)` | Deep Indigo (`#4338CA`) | `0 12px 32px -4px rgba(0,0,0,0.06)` |
| **Emerald Wealth / Eco** | `#060D0A` | `#0E1B15` / `#14261E` | `rgba(16, 185, 129, 0.15)` | Spring Emerald (`#10B981`) | `rgba(16, 185, 129, 0.3)` |
| **Midnight Navy / Mobile App** | `#0A0D18` | `#141A2E` / `#1B243E` | `rgba(255,255,255,0.07)` | Indigo to Pink Conic (`#6366F1` -> `#EC4899`) | `rgba(99, 102, 241, 0.3)` |

*Rule: When the user specifies any brand color (e.g., "warna oranye jeruk" or "brand hijau tosca"), map that color to `--primary` and generate its complimentary surface, border, and glow tokens using OKLCH color space for perceptually balanced contrast.*

---

## 2. Component Design Specifications

### A. The Tactile Bento Card
- **Border Radius**: `24px` (`rounded-2xl` or `rounded-3xl` for larger cards).
- **Surface Depth**: Dual-layer shadow:
  `box-shadow: 0 20px 40px -15px rgba(0, 0, 0, 0.6), inset 0 1px 0 rgba(255, 255, 255, 0.08);`
- **Border**: `1px solid var(--border)`.
- **Hover State**: Lift by `translate-y-[-2px]` with border opacity shifting to `0.18` and subtle glow intensification over `200ms cubic-bezier(0.16, 1, 0.3, 1)`.

### B. Tactile Buttons & Controls
1. **Primary Action Button**:
   - Shape: Pill (`rounded-full`) or smooth rounded rectangle (`rounded-xl` / `16px`).
   - Fill: Solid `--primary` with contrasting crisp text (WCAG AAA).
   - Glow: `box-shadow: 0 4px 20px -2px var(--glow)`.
   - Active: `scale(0.97)` with `transition: transform 120ms ease`.
2. **Secondary / Surface Button**:
   - Fill: `var(--surface)` with `1px solid var(--border)`.
   - Hover: Invert background slightly (`var(--surface-hover)`) and sharpen border.
3. **Ghost Icon Button**:
   - `40px x 40px` circular or rounded square target.
   - Transparent background, `text-slate-400 hover:text-white hover:bg-white/5`.

### C. Form Inputs & Search Bars
- **Container**: `height: 48px`, `rounded-xl` or `rounded-full`.
- **Surface**: Inverted sunken surface (`#0D0E13` on dark mode, `#F1F3F5` on light mode).
- **Focus Ring**: Never use default browser outlines. Use an offset glow ring:
  `ring-2 ring-primary/40 border-primary transition-all duration-150`.
- **Icon Prefix**: 16px-18px inline SVG with muted opacity `0.5`, shifting to `1.0` on container focus.

### D. Switches & Interactive Controls
- **Toggle Switch**:
  - Track: `width: 48px`, `height: 28px`, `rounded-full`, dark background `#242838`.
  - Thumb: `22px x 22px` circle with subtle drop shadow, translating `20px` when active.
  - Active Track: Glows with `--primary` fill.
- **Radial Dial / Circular Gauges**:
  - SVG circle with `stroke-dasharray` and `stroke-dashoffset`.
  - Gradient stroke (`conic-gradient` or multi-stop SVG `linearGradient`).
  - Centered bold metric: `tabular-nums tracking-tight font-semibold`.

### E. Avatars & Data Pills
- **Avatar Stacks**: `-space-x-3` with `ring-2 ring-[var(--surface)]` to prevent silhouette clash.
- **Metric Pill Badges**:
  - `padding: 4px 10px`, `rounded-full`, `text-xs font-medium`.
  - Background: `rgba(accent, 0.12)`, Text: `var(--primary)`.
  - Optional: 6px pulsing indicator dot (`animate-pulse`).

---

## 3. Strict Anti-Slop AI Design Laws

1. **Eradicate the 3-Column Box Cliché**:
   - Do NOT default to 3 identical feature cards with an icon on top, a 2-word title, and 2 lines of generic text.
   - Use asymmetrical bento grids: Hero metric card (`col-span-2 row-span-2`), activity feed (`col-span-1 row-span-2`), quick toggle row (`col-span-3`).
2. **No Emojis as UI Icons**:
   - Never use `🚀`, `💡`, `🔥` as functional interface icons.
   - Always use clean, consistent Lucide or Radix SVG icons with consistent `stroke-width: 1.75px` or `2px`.
3. **Real Typography Hierarchy**:
   - Avoid generic system fonts without letter spacing adjustments.
   - Display/Hero: `letter-spacing: -0.03em; font-weight: 700`.
   - Small Labels: `letter-spacing: 0.05em; text-transform: uppercase; font-size: 0.75rem; font-weight: 600`.
   - Financial & Numbers: `font-variant-numeric: tabular-nums`.
4. **Organic Atmosphere over Flatness**:
   - Deep interfaces need atmosphere: subtle ambient backdrop blur, low-opacity radial gradients behind cards, and micro inner-borders (`inset 0 1px 0 rgba(255,255,255,0.08)`).
