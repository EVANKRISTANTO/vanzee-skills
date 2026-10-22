<#
.SYNOPSIS
    Installs the Evan Kristanto Agent Skills suite into your AI agent environment.
.DESCRIPTION
    Supports Antigravity, Claude Code, and Codex CLI.
.PARAMETER Target
    Target agent: 'antigravity' (default), 'claude', 'codex', or 'all'.
#>
[CmdletBinding()]
param(
    [ValidateSet('antigravity', 'claude', 'codex', 'all')]
    [string]$Target = 'antigravity'
)

$ErrorActionPreference = 'Stop'
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$SkillsSrc = Join-Path $ScriptDir 'skills'

if (-not (Test-Path $SkillsSrc)) {
    Write-Error "Source skills directory not found at $SkillsSrc"
    exit 1
}

$Destinations = @()

switch ($Target) {
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

foreach ($dest in $Destinations) {
    Write-Host "Installing skills to: $dest" -ForegroundColor Cyan
    if (-not (Test-Path $dest)) {
        New-Item -ItemType Directory -Path $dest -Force | Out-Null
    }

    Get-ChildItem -Path $SkillsSrc -Directory | ForEach-Object {
        $targetSkillDir = Join-Path $dest $_.Name
        Copy-Item -Path $_.FullName -Destination $targetSkillDir -Recurse -Force
        Write-Host "  -> Installed $($_.Name)" -ForegroundColor Green
    }
}

Write-Host "`nAll Evan Kristanto skills installed successfully!" -ForegroundColor Green
Write-Host "Restart your AI agent or start a new session to begin using them.`n"
