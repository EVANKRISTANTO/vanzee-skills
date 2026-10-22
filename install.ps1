<#
.SYNOPSIS
    VANZEE-SKILLS INSTALLER FOR WINDOWS (PowerShell)
    The Definitive Web Craft & Growth Skills Suite for AI Coding Agents.
    Developed by Evan Kristanto (Vanzee) - https://github.com/EVANKRISTANTO/vanzee-skills
#>
[CmdletBinding()]
param(
    [ValidateSet('auto', 'antigravity', 'claude', 'codex', 'all')]
    [string]$Target = 'auto'
)

$ErrorActionPreference = 'Stop'

Clear-Host
Write-Host ""
Write-Host "   __      __            ______              ____ __   _ __ __     " -ForegroundColor Cyan
Write-Host "   \ \    / /___ _____  /_  __/____  ___    / __// /__(_) // /____ " -ForegroundColor Cyan
Write-Host "    \ \/\/ // _ `/ _ \  / /  / _  / / -_)  _\ \ /  '_// // // (_-< " -ForegroundColor Magenta
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

Write-Host "+-- [2/4] Skill Suite Inventory (9 Flagship Skills) ------------------+" -ForegroundColor White
Write-Host "|  01. [GEM] evankristanto          Token Compaction, Bento/Aura UI, Security Shield" -ForegroundColor Cyan
Write-Host "|  02. [MOB] universal-responsive  Container Queries, clamp() Math, Foldables to 4K" -ForegroundColor Cyan
Write-Host "|  03. [SPD] web-perf-optimizer    100/100 Lighthouse, Sub-second LCP, Zero CLS" -ForegroundColor Cyan
Write-Host "|  04. [CPY] conversion-copywriting Human Voice Engine, B2B Pitch, Landing Page Copy" -ForegroundColor Cyan
Write-Host "|  05. [VIR] social-caption-maker  Viral Hooks, Social SEO, Gen Z Engagement Engine" -ForegroundColor Cyan
Write-Host "|  06. [RSK] risk-management       5x5 Matrix, Pre-Mortem, Zero-Downtime Rollbacks" -ForegroundColor Cyan
Write-Host "|  07. [THK] deep-think-planner    Metacognitive First-Principles, Multi-Path Plans" -ForegroundColor Cyan
Write-Host "|  08. [0AI] zero-ai-detector      0% Turnitin/GPTZero Detection Bypass, Burstiness" -ForegroundColor Cyan
Write-Host "|  09. [EDU] academic-student-support Dual-Output Mastery, 6 College Papers, Oral Prep" -ForegroundColor Cyan
Write-Host "+-----------------------------------------------------------------------+" -ForegroundColor White
Write-Host ""

Write-Host "+-- [3/4] Installing Skills into Environment ---------------------------+" -ForegroundColor White

$totalInstalled = 0
foreach ($dest in $Destinations) {
    Write-Host ("|  > Deploying to: " + $dest) -ForegroundColor Magenta
    if (-not (Test-Path $dest)) {
        New-Item -ItemType Directory -Path $dest -Force | Out-Null
    }

    Get-ChildItem -Path $SkillsSrc -Directory | ForEach-Object {
        $targetDir = Join-Path $dest $_.Name
        Copy-Item -Path $_.FullName -Destination $targetDir -Recurse -Force
        Write-Host ("|    [OK] Installed " + $_.Name) -ForegroundColor Green
        $totalInstalled++
    }
}
Write-Host "+-----------------------------------------------------------------------+" -ForegroundColor White
Write-Host ""

Write-Host "=========================================================================" -ForegroundColor Green
Write-Host "                INSTALLATION COMPLETED SUCCESSFULLY!                     " -ForegroundColor Green
Write-Host "=========================================================================" -ForegroundColor Green
Write-Host (" Total Packages Deployed: " + $totalInstalled + " skills") -ForegroundColor White
Write-Host (" Active Target Path(s):   " + ($Destinations -join '; ')) -ForegroundColor Cyan
Write-Host ""
Write-Host "Quick Interactive Prompts to Try Right Now:" -ForegroundColor White
Write-Host "  * Bento UI:       'Bikin dashboard modern bento pakai evankristanto'" -ForegroundColor Magenta
Write-Host "  * Responsive:     'Refactor landing page ini pakai universal-responsive'" -ForegroundColor Magenta
Write-Host "  * Performance:    'Audit Core Web Vitals website ini pakai web-perf-optimizer'" -ForegroundColor Magenta
Write-Host "  * Copywriting:    'Buat landing page value prop pakai conversion-copywriting'" -ForegroundColor Magenta
Write-Host "  * Viral Caption:  'Bikin caption Instagram carousel pakai social-caption-maker'" -ForegroundColor Magenta
Write-Host "  * Risk Audit:     'Analisis resiko dan skenario pre-mortem pakai risk-management'" -ForegroundColor Magenta
Write-Host "  * Deep Think:     'Pikirkan dulu arsitektur terbaik pakai deep-think-planner'" -ForegroundColor Magenta
Write-Host "  * Stealth AI:     'Humanize artikel ini biar skor AI 0% pakai zero-ai-detector'" -ForegroundColor Magenta
Write-Host "  * Tugas Kuliah:   'Bantu buat makalah S1 dan panduan ujian pakai academic-student-support'" -ForegroundColor Magenta
Write-Host ""
Write-Host " Crafted with passion by Evan Kristanto (Vanzee) - Enjoy your superpower!" -ForegroundColor DarkGray
Write-Host ""
