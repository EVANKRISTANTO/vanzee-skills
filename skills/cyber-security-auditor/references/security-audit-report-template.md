# Professional Security Advisory & Vulnerability Report Templates
> Reference layouts for `cyber-security-auditor` — Standard Enterprise Audit Report & Social Security Advisory Card.

---

## 1. Enterprise Security Advisory Report Template (Default Output)

Use this structure when auditing codebases, PRs, or architecture designs.

```markdown
# 🛡️ SECURITY ADVISORY: [VULNERABILITY TITLE]
**Advisory Reference:** `SEC-[YYYY]-[IDENTIFIER]` | **Target:** `[Language / Framework / Component]`

---

### 1. Executive Summary & Blast Radius
* **Vulnerability Type:** `[e.g., Remote Code Execution (RCE) / SQL Injection]`
* **CWE Identifier:** `[e.g., CWE-78: OS Command Injection]`
* **OWASP Top 10:** `[e.g., A03:2021-Injection]`
* **CVSS v3.1 Base Score:** **`[Score e.g. 9.8]`** &mdash; `[CRITICAL / HIGH / MEDIUM / LOW]`
* **CVSS Vector:** `CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:H/I:H/A:H`
* **Affected Versions:** `[e.g., <= 2.4.1 / Commit ab12cd3]`
* **Patched Versions:** `[e.g., >= 2.4.2]`

> **Blast Radius Summary:**
> [2-3 sentences explaining who can trigger it, from where, and the exact business damage: e.g., "An unauthenticated remote attacker can execute arbitrary system commands on the host server via the unsanitized search query parameter, leading to full server compromise and database exposure."]

---

### 2. Technical Vulnerability Mechanics & Source-to-Sink Trace

#### Data Flow Graph:
```text
[Untrusted Source: $_GET['query'] / req.body]
         │
         ▼
[Intermediate Function / Controller]
         │  (No validation, sanitization, or type enforcement)
         ▼
[Vulnerable Sink: exec() / db.query() / unserialize()]
         │
         ▼
[High-Impact Compromise: Arbitrary Code Execution / Data Exfiltration]
```

#### Detailed Code Analysis:
* **Source:** `path/to/file.ext` line `[L12-L15]`
* **Root Cause:** [Explain why the code is unsafe, the flaw in logic or assumptions]
* **Vulnerable Code Snippet:**
```language
// [Vulnerable code highlighting the exact flaw]
```

---

### 3. Remediation & Patch Code (Drop-in Fix)

#### Secure Refactoring:
```diff
- // VULNERABLE CODE
- const result = execSync(`ffmpeg -i ${userInput} output.mp4`);
+ // SECURE REMEDIATION
+ const allowedExt = ['.mp4', '.avi', '.mov'];
+ const cleanInput = path.basename(userInput);
+ if (!allowedExt.includes(path.extname(cleanInput))) {
+     throw new Error("Invalid file format");
+ }
+ const result = execFileSync('ffmpeg', ['-i', cleanInput, 'output.mp4'], { shell: false });
```

#### Defense-in-Depth Measures:
1. **Input Hardening:** [Type validation, allowlisting, length limits]
2. **Privilege Demotion:** [Run service as non-root, drop Linux capabilities]
3. **Network Isolation:** [Egress firewall rules blocking outbound connections from workers]

---

### 4. Verification & Regression Checklist (Defensive Only)
- [ ] Verify unit test covering malicious input boundaries (e.g. `../`, semicolons, payload strings) rejects with HTTP 400.
- [ ] Confirm no regression on valid legitimate payloads.
- [ ] Verify static analysis scanner (Semgrep / SonarQube / Bandit / CodeQL) passes clean with 0 warnings.
- [ ] Ensure logs sanitize input before recording to prevent Log Injection (`CWE-117`).
```

---

## 2. Social Media Security Warning Card (IDCloudHost / Infosec Carousel Style)

When the user asks for a public security alert, carousel summary, or social-media-ready advisory (as seen in the uploaded reference image):

```markdown
### 📢 Social Security Advisory Card (Instagram / LinkedIn / X)

**Slide 1: Hero Cover (Eye-Catching Warning)**
* **Badge:** `🚨 [PLATFORM/LANGUAGE] SECURITY WARNING`
* **Headline:** `Critical Remote Code Execution Vulnerabilities.`
* **Tags:** `CVE-[YYYY]-[XXXXX]` | `CVSS 9.8 - Kritis`
* **Visual Concept:** Glowing warning badge, dark tech background, 3D language logo with subtle security shield.

**Slide 2: Apa yang Terjadi? (The Threat)**
* Tim pengembang resmi baru saja mengonfirmasi kerentanan berisiko tinggi.
* Celah ini memungkinkan penyerang mengambil alih server tanpa perlu login (*unauthenticated*).
* Celah terletak pada komponen pemrosesan data input yang gagal memvalidasi payload.

**Slide 3: Siapa yang Terdampak? (Affected Matrix)**
* Versi rentan: `vX.Y.Z` ke bawah.
* Versi aman: Segera update ke `vX.Y.(Z+1)` atau versi LTS terbaru.
* Jika masih menggunakan versi EOL (End of Life), server berisiko tinggi dieksploitasi botnet otomatis.

**Slide 4: Solusi & Langkah Pencegahan (Action Plan)**
1. **Update Runtime / Dependency**: Jalankan perintah update versi patch hari ini juga.
2. **Terapkan WAF Rule**: Blokir pola payload pada reverse proxy (Nginx / Cloudflare).
3. **Audit Hak Akses**: Pastikan proses berjalan di bawah user non-root dengan read-only filesystem.

**Caption & Hashtags:**
> "Website & server kamu pakai [Language/Platform]? Cek versinya sekarang juga! ⚠️
> Baru saja terdeteksi kerentanan kritis [CVE-ID, CVSS X.X] yang berpotensi membuat server diambil alih dari jarak jauh. 
> Simak langkah mitigasi lengkapnya di slide berikutnya 👉
> 
> #CyberSecurity #KeamananSiber #Infosec #DevSecOps #SecurityUpdate #KaryaAnakBangsa"
```
