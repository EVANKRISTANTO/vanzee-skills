# Marketing, SEO & Email Engineering (Evan Kristanto Standard)

High-intent customer acquisition engineering: modern Search / Answer Engine Optimization (SEO/GEO/AEO) paired with bulletproof, token-efficient email marketing.

---

## 1. Modern SEO & Generative Engine Optimization (GEO/AEO)

Search engines in 2026 evaluate both traditional search crawlers and LLM retrieval engines (Perplexity, ChatGPT Search, Gemini).

### A. Title & Meta Architecture (High CTR)
- **Title Tag Formula**: `[Primary Intent Keyword] — [Compelling Value Prop] | [Brand]`
  - *Example*: `Zero-Fee Crypto Swaps — Instant On-Chain Liquidity | Nexus`
  - Strict limit: 55–60 characters.
- **Meta Description**: 140–155 characters with an embedded CTA and active verb:
  `"Swap crypto across 12 chains with 0% protocol fees. Compare live DEX rates and settle in sub-second speed. Start trading now."`
- **Social Tags**: OpenGraph (`og:title`, `og:description`, `og:image: 1200x630`) + `twitter:card: summary_large_image`.

### B. Machine-Readable Schema (JSON-LD)
Always inject valid JSON-LD schemas in `<head>` for rich snippets and AI indexing:
```html
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "SoftwareApplication",
  "name": "Nexus Terminal",
  "operatingSystem": "Web",
  "applicationCategory": "FinanceApplication",
  "offers": {
    "@type": "Offer",
    "price": "0",
    "priceCurrency": "USD"
  },
  "aggregateRating": {
    "@type": "AggregateRating",
    "ratingValue": "4.9",
    "ratingCount": "1280"
  }
}
</script>
```

### C. AEO / GEO Optimization Rules (Ranking in AI Search)
1. **Direct Answer Block**: Place a direct, factual answer (30–45 words) right beneath `<h1>` or `<h2>` headings before expanding into details.
2. **Entity-Dense Tables**: LLMs prioritize markdown and HTML tables when scraping comparison data.
3. **Canonical Authority**: Always specify `<link rel="canonical" href="https://example.com/canonical-url">` to prevent duplicate dilution.

---

## 2. High-Conversion, Bulletproof Email Marketing

Standard HTML fails across desktop Outlook, Gmail mobile, and Apple Mail. Every marketing email must follow strict email client rendering rules.

### A. Deliverability & Anti-Spam Protocol
- **Spam Filter Triggers**: Avoid ALL-CAPS subject lines, fake urgency ("ACT NOW OR DIE"), excessive exclamation marks (`!!!`), and all-image emails without text.
- **Text-to-Image Ratio**: Minimum 60% live HTML text, maximum 40% imagery.
- **Headers & Records**: Ensure SPF, DKIM, and DMARC (`v=DMARC1; p=reject`) are aligned on the sending domain. Include one-click unsubscribe headers (`List-Unsubscribe: <mailto:...>`).

### B. Responsive Single-Column HTML Email Template
Token-efficient, Outlook-compatible, mobile-responsive layout:

```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>{{subject}}</title>
  <style>
    body { margin: 0; padding: 0; background-color: #0A0B10; font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif; color: #FFFFFF; }
    table { border-spacing: 0; }
    td { padding: 0; }
    .wrapper { width: 100%; table-layout: fixed; background-color: #0A0B10; padding: 40px 0; }
    .container { max-width: 600px; margin: 0 auto; background-color: #15171F; border-radius: 16px; border: 1px solid rgba(255,255,255,0.08); overflow: hidden; }
    .content { padding: 32px; }
    .btn { display: inline-block; background-color: #FF5B61; color: #FFFFFF; text-decoration: none; padding: 14px 28px; border-radius: 9999px; font-weight: 600; font-size: 15px; }
    .footer { padding: 24px 32px; text-align: center; font-size: 12px; color: #71717A; }
    @media only screen and (max-width: 600px) {
      .container { width: 92% !important; }
      .content { padding: 24px !important; }
    }
  </style>
</head>
<body>
  <div class="wrapper">
    <table role="presentation" class="container" align="center">
      <tr>
        <td class="content">
          <p style="text-transform: uppercase; letter-spacing: 1.5px; font-size: 11px; color: #FF5B61; font-weight: 700; margin: 0 0 12px 0;">New Feature Release</p>
          <h1 style="font-size: 24px; line-height: 1.3; font-weight: 700; margin: 0 0 16px 0; color: #FFFFFF;">Streamline Your Web Workflow</h1>
          <p style="font-size: 15px; line-height: 1.6; color: #A1A1AA; margin: 0 0 24px 0;">Experience instant asset compression and zero-friction deployment with our updated engine.</p>
          <table role="presentation" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td align="center" style="border-radius: 9999px;" bgcolor="#FF5B61">
                <a href="{{cta_url}}" class="btn">Explore the Dashboard &rarr;</a>
              </td>
            </tr>
          </table>
        </td>
      </tr>
      <tr>
        <td class="footer">
          You received this email because you subscribed to product updates.<br>
          <a href="{{unsubscribe_url}}" style="color: #A1A1AA; text-decoration: underline;">Unsubscribe</a> &bull; <a href="{{preferences_url}}" style="color: #A1A1AA; text-decoration: underline;">Preferences</a>
        </td>
      </tr>
    </table>
  </div>
</body>
</html>
```

### C. Copywriting Formats (Token-Efficient High CTR)
1. **Hook**: Direct benefit or curiosity gap in sentence 1 (No "I hope this email finds you well").
2. **Proof / Detail**: 2-3 bullet points with bold keywords.
3. **Single Action (1 Primary CTA)**: Never offer 3 competing buttons. Direct the reader to one single, clear next step.
