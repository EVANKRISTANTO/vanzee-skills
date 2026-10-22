# Corporate Legal Architecture, Licensing (OSS-RBA) & Compliance Runbook

The complete legal and regulatory navigation guide for founders, executives, and enterprise builders. Covers corporate entity selection, risk-based licensing, intellectual property, tax structuring, and essential legal governance contracts.

---

## 1. Corporate Entity Matrix (Badan Usaha)

Selecting the right corporate vehicle dictates legal liability, tax liability, fundraising readiness, and operational credibility.

```text
┌──────────────────┬──────────────────────┬──────────────────────┬──────────────────────┐
│ Entity Type      │ PT Perorangan (UUCK) │ PT Biasa (Perseroan) │ CV (Komanditer)      │
├──────────────────┼──────────────────────┼──────────────────────┼──────────────────────┤
│ Founders Req.    │ 1 Orang (WNI)        │ Min. 2 Orang / Badan │ Min. 2 Orang (WNI)   │
│ Capital Req.     │ Bebas (Modal Mikro)  │ Bebas (Umum min. 50jt│ Bebas tanpa minimum  │
│ Notary Deed?     │ TIDAK (Form Kemenkum)│ YA (Akta Notaris)    │ YA (Akta Notaris)    │
│ Legal Liability  │ Terbatas modal PT    │ Terbatas modal PT    │ Sekutu Aktif: Penuh  │
│                  │ (Harta pribadi aman) │ (Harta pribadi aman) │ (Harta pribadi kena!)│
│ Max Turnover     │ Rp 5 Miliar / tahun  │ Tanpa batas          │ Tanpa batas          │
│ Institutional VC │ Jarang (harus upgrade│ Sangat disukai       │ Tidak bisa           │
│ Best For         │ Solo founder, UMKM,  │ Startups, B2B Scale, │ Jasa lokal, agensi,  │
│                  │ pilot ventures       │ Enterprise, Tender   │ trading non-risiko   │
└──────────────────┴──────────────────────┴──────────────────────┴──────────────────────┘
```

### When to Upgrade:
- **PT Perorangan to PT Biasa**: Upgrade immediately when (1) revenue exceeds Rp 5 Billion in a fiscal year, (2) onboarding a co-founder with equity, or (3) receiving institutional investment.
- **CV to PT**: Convert whenever entering contracts with liabilities exceeding personal net worth, or when bidding on enterprise government/corporate procurement where PT is a mandatory prerequisite.

---

## 2. Risk-Based Licensing: OSS-RBA & KBLI 2020

Under Government Regulation No. 5/2021, business licensing in Indonesia operates via the **Online Single Submission Risk-Based Approach (OSS-RBA)** at `oss.go.id`.

### The Core Licensing Pathway:
1. **KBLI 2020 Selection (5 Digits)**:
   - Identify the exact 5-digit code matching primary and secondary revenue activities.
   - *Example:* `62019` (Aktivitas Pemrograman Komputer Lainnya), `47911` (Perdagangan Eceran Melalui Media Internet / E-Commerce), `70209` (Aktivitas Konsultasi Manajemen Lainnya).
   - Ensure the company's Articles of Association (*Akta Pendirian*) list these exact business activities in Article 3.
2. **NIB (Nomor Induk Berusaha)**:
   - Serves as the single identification number: acts simultaneously as TDP (Tanda Daftar Perusahaan), API (Angka Pengenal Impor), and customs access.
3. **Risk Category Determination**:

```text
┌─────────────────┬───────────────────────────┬────────────────────────────────────────┐
│ Risk Level      │ Legal Requirement         │ Readiness to Operate                   │
├─────────────────┼───────────────────────────┼────────────────────────────────────────┤
│ Rendah (R)      │ NIB Tunggal               │ Efektif langsung; mulai operasional    │
│ Menengah Rendah │ NIB + Sertifikat Standar  │ Efektif otomatis (Pernyataan Mandiri)  │
│ Menengah Tinggi │ NIB + Sertifikat Standar  │ Wajib verifikasi teknis instansi/dinas │
│ Tinggi (T)      │ NIB + Izin Khusus (K/L/D) │ Wajib audit/inspeksi fisik & approval  │
└─────────────────┴───────────────────────────┴────────────────────────────────────────┘
```

4. **Basic Spatial & Environmental Compliance**:
   - **KKPR (Kesesuaian Kegiatan Pemanfaatan Ruang)**: Verification of zoning alignment (Komersial vs Pemukiman).
   - **Persetujuan Lingkungan**: SPPL (Surat Pernyataan Kesanggupan Pengelolaan dan Pemantauan Lingkungan Hidup) untuk risiko rendah/menengah, atau UKL-UPL / AMDAL untuk industri manufaktur berskala besar.
   - **PBG (Persetujuan Bangunan Gedung) & SLF (Sertifikat Laik Fungsi)** jika memiliki gedung/pabrik fisik.

---

## 3. Mandatory Sectoral Licenses & Intellectual Property

Operating without these key certifications creates existential shutdown risks, hefty civil penalties, or product confiscation.

### A. Intellectual Property (HKI / Merek Dagang) via DJKI
- **Rule of First-to-File**: Indonesia adheres strictly to the first-to-file principle. Whoever registers the trademark first owns it, regardless of who invented it first.
- **Classification**: Select relevant Nice Classification classes (Class 1–34 for goods, Class 35–45 for services).
  - *SaaS / Tech*: Class 9 (Software downloadable) and Class 42 (SaaS / cloud services).
  - *Agency / Marketing*: Class 35 (Advertising, business management).
  - *F&B*: Class 29/30 (Food products) and Class 43 (Restaurant/cafe services).
- **Timeline**: 6–12 months. File trademark application on Day 1 before launching public branding.

### B. Sector-Specific Licenses
- **BPOM & P-IRT (F&B / Cosmetics / Pharma)**:
  - *P-IRT (Dinkes)*: Small-scale low-risk home production food products (dry shelf life > 7 days).
  - *BPOM MD/ML (Pangan Olahan)*: Frozen food, high-moisture foods, dairy, beverages, and industrial food manufacturing.
  - *BPOM Kosmetik (Notifikasi NA)*: Mandatory for all skincare and cosmetic formulations prior to commercial sale.
- **Sertifikasi Halal (BPJPH)**:
  - Mandatory phased compliance for food, beverages, and biological ingredients under Law No. 33/2014.
- **PSE Kominfo (Penyelenggara Sistem Elektronik)**:
  - Mandatory under Perkominfo 5/2020 for all platforms operating a web service, mobile app, SaaS, or payment processing gateway in Indonesia. Penalty for non-registration: domain blocking.
- **Security & Quality Compliance**:
  - *ISO 27001*: Required for enterprise SaaS, Fintech, and cloud hosting handling sensitive PII data.
  - *ISO 9001*: Standard for manufacturing, engineering, and enterprise supply chain procurement.

---

## 4. Corporate Tax Structuring & Fiscal Compliance

Tax optimization is the legal maximization of net distributable cash while remaining 100% compliant with the Directorate General of Taxes (DJP).

```text
┌────────────────────────────────────────────────────────────────────────┐
│ PPh Final UMKM (PP 55/2022)                                            │
│ • Tarif: 0.5% dari Omzet Bruto Bulanan                                 │
│ • Syarat: Omzet kumulatif tahunan <= Rp 4.8 Miliar                     │
│ • Durasi Maksimal Penggunaan:                                          │
│     - PT Perorangan & PT Biasa: 3 Tahun Pajak                          │
│     - CV, Firma, Koperasi:      4 Tahun Pajak                          │
│     - Orang Pribadi:            7 Tahun Pajak (Bebas pajak omzet 500jt)│
├────────────────────────────────────────────────────────────────────────┤
│ Skema Normal PPh Badan (Tarif Pasal 17 UU HPP)                         │
│ • Tarif: 22% dari Penghasilan Kena Pajak (Laba Bersih Fiskal)          │
│ • Fasilitas Pasal 31E: Diskon 50% (Efektif 11%) untuk omzet s.d 4.8M   │
│   bagi perusahaan dengan omzet di bawah Rp 50 Miliar.                  │
└────────────────────────────────────────────────────────────────────────┘
```

### Withholding Taxes (Kewajiban Pemotongan):
- **PPh Pasal 21**: Pemotongan pajak penghasilan atas gaji, upah, honorarium karyawan tetap dan tenaga lepas (freelancer).
- **PPh Pasal 23**: Pemotongan 2% atas pembayaran jasa teknik, jasa manajemen, jasa konsultan, jasa desain, dan sewa alat kepada pihak ketiga ber-NPWP (4% jika non-NPWP).
- **PPh Pasal 4 ayat (2)**: Pemotongan final 10% atas sewa tanah dan/atau bangunan (kantor, ruko, gudang).

### PKP (Pengusaha Kena Pajak) & PPN 11%:
- **Wajib PKP**: Perusahaan dengan omzet melebihi Rp 4.8 Miliar dalam satu tahun buku wajib mengajukan pengukuhan PKP.
- **Sukarela PKP (< Rp 4.8M)**: Sangat direkomendasikan jika mayoritas klien adalah perusahaan B2B atau BUMN yang mensyaratkan Faktur Pajak PPN Masukan untuk dapat mengkreditkan pajak.

---

## 5. Governance Contracts & Executive Legal Arsenal

Every business must enforce four non-negotiable legal agreements before executing partnerships or accepting capital:

### 1. Founders' Agreement & Equity Vesting
- **Standard Vesting Schedule**: 4-year vesting schedule with a **1-year cliff** (25% vests at month 12; remaining 75% vests monthly over 36 months).
- **Good Leaver vs. Bad Leaver Clause**: If a founder resigns before year 2 or is terminated for cause/fraud, unvested shares are forfeited, and vested shares may be repurchased at nominal value by the company.
- **IP Assignment**: All intellectual property, code, trademarks, designs, and trade secrets created by founders belong 100% to the legal corporate entity, not the individual.

### 2. Commercial Master Services Agreement (MSA) & SOW
- **Limitation of Liability**: Cap total aggregate damages at the total fees paid by the client within the preceding 3 to 6 months.
- **Scope Creep Protection**: Explicitly define deliverables in an attached Statement of Work (SOW); additional requests billed at standard hourly/daily retainer rates.
- **Payment Default**: Late fees (1.5% per month) and immediate service suspension rights after 14 days of invoice overdue.

### 3. Non-Disclosure & Non-Compete Agreement (NDA)
- Bilateral confidentiality covering proprietary trade secrets, customer databases, pricing algorithms, and financial metrics.
- 24-month post-engagement non-solicitation of company employees and key clients.

### 4. Data Privacy Policy & Terms of Service (UU PDP No. 27/2022)
- Explicit user consent mechanisms for personal data collection, processing purpose, retention period, and right to erasure.
