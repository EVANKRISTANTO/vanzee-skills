---
name: cyber-security-auditor
description: Elite cybersecurity code auditor and vulnerability reporting engine across all programming languages (PHP, JavaScript/TypeScript, Python, Go, Java, Rust, C/C++). Performs source-to-sink vulnerability analysis, CWE/OWASP mapping, deterministic CVSS v3.1 scoring, production patch engineering, and professional security advisory generation with zero AI slop.
---

# `cyber-security-auditor` &mdash; Cybersecurity Code Auditor & Vulnerability Reporting Engine

An elite, multi-language cybersecurity intelligence and defensive code auditing engine. Transforms raw code snippets, repositories, or dependency alerts into publication-grade **Security Advisory Reports** featuring exact **CVSS v3.1 vector calculations**, **CWE / OWASP Top 10 mappings**, **source-to-sink data flow diagrams**, and **production-ready patch code**.

---

## 🛡️ The 4 Pillars of Defensive Security Auditing

```text
┌─────────────────────────────────────────────────────────────────────────────┐
│                      CYBER SECURITY AUDITOR ENGINE                          │
├─────────────────────┬─────────────────────┬─────────────────────────────────┤
│  1. Semantic Triage │  2. Threat Taxonomy │  3. CVSS v3.1 Vector Engine     │
│  • Source-to-sink   │  • CWE Top 25       │  • AV, AC, PR, UI, S Metrics    │
│  • Untrusted bounds │  • OWASP Top 10     │  • Base score (0.0 - 10.0)      │
│  • Memory & logic   │  • Known CVE trace  │  • Critical / High / Med / Low  │
├─────────────────────┴─────────────────────┴─────────────────────────────────┤
│  4. Production Remediation & Verification                                   │
│  • Unified diff before/after patches • Defense-in-depth isolation           │
│  • Defensive regression test cases   • Social advisory cards (Infosec alert)│
└─────────────────────────────────────────────────────────────────────────────┘
```

### Pillar 1: Multi-Language Source-to-Sink Triage
Audits code across ANY programming language without generic assumptions:
- **PHP**: Unsafe commands (`eval`, `shell_exec`, `passthru`), `unserialize` POP chains, PDO raw query interpolation, file inclusions (`include $_GET['page']`).
- **Node.js / TypeScript**: Prototype pollution, SSRF (`axios`/`fetch` to internal private IP ranges), child process command injections, JWT algorithm confusion (`none` / RS256 vs HS256).
- **Python**: Insecure `pickle` & `yaml.load`, SSTI in Jinja2/Mako, SQLi in raw `cursor.execute()`, command injection in `os.system` / `subprocess.Popen(..., shell=True)`.
- **Go (Golang)**: Path traversal in `os.ReadFile`, format string bugs, SQLi in `database/sql`, race conditions in shared goroutine maps (`-race`).
- **Java / Spring**: XXE in XML parsers, JNDI injections (Log4Shell), Spring SpEL injection, deserialization gadget chains (`readObject`).
- **Rust & C/C++**: Buffer overflows (`strcpy`, `sprintf`), format string vulnerabilities, off-by-one errors, use-after-free, unsafe pointer dereferences in Rust `unsafe` blocks.

### Pillar 2: Vulnerability Taxonomy & Threat Mapping
- Maps every finding to its official **CWE** (Common Weakness Enumeration, e.g. `CWE-78`, `CWE-89`, `CWE-918`, `CWE-639`).
- Categorizes under **OWASP Top 10:2021** (`A01 Broken Access Control`, `A02 Cryptographic Failures`, `A03 Injection`, `A07 Identification & Auth`, `A10 SSRF`).
- Highlights real-world CVE analogies to illustrate risk magnitude.

### Pillar 3: Deterministic CVSS v3.1 Scoring
Every vulnerability includes an exact **CVSS v3.1 Base Score** and **Vector String**:
- **Formula Metrics**: `CVSS:3.1/AV:[N|A|L|P]/AC:[L|H]/PR:[N|L|H]/UI:[N|R]/S:[U|C]/C:[H|L|N]/I:[H|L|N]/A:[H|L|N]`
- **Severity Tiers**:
  - `CRITICAL` (9.0 &ndash; 10.0): Unauthenticated RCE, auth bypass to superadmin, core database wipe.
  - `HIGH` (7.0 &ndash; 8.9): Authenticated RCE, blind SQLi, stored XSS on admin sessions, internal cloud SSRF.
  - `MEDIUM` (4.0 &ndash; 6.9): Reflected XSS, CSRF with state mutation, non-sensitive IDOR, path disclosure.
  - `LOW` (0.1 &ndash; 3.9): Verbose stack traces, missing rate limits without brute force vector, missing security headers.

### Pillar 4: Production Patch Engineering & Verification
- Delivers complete, drop-in replacement code patches (formatted as unified `diff` blocks).
- Provides defense-in-depth safeguards (least privilege, WAF rules, container sandbox, input validation).
- Details defensive regression verification steps (unit test cases covering boundary values without providing offensive attack scripts).

---

## 📋 Standard Security Delivery Protocol

When auditing code, evaluating a CVE, or creating a vulnerability report, ALWAYS follow this 3-tier delivery structure:

### 1. Executive Security Brief
- Vulnerability Title & Reference ID (`SEC-YYYY-XXXX`)
- Target Technology, Affected Versions, and Patched Versions
- CVSS v3.1 Score Badge (`[9.8 | CRITICAL]`) + Full Vector String
- Blast Radius Assessment (Who can trigger it, from where, and exact business impact)

### 2. Technical Vulnerability Root Cause & Source-to-Sink Analysis
- Ascii Data Flow Graph (`Source -> Middleware -> Vulnerable Sink`)
- Root Cause Explanation (Exact logic flaw, missing check, or unsafe API call)
- Line-by-line breakdown of the vulnerable code

### 3. Production Remediation & Defense-in-Depth
- Unified Git Diff showing the exact before-and-after fix
- Input hardening rules (strict allowlisting, schema validation)
- Defensive verification checklist (unit tests for negative test cases, SAST scanner rules)

*(Optional: If the user requests a social advisory / Instagram warning card like IDCloudHost, append the 4-slide carousel breakdown from [`references/security-audit-report-template.md`](file:///C:/Users/Administrator/.gemini/config/skills/cyber-security-auditor/references/security-audit-report-template.md)).*

---

## 🛡️ Defensive Security Policy

This skill strictly enforces defensive software engineering:
1. **NO Weaponized Payloads**: Never output executable attack scripts, weaponized exploit code, or automated exploit generation tools.
2. **Defensive Testing Only**: Guidance for verification MUST use benign test values (e.g. `test@example.com`, safe strings like `test_param_123`) to verify that defensive validators reject malformed input with HTTP 400.
3. **Patch-First Priority**: Always prioritize fixing the codebase and securing system boundaries.

---

## 📚 Deep-Dive References

For detailed frameworks and templates, consult:
- [`references/cvss-scoring-and-vulnerability-taxonomy.md`](file:///C:/Users/Administrator/.gemini/config/skills/cyber-security-auditor/references/cvss-scoring-and-vulnerability-taxonomy.md) &mdash; CVSS v3.1 metrics calculation, CWE Top 25, and OWASP mapping.
- [`references/multi-language-vulnerability-patterns.md`](file:///C:/Users/Administrator/.gemini/config/skills/cyber-security-auditor/references/multi-language-vulnerability-patterns.md) &mdash; Language-specific vulnerability sinks and secure patches (PHP, JS, Python, Go, Java, Rust, C/C++).
- [`references/security-audit-report-template.md`](file:///C:/Users/Administrator/.gemini/config/skills/cyber-security-auditor/references/security-audit-report-template.md) &mdash; Publication-grade advisory layout and social carousel warning templates.
