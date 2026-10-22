<#
.SYNOPSIS
    VANZEE-SKILLS INTERACTIVE INSTALLER FOR WINDOWS (PowerShell)
    The Definitive Web Craft & Growth Skills Suite for AI Coding Agents.
    Developed by Evan Kristanto (Vanzee) - https://github.com/EVANKRISTANTO/vanzee-skills
#>
[CmdletBinding()]
param(
    [ValidateSet('auto', 'antigravity', 'claude', 'codex', 'all')]
    [string]$Target = 'auto',

    [string]$Preset = ''
)

$ErrorActionPreference = 'Stop'

Clear-Host
Write-Host ""
Write-Host "   __      __            ______              ____ __   _ __ __     " -ForegroundColor Cyan
Write-Host "   \ \    / /___ _____  /_  __/____  ___    / __// /__(_) // /____ " -ForegroundColor Cyan
Write-Host "    \ \/\/ // _ / _ \  / /  / _  / / -_)  _\ \ /  '_// // // (_-< " -ForegroundColor Magenta
Write-Host "     \_/\_/ \_,_/_//_/ /_/   \_,_/  \__/  /___//_/\_\/_//_//_/___/ " -ForegroundColor Magenta
Write-Host "   * VANZEE SKILLS SUITE - High-Craft Autonomous Agent Intelligence" -ForegroundColor Yellow
Write-Host "   Developed with obsession by Evan Kristanto (Vanzee)" -ForegroundColor DarkGray
Write-Host ""

$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$SkillsSrc = Join-Path $ScriptDir 'skills'

if (-not (Test-Path $SkillsSrc)) {
    Write-Host " [>] Downloading latest vanzee-skills repository from GitHub..." -ForegroundColor Yellow
    $tmpDir = Join-Path $env:TEMP ("vanzee-skills-" + [System.Guid]::NewGuid().ToString())
    git clone --depth 1 https://github.com/EVANKRISTANTO/vanzee-skills.git $tmpDir | Out-Null
    $SkillsSrc = Join-Path $tmpDir 'skills'
}

Write-Host "+-- [1/4] Environment Inspection --------------------------------------+" -ForegroundColor White
$detectedAgents = @()
if (Test-Path (Join-Path $HOME '.gemini')) { $detectedAgents += "Google Antigravity (Detected)" }
if (Test-Path (Join-Path $HOME '.claude')) { $detectedAgents += "Claude Code (Detected)" }
if (Test-Path (Join-Path $HOME '.codex'))  { $detectedAgents += "OpenAI Codex CLI (Detected)" }

Write-Host ("|  * Host OS:             Windows (PowerShell " + $PSVersionTable.PSVersion.ToString() + ")") -ForegroundColor Gray
if ($detectedAgents.Count -gt 0) {
    Write-Host ("|  * Installed Agents:    " + ($detectedAgents -join ', ')) -ForegroundColor Green
} else {
    Write-Host "|  * Target Environments: Defaulting to Antigravity global config" -ForegroundColor Gray
}
Write-Host "+-----------------------------------------------------------------------+" -ForegroundColor White
Write-Host ""

$AllSkills = @(
    @{ Id = 1; Name = 'evankristanto';           Desc = 'Token Compaction, Bento/Aura UI, Security Shield, SEO & Email'; Tag = 'WEB' },
    @{ Id = 2; Name = 'universal-responsive';    Desc = 'Container Queries, clamp() Math, Foldables to 4K Ultra-Wide'; Tag = 'MOB' },
    @{ Id = 3; Name = 'web-perf-optimizer';      Desc = '100/100 Lighthouse, Sub-second LCP, Zero CLS, Sub-50ms INP'; Tag = 'SPD' },
    @{ Id = 4; Name = 'conversion-copywriting';  Desc = 'Human Voice Engine, B2B Pitch, Landing Page Blueprints'; Tag = 'CPY' },
    @{ Id = 5; Name = 'social-caption-maker';    Desc = 'Viral Hooks, Social SEO, Gen Z Engagement Engine'; Tag = 'VIR' },
    @{ Id = 6; Name = 'risk-management';         Desc = '5x5 Matrix, Pre-Mortem, Zero-Downtime Rollbacks'; Tag = 'RSK' },
    @{ Id = 7; Name = 'deep-think-planner';      Desc = 'Metacognitive First-Principles, Multi-Path Planning'; Tag = 'THK' },
    @{ Id = 8; Name = 'zero-ai-detector';        Desc = '0% Turnitin/GPTZero Detection Bypass, Burstiness Math'; Tag = '0AI' },
    @{ Id = 9; Name = 'academic-student-support';Desc = 'Dual-Output Mastery, 6 College Papers, Oral Defense Prep'; Tag = 'EDU' },
    @{ Id = 10; Name = 'prompt-architect';       Desc = 'Meta-Prompt Generator, Idea Expander & Skills Mapper'; Tag = 'PRM' },
    @{ Id = 11; Name = 'business-growth-strategist'; Desc = 'Unit Economics, Licensing (OSS/NIB/PT), Profit Engine'; Tag = 'BIZ' }
)

Write-Host "+-- [2/4] Choose Installation Mode ------------------------------------+" -ForegroundColor White
Write-Host "|  [A] Full Flagship Suite (All 11 Skills)                  [DEFAULT]  |" -ForegroundColor Green
Write-Host "|  [1] Web & UI/UX Craft Pack     (evankristanto, responsive, perf)     |" -ForegroundColor Cyan
Write-Host "|  [2] Growth & Marketing Pack   (copywriting, caption, zero-ai)       |" -ForegroundColor Cyan
Write-Host "|  [3] Deep Reasoning & Prompts  (deep-think, risk, prompt-architect)  |" -ForegroundColor Cyan
Write-Host "|  [4] Academic & Student Pack   (academic-support, zero-ai)           |" -ForegroundColor Cyan
Write-Host "|  [5] Enterprise & Business Pack(business-growth, risk, copywriting)   |" -ForegroundColor Cyan
Write-Host "|  [C] Custom Selection          (Pilih nomor skill manual 1-11)       |" -ForegroundColor Yellow
Write-Host "+-----------------------------------------------------------------------+" -ForegroundColor White

$choice = $Preset
if ([string]::IsNullOrWhiteSpace($choice)) {
    Write-Host ""
    $choice = Read-Host "Pilih preset yang mau di-install [A/1/2/3/4/5/C] (Tekan ENTER untuk Semua)"
    if ([string]::IsNullOrWhiteSpace($choice)) { $choice = 'A' }
}

$chosenSkillNames = @()

switch ($choice.ToUpper().Trim()) {
    '1' {
        $chosenSkillNames = @('evankristanto', 'universal-responsive', 'web-perf-optimizer')
        Write-Host "`n> Mode Dipilih: [1] Web & UI/UX Craft Pack" -ForegroundColor Cyan
    }
    '2' {
        $chosenSkillNames = @('conversion-copywriting', 'social-caption-maker', 'zero-ai-detector')
        Write-Host "`n> Mode Dipilih: [2] Growth & Marketing Pack" -ForegroundColor Cyan
    }
    '3' {
        $chosenSkillNames = @('deep-think-planner', 'risk-management', 'prompt-architect')
        Write-Host "`n> Mode Dipilih: [3] Deep Reasoning & Prompt Engine" -ForegroundColor Cyan
    }
    '4' {
        $chosenSkillNames = @('academic-student-support', 'zero-ai-detector')
        Write-Host "`n> Mode Dipilih: [4] Academic & Student Pack" -ForegroundColor Cyan
    }
    '5' {
        $chosenSkillNames = @('business-growth-strategist', 'risk-management', 'conversion-copywriting')
        Write-Host "`n> Mode Dipilih: [5] Enterprise & Business Pack" -ForegroundColor Cyan
    }
    'C' {
        Write-Host ""
        Write-Host "+-- DAFTAR SKILL TERSEDIA ----------------------------------------------+" -ForegroundColor Yellow
        foreach ($s in $AllSkills) {
            Write-Host ("|  [" + $s.Id + "] [" + $s.Tag + "] " + $s.Name.PadRight(26) + " - " + $s.Desc) -ForegroundColor Gray
        }
        Write-Host "+-----------------------------------------------------------------------+" -ForegroundColor Yellow
        Write-Host ""
        $customInput = Read-Host "Ketik nomor skill yang mau dipasang (pisahkan dengan spasi/koma, contoh: 1 3 5 8)"
        if ([string]::IsNullOrWhiteSpace($customInput)) {
            $chosenSkillNames = $AllSkills | ForEach-Object { $_.Name }
        } else {
            $tokens = $customInput -split '[,\s]+'
            foreach ($t in $tokens) {
                $num = 0
                if ([int]::TryParse($t.Trim(), [ref]$num)) {
                    $matched = $AllSkills | Where-Object { $_.Id -eq $num }
                    if ($matched) { $chosenSkillNames += $matched.Name }
                }
            }
        }
        if ($chosenSkillNames.Count -eq 0) {
            Write-Host "Tidak ada nomor valid yang dipilih, default ke semua skill." -ForegroundColor DarkGray
            $chosenSkillNames = $AllSkills | ForEach-Object { $_.Name }
        }
    }
    Default {
        $chosenSkillNames = $AllSkills | ForEach-Object { $_.Name }
        Write-Host "`n> Mode Dipilih: [A] Full Flagship Suite (Semua 11 Skill)" -ForegroundColor Green
    }
}

$Destinations = @()
switch ($Target) {
    'auto' {
        $any = $false
        if (Test-Path (Join-Path $HOME '.gemini')) {
            $Destinations += Join-Path $HOME '.gemini\config\skills'
            $any = $true
        }
        if (Test-Path (Join-Path $HOME '.claude')) {
            $Destinations += Join-Path $HOME '.claude\skills'
            $any = $true
        }
        if (Test-Path (Join-Path $HOME '.codex')) {
            $Destinations += Join-Path $HOME '.codex\skills'
            $any = $true
        }
        if (-not $any) {
            $Destinations += Join-Path $HOME '.gemini\config\skills'
        }
    }
    'antigravity' {
        $Destinations += Join-Path $HOME '.gemini\config\skills'
    }
    'claude' {
        $Destinations += Join-Path $HOME '.claude\skills'
    }
    'codex' {
        $Destinations += Join-Path $HOME '.codex\skills'
    }
    'all' {
        $Destinations += Join-Path $HOME '.gemini\config\skills'
        $Destinations += Join-Path $HOME '.claude\skills'
        $Destinations += Join-Path $HOME '.codex\skills'
    }
}

Write-Host ""
Write-Host "+-- [3/4] Installing Selected Skills -----------------------------------+" -ForegroundColor White

$totalInstalled = 0
foreach ($dest in $Destinations) {
    Write-Host ("|  > Deploying to: " + $dest) -ForegroundColor Magenta
    if (-not (Test-Path $dest)) {
        New-Item -ItemType Directory -Path $dest -Force | Out-Null
    }

    foreach ($skillName in $chosenSkillNames) {
        $srcDir = Join-Path $SkillsSrc $skillName
        if (Test-Path $srcDir) {
            $targetDir = Join-Path $dest $skillName
            Copy-Item -Path $srcDir -Destination $targetDir -Recurse -Force
            Write-Host ("|    [OK] Installed " + $skillName) -ForegroundColor Green
            $totalInstalled++
        }
    }

    # Deploy Modular Rules
    $rulesSrc = Join-Path (Split-Path $SkillsSrc -Parent) 'rules'
    if (Test-Path $rulesSrc) {
        $parentConfig = Split-Path $dest -Parent
        $targetRulesDir = Join-Path $parentConfig 'rules'
        if (-not (Test-Path $targetRulesDir)) {
            New-Item -ItemType Directory -Path $targetRulesDir -Force | Out-Null
        }
        Copy-Item -Path (Join-Path $rulesSrc '*') -Destination $targetRulesDir -Recurse -Force
        Write-Host "|    [OK] Installed Vanzee Modular Rules Suite" -ForegroundColor Cyan
    }
}
Write-Host "+-----------------------------------------------------------------------+" -ForegroundColor White
Write-Host ""

Write-Host "=========================================================================" -ForegroundColor Green
Write-Host "                INSTALLATION COMPLETED SUCCESSFULLY!                     " -ForegroundColor Green
Write-Host "=========================================================================" -ForegroundColor Green
Write-Host (" Total Selected Packages: " + $chosenSkillNames.Count + " skills") -ForegroundColor White
Write-Host (" Total Installed Targets: " + $totalInstalled + " instances") -ForegroundColor White
Write-Host (" Active Target Path(s):   " + ($Destinations -join '; ')) -ForegroundColor Cyan
Write-Host ""
Write-Host "Quick Prompts to Try Based on Your Selection:" -ForegroundColor White
foreach ($sn in $chosenSkillNames) {
    switch ($sn) {
        'evankristanto'           { Write-Host "  * Bento UI:      'Bikin dashboard modern bento pakai evankristanto'" -ForegroundColor Magenta }
        'universal-responsive'    { Write-Host "  * Responsive:    'Refactor landing page ini pakai universal-responsive'" -ForegroundColor Magenta }
        'web-perf-optimizer'      { Write-Host "  * Performance:   'Audit Core Web Vitals website ini pakai web-perf-optimizer'" -ForegroundColor Magenta }
        'conversion-copywriting'  { Write-Host "  * Copywriting:   'Buat landing page value prop pakai conversion-copywriting'" -ForegroundColor Magenta }
        'social-caption-maker'    { Write-Host "  * Viral Caption: 'Bikin caption Instagram carousel pakai social-caption-maker'" -ForegroundColor Magenta }
        'risk-management'         { Write-Host "  * Risk Audit:    'Analisis resiko dan skenario pre-mortem pakai risk-management'" -ForegroundColor Magenta }
        'deep-think-planner'      { Write-Host "  * Deep Think:    'Pikirkan dulu arsitektur terbaik pakai deep-think-planner'" -ForegroundColor Magenta }
        'zero-ai-detector'        { Write-Host "  * Stealth AI:    'Humanize artikel ini biar skor AI 0% pakai zero-ai-detector'" -ForegroundColor Magenta }
        'academic-student-support'{ Write-Host "  * Tugas Kuliah:  'Bantu buat makalah S1 dan panduan ujian pakai academic-student-support'" -ForegroundColor Magenta }
        'prompt-architect'        { Write-Host "  * Prompt Gen:    'Bagusin dan kembangkan ide prompt ini pakai prompt-architect'" -ForegroundColor Magenta }
        'business-growth-strategist'{ Write-Host "  * Business Adv:  'Analisis kelayakan bisnis, margin profit, dan izin OSS pakai business-growth-strategist'" -ForegroundColor Magenta }
    }
}
Write-Host ""
Write-Host " Crafted with passion by Evan Kristanto (Vanzee) - Enjoy your superpower!" -ForegroundColor DarkGray
Write-Host ""
