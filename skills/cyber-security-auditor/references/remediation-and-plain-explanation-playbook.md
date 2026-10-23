# Remediation & Plain Human Explanation Playbook
> Reference guide for `cyber-security-auditor` — How to explain vulnerabilities to beginners and non-engineers with vivid real-world analogies, paired with exact developer-grade fixes.

---

## 🎯 The Dual-Lens Fix Architecture

A great security audit connects two worlds:
1. **The Executive & Layman Lens (Orang Biasa / Stakeholder Non-Teknis)**: Needs to understand *what happened*, *how dangerous it is*, and *what to do right now* in simple terms without deciphering AST trees or memory registers.
2. **The Senior Engineer Lens (DevSecOps / Software Engineer)**: Needs the exact root cause, data flow trace, copy-paste unified git diff, and negative regression test cases.

```text
┌────────────────────────────────────────────────────────────────────────┐
│                      THE DUAL-LENS AUDIT PROTOCOL                      │
├────────────────────────────────────┬───────────────────────────────────┤
│  LENS 1: NON-TECHNICAL / BEGINNER  │  LENS 2: SOFTWARE ENGINEER        │
│  • Analogi Dunia Nyata (Real-Life) │  • Exact Root Cause & Sink        │
│  • Dampak Konkret ke Bisnis & Data │  • Unified Git Diff (Before/After)│
│  • Quick Emergency Action (< 5 Min)│  • Defensive Negative Unit Test   │
│  • Penjelasan Bebas Jargon Rumit   │  • Defense-in-Depth (WAF & OS)    │
└────────────────────────────────────┴───────────────────────────────────┘
```

---

## 💡 10 Universal Vulnerability Analogies & Fix Guidelines

### 1. Remote Code Execution (RCE) — `CWE-78` / `CWE-94`
* **Analogi Dunia Nyata**: 
  > *"Bayangkan kamu memesan makanan di restoran lewat secarik kertas. Kertas itu kamu tulis: 'Bawakan nasi goreng, LALU bakar restorannya'. Koki restoran langsung membaca catatan itu dan beneran membakar restorannya karena dia tidak membedakan antara pesanan makanan dengan perintah komando berbahaya."*
* **Dampak Sederhana**: Penyerang bisa menyusup ke dalam server, membaca semua database, menghapus file, atau memasang malware tebusan (ransomware) dari jarak jauh tanpa izin.
* **Langkah Darurat 30 Detik (Non-Teknis)**:
  - Segera update runtime atau framework ke versi patch terbaru (misal PHP 8.3.36+ / Node LTS).
  - Jika pakai hosting cPanel/PaaS, matikan fungsi berbahaya di `php.ini` (`disable_functions = exec,shell_exec,system,passthru,popen,proc_open`).
* **Langkah Permanen (Engineer)**:
  - Jangan pernah melempar input pengguna langsung ke shell terminal (`shell: false`).
  - Gunakan `execFile` atau `proc_open` dengan argumen berbentuk array kaku (*rigid array*), atau validasi ketat dengan allowlist regex: `/^[a-zA-Z0-9_\-\.]+$/`.

---

### 2. SQL Injection (SQLi) — `CWE-89`
* **Analogi Dunia Nyata**: 
  > *"Bayangkan kamu mengisi formulir transfer bank di kolom nama penerima: 'Budi, LALU transfer juga seluruh sisa uang di brankas ke rekening saya'. Kasir bank yang lugu memproses kalimat tersebut sebagai perintah resmi transfer brankas, bukan sebagai sekadar nama orang."*
* **Dampak Sederhana**: Penyerang bisa mendownload seluruh data pengguna, password, nomor kartu kredit, atau login sebagai admin tanpa tahu password aslinya.
* **Langkah Darurat 30 Detik (Non-Teknis)**:
  - Aktifkan WAF (Web Application Firewall) seperti Cloudflare Managed Rules atau AWS WAF SQLi RuleSet.
* **Langkah Permanen (Engineer)**:
  - Gunakan **Prepared Statements (Parameterized Queries)**. Query dan parameter dipisahkan total sehingga interpreter database memperlakukan input 100% sebagai data murni, bukan instruksi SQL.

---

### 3. Server-Side Request Forgery (SSRF) — `CWE-918`
* **Analogi Dunia Nyata**: 
  > *"Kamu menyuruh kurir kantor untuk mengambil dokumen ke alamat luar. Tapi orang asing menyelipkan surat ke kurir: 'Tolong ambilkan berkas rahasia di brankas lantai 5 kantor kamu sendiri'. Karena kurir punya kartu akses internal gedung, dia membukakan brankas internal untuk orang asing tersebut."*
* **Dampak Sederhana**: Server kamu dimanfaatkan penyerang untuk menyerang atau mengintip jaringan privat internal perusahaan (seperti kunci rahasia AWS/GCP Metadata di `169.254.169.254`).
* **Langkah Darurat 30 Detik (Non-Teknis)**:
  - Blokir akses server ke alamat metadata cloud lewat firewall cloud (Security Group/IPTables).
* **Langkah Permanen (Engineer)**:
  - Validasi URL input dengan resolver DNS. Tolak IP privat (`10.0.0.0/8`, `172.16.0.0/12`, `192.168.0.0/16`, `127.0.0.1`, `169.254.169.254`).
  - Hanya izinkan protokol `https:` dan batasi ke allowlist domain rekanan yang valid.

---

### 4. Broken Object Level Authorization (BOLA / IDOR) — `CWE-639`
* **Analogi Dunia Nyata**: 
  > *"Kamu menyewa loker nomor 10 di tempat fitnes. Di kunci lokermu tertulis nomor 10. Tapi saat kamu mencoba memasukkan kunci itu ke loker nomor 11 milik orang lain, ternyata lokernya langsung terbuka begitu saja tanpa ada petugas yang mengecek kepemilikan."*
* **Dampak Sederhana**: Pengguna biasa bisa melihat invoice, foto KTP, pesan pribadi, atau rekam medis milik pengguna lain hanya dengan mengganti nomor angka di URL (misal dari `/invoice/100` ke `/invoice/101`).
* **Langkah Darurat 30 Detik (Non-Teknis)**:
  - Matikan sementara endpoint publik yang menampilkan data sensitif jika belum ada verifikasi kepemilikan akun.
* **Langkah Permanen (Engineer)**:
  - Selalu verifikasi sesi kepemilikan pada layer database: `SELECT * FROM invoices WHERE id = :invoiceId AND user_id = :currentAuthUserId`.
  - Ganti ID auto-increment (`1, 2, 3`) dengan UUIDv7 atau nanoid acak.

---

### 5. Cross-Site Scripting (XSS) — `CWE-79`
* **Analogi Dunia Nyata**: 
  > *"Seseorang menulis pesan di buku tamu resepsionis: 'Siapapun yang membaca pesan ini, tolong serahkan dompet Anda ke orang bertopeng di pintu keluar'. Setiap tamu yang datang membaca pesan itu dan secara otomatis terhipnotis memberikan dompetnya."*
* **Dampak Sederhana**: Akun pengguna atau admin bisa diambil alih seketika saat membuka halaman profil atau membaca komentar yang disisipi skrip jahat.
* **Langkah Darurat 30 Detik (Non-Teknis)**:
  - Pasang cookie flag `HttpOnly` pada session cookie (agar JavaScript tidak bisa membaca cookie login).
* **Langkah Permanen (Engineer)**:
  - Sanitasi HTML output menggunakan `DOMPurify` (pada JS/TS) atau `htmlspecialchars(..., ENT_QUOTES, 'UTF-8')` (pada PHP).
  - Terapkan Content Security Policy (CSP) ketat: `Content-Security-Policy: default-src 'self'`.

---

### 6. Insecure Deserialization — `CWE-502`
* **Analogi Dunia Nyata**: 
  > *"Kamu membongkar paket kiriman luar negeri yang dibungkus rapi. Ternyata di dalam kotak bukan barang pesananmu, melainkan bom rakitan mekanik yang otomatis aktif saat plastiknya kamu robek."*
* **Dampak Sederhana**: Server langsung menjalankan program jahat begitu membaca session cookie atau payload data yang dimanipulasi penyerang.
* **Langkah Darurat 30 Detik (Non-Teknis)**:
  - Ganti format penyimpanan session dari serialized object ke format standar JSON murni.
* **Langkah Permanen (Engineer)**:
  - Hindari `unserialize()` di PHP, `pickle.loads()` di Python, atau `yaml.load()` tanpa safe loader.
  - Gunakan `json_decode()` atau `json.loads()` dengan validasi skema Zod / Pydantic.

---

### 7. Path Traversal / Arbitrary File Read — `CWE-22`
* **Analogi Dunia Nyata**: 
  > *"Kamu minta tolong staf perpustakaan: 'Ambilkan buku di rak A'. Tapi kamu mengelabui instruksi jadi: 'Mundur 5 langkah, masuk ke ruang arsip rahasia, lalu ambil berkas brankas'. Petugas menurut tanpa sadar dia sudah keluar dari area publik."*
* **Dampak Sederhana**: Penyerang bisa membaca file konfigurasi server, password database (`.env`), atau file sistem penting (`/etc/passwd`).
* **Langkah Darurat 30 Detik (Non-Teknis)**:
  - Pastikan web server (Nginx/Apache) tidak menjalankan direktori browsing dan melarang akses file tersembunyi berawalan titik (`.*`).
* **Langkah Permanen (Engineer)**:
  - Gunakan `path.basename()` untuk membuang semua prefix folder `../`.
  - Verifikasi path absolut hasil penggabungan: pastikan selalu berawalan dengan direktori dasar yang diizinkan (`cleanPath.startsWith(baseFolder)`).

---

### 8. Hardcoded Secrets & API Keys — `CWE-798`
* **Analogi Dunia Nyata**: 
  > *"Kamu memasang pintu baja super canggih berstandar militer, tapi kuncinya kamu gantungkan di pegangan pintu luar agar tidak lupa."*
* **Dampak Sederhana**: Siapapun yang melihat source code (termasuk karyawan magang atau repositori publik) bisa mengakses database dan layanan berbayar perusahaan secara gratis.
* **Langkah Darurat 30 Detik (Non-Teknis)**:
  - Buka dashboard penyedia API (AWS, Stripe, GitHub, Database), lakukan tombol **Revoke / Rotate Key** sekarang juga!
* **Langkah Permanen (Engineer)**:
  - Pindahkan semua secret ke Environment Variables (`.env`) atau Secret Manager (AWS Secrets Manager / Vault).
  - Tambahkan `.env` ke `.gitignore` dan pasang git pre-commit hook scanning (`gitleaks`).

---

### 9. Race Condition / TOCTOU — `CWE-367`
* **Analogi Dunia Nyata**: 
  > *"Kamu punya saldo Rp 100.000 di rekening. Kamu menarik uang di 2 mesin ATM berbeda secara bersamaan persis dalam milidetik yang sama. Kedua mesin sama-sama mengecek bahwa saldo kamu masih ada, lalu keduanya mengeluarkan uang Rp 100.000, sehingga kamu dapat Rp 200.000 padahal saldo cuma 100 ribu."*
* **Dampak Sederhana**: Pengguna bisa menduplikasi voucher diskon, mencairkan saldo ganda, atau melewati batas kuota sistem.
* **Langkah Darurat 30 Detik (Non-Teknis)**:
  - Batasi satu pengguna hanya bisa melakukan 1 request transaksi per waktu melalui rate limiting.
* **Langkah Permanen (Engineer)**:
  - Gunakan Database Transaction dengan Pessimistic Row Locking (`SELECT ... FOR UPDATE`).
  - Gunakan Redis Distributed Lock (Redlock) pada layer backend untuk operasi finansial/stok.

---

### 10. Memory Corruption / Buffer Overflow — `CWE-119` / `CWE-787`
* **Analogi Dunia Nyata**: 
  > *"Kamu memesan gelas ukuran 200 ml, tapi kamu memaksa menuangkan air sebanyak 1.000 ml ke gelas itu. Airnya meluap membanjiri meja, merusak komputer kasir di sebelahnya, dan mengubah angka di mesin kasir."*
* **Dampak Sederhana**: Aplikasi crash seketika, server down, atau penyerang bisa membelokkan instruksi prosesor untuk menjalankan kode jahat.
* **Langkah Darurat 30 Detik (Non-Teknis)**:
  - Restart service dengan auto-restart monitor dan batasi ukuran upload payload di Nginx (`client_max_body_size`).
* **Langkah Permanen (Engineer)**:
  - Gunakan fungsi dengan pemeriksaan batas memori (`snprintf` menggantikan `sprintf`, `strncpy_s` menggantikan `strcpy`).
  - Migrasi komponen kritis ke bahasa memory-safe (Rust / Go).
