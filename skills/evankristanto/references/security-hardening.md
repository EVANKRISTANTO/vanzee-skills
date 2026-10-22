# Defensive Web Security Hardening & Audit Runbook

Created by Evan Kristanto for zero-compromise website defense.

---

## 1. Top Attack Vectors & Defenses (OWASP Hardening)

### A. Injection Attacks (SQLi, NoSQLi, Command Injection)
- **Rule**: Never interpolate raw user input into query strings or execution commands.
- **Backend Standard**:
  ```ts
  // ❌ Vulnerable (SQL Injection)
  const user = await db.query(`SELECT * FROM users WHERE email = '${req.body.email}'`);

  // ✅ Secure (Parameterized Query via Prisma/Kysely/Drizzle)
  const user = await db.user.findUnique({
    where: { email: validatedEmail }
  });
  ```

### B. Broken Access Control & IDOR (Insecure Direct Object Reference)
- **Rule**: Never trust client-supplied IDs without validating ownership against the authenticated session.
- **Audit Check**:
  ```ts
  // ❌ Vulnerable: Any authenticated user can modify any document with docId
  app.post('/api/documents/:id', async (req, res) => { ... });

  // ✅ Secure: Strict tenant/user scoping
  app.post('/api/documents/:id', requireAuth, async (req, res) => {
    const doc = await db.document.findFirst({
      where: { id: req.params.id, ownerId: req.user.id }
    });
    if (!doc) return res.status(404).json({ error: "Not found or unauthorized" });
  });
  ```

### C. Cross-Site Scripting (XSS) & DOM Injection
- **Rule**: Zero unescaped HTML injection. React/Vue/Svelte escape by default; avoid dangerous bypasses.
- **Audit Check**:
  - Grep for `dangerouslySetInnerHTML`, `innerHTML`, `v-html`, `document.write`.
  - If markdown or rich text must be rendered, run it through `DOMPurify` with strict tag allow-lists.

---

## 2. Mandatory HTTP Security Headers

Apply these headers on every production response (via Next.js config, Cloudflare Workers, Nginx, or Express Helmet):

```http
Content-Security-Policy: default-src 'self'; script-src 'self' 'nonce-{RANDOM}'; style-src 'self' 'unsafe-inline'; img-src 'self' data: https:; font-src 'self' https:; frame-ancestors 'none'; object-src 'none'; base-uri 'self';
Strict-Transport-Security: max-age=63072000; includeSubDomains; preload
X-Frame-Options: DENY
X-Content-Type-Options: nosniff
Referrer-Policy: strict-origin-when-cross-origin
Permissions-Policy: camera=(), microphone=(), geolocation=(), browsing-topics=()
```

---

## 3. Cookie & Session Security Protocol

1. **Flags**:
   - `HttpOnly = true` (Blocks JavaScript XSS credential theft)
   - `Secure = true` (Transmitted only over HTTPS)
   - `SameSite = Strict` (or `Lax` for external OAuth callbacks)
2. **Token Storage**:
   - Never store sensitive JWTs or session secrets in `localStorage` or `sessionStorage` (vulnerable to XSS).
   - Use rotating refresh tokens with server-side revocation lists.

---

## 4. Rate Limiting & DoS Shield

1. **Ingress Throttling**:
   - Auth endpoints (`/login`, `/signup`, `/reset-password`): Max 5 requests per minute per IP.
   - Public APIs: Max 60 requests per minute per token/IP using sliding window rate limiter (Upstash Redis or memory cache).
2. **Payload Protection**:
   - Set maximum body parser limits: `express.json({ limit: '100kb' })`.
   - Timeout long-running queries (> 5000ms).

---

## 5. Security Audit Checklist (Run Before Ship)

- [ ] All inputs validated at the boundary with a strict schema (e.g. Zod).
- [ ] No secrets, private API keys, or staging credentials committed to Git or bundled in client JS.
- [ ] `X-Powered-By` header stripped.
- [ ] CORS is restricted to exact trusted domains (no wildcard `*` with `Access-Control-Allow-Credentials: true`).
- [ ] Dependencies scanned with `npm audit` or `snyk` (0 critical/high vulnerabilities).
- [ ] Error messages in production do not reveal database schemas, file paths, or stack traces.
