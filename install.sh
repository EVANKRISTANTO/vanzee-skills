#!/usr/bin/env bash
# ==============================================================================
# ⚡ VANZEE-SKILLS INSTALLER
# The Definitive Web Craft & Growth Skills Suite for AI Coding Agents
# Developed by Evan Kristanto (Vanzee) • https://github.com/EVANKRISTANTO/vanzee-skills
# ==============================================================================

set -euo pipefail

# --- Color & Formatting Definitions ---
if [ -t 1 ]; then
  BOLD="\033[1m"
  DIM="\033[2m"
  CYAN="\033[38;5;51m"
  PURPLE="\033[38;5;141m"
  PINK="\033[38;5;198m"
  GREEN="\033[38;5;48m"
  YELLOW="\033[38;5;214m"
  BLUE="\033[38;5;75m"
  GRAY="\033[38;5;244m"
  WHITE="\033[1;37m"
  RESET="\033[0m"
else
  BOLD=""
  DIM=""
  CYAN=""
  PURPLE=""
  PINK=""
  GREEN=""
  YELLOW=""
  BLUE=""
  GRAY=""
  WHITE=""
  RESET=""
fi

# --- Helper Functions ---
print_banner() {
  clear 2>/dev/null || true
  cat << "EOF"

  [38;5;51m██╗   ██╗ █████╗ ███╗   ██╗███████╗███████╗███████╗    [38;5;141m███████╗██╗  ██╗██╗██╗     ██╗     ███████╗
  [38;5;51m██║   ██║██╔══██╗████╗  ██║╚══███╔╝██╔════╝██╔════╝    [38;5;141m██╔════╝██║ ██╔╝██║██║     ██║     ██╔════╝
  [38;5;51m██║   ██║███████║██╔██╗ ██║  ███╔╝ █████╗  █████╗      [38;5;141m███████╗█████╔╝ ██║██║     ██║     ███████╗
  [38;5;51m╚██╗ ██╔╝██╔══██║██║╚██╗██║ ███╔╝  ██╔══╝  ██╔══╝      [38;5;141m╚════██║██╔═██╗ ██║██║     ██║     ╚════██║
  [38;5;51m ╚████╔╝ ██║  ██║██║ ╚████║███████╗███████╗███████╗    [38;5;141m███████║██║  ██╗██║███████╗███████╗███████║
  [38;5;51m  ╚═══╝  ╚═╝  ╚═╝╚═╝  ╚═══╝╚══════╝╚══════╝╚══════╝    [38;5;141m╚══════╝╚═╝  ╚═╝╚═╝╚══════╝╚══════╝╚══════╝
EOF
  echo -e "  ${GRAY}Autonomous AI Agent Intelligence Suite • Built with Obsession by Evan Kristanto${RESET}\n"
}

spinner() {
  local pid=$!
  local delay=0.06
  local spinstr='⠋⠙⠹⠸⠼⠴⠦⠧⠇⠏'
  while ps -p $pid > /dev/null 2>&1; do
    local temp=${spinstr#?}
    printf " ${CYAN}%c${RESET} " "$spinstr"
    spinstr=$temp${spinstr%"$temp"}
    sleep $delay
    printf "\b\b\b"
  done
  printf "   \b\b\b"
}

# --- Repository Paths & Source Discovery ---
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILLS_SRC="$SCRIPT_DIR/skills"

# Fallback: if running via remote pipe `curl | bash`, fetch repo files to temp dir
CLEANUP_TEMP=false
if [ ! -d "$SKILLS_SRC" ]; then
  print_banner
  echo -e " ${BLUE}➜${RESET} Downloading latest ${CYAN}vanzee-skills${RESET} repository from GitHub..."
  TMP_DIR=$(mktemp -d)
  git clone --depth 1 https://github.com/EVANKRISTANTO/vanzee-skills.git "$TMP_DIR/vanzee-skills" > /dev/null 2>&1 &
  spinner
  SKILLS_SRC="$TMP_DIR/vanzee-skills/skills"
  CLEANUP_TEMP=true
fi

# Print Header Banner
print_banner

# --- Step 1: System & Environment Inspection ---
echo -e "${BOLD}${WHITE}╭── [1/4] Environment Inspection ──────────────────────────────────────╮${RESET}"

OS_TYPE="Unknown"
case "$(uname -s)" in
  Darwin*) OS_TYPE="macOS (${BLUE}Darwin${RESET})" ;;
  Linux*)  OS_TYPE="Linux (${BLUE}$(uname -o 2>/dev/null || echo "GNU/Linux")${RESET})" ;;
  CYGWIN*|MINGW*|MSYS*) OS_TYPE="Windows (${BLUE}Git Bash / MSYS${RESET})" ;;
esac
echo -e "${BOLD}${WHITE}│${RESET}  ${GRAY}• Host Operating System:${RESET}  $OS_TYPE"

# Detect AI Agent environments
AGENTS_FOUND=()
[ -d "$HOME/.gemini" ] && AGENTS_FOUND+=("Google Antigravity (${GREEN}Detected${RESET})")
[ -d "$HOME/.claude" ] && AGENTS_FOUND+=("Claude Code (${GREEN}Detected${RESET})")
[ -d "$HOME/.codex" ]  && AGENTS_FOUND+=("OpenAI Codex CLI (${GREEN}Detected${RESET})")

if [ ${#AGENTS_FOUND[@]} -eq 0 ]; then
  echo -e "${BOLD}${WHITE}│${RESET}  ${GRAY}• Target Environments:${RESET}    Defaulting to Antigravity global config"
else
  echo -e "${BOLD}${WHITE}│${RESET}  ${GRAY}• Installed Agents:${RESET}       ${AGENTS_FOUND[*]}"
fi
echo -e "${BOLD}${WHITE}╰───────────────────────────────────────────────────────────────────────╯${RESET}\n"

# --- Step 2: Target Resolution ---
TARGET="${1:-auto}"
DESTINATIONS=()

case "$TARGET" in
  auto)
    # Smart detection: install to all agents present, or fallback to Antigravity
    INSTALLED_ANY=false
    if [ -d "$HOME/.gemini" ]; then
      DESTINATIONS+=("$HOME/.gemini/config/skills")
      INSTALLED_ANY=true
    fi
    if [ -d "$HOME/.claude" ]; then
      DESTINATIONS+=("$HOME/.claude/skills")
      INSTALLED_ANY=true
    fi
    if [ -d "$HOME/.codex" ]; then
      DESTINATIONS+=("$HOME/.codex/skills")
      INSTALLED_ANY=true
    fi
    if [ "$INSTALLED_ANY" = false ]; then
      DESTINATIONS+=("$HOME/.gemini/config/skills")
    fi
    ;;
  antigravity)
    DESTINATIONS+=("$HOME/.gemini/config/skills")
    ;;
  claude)
    DESTINATIONS+=("$HOME/.claude/skills")
    ;;
  codex)
    DESTINATIONS+=("$HOME/.codex/skills")
    ;;
  all)
    DESTINATIONS+=("$HOME/.gemini/config/skills" "$HOME/.claude/skills" "$HOME/.codex/skills")
    ;;
  *)
    echo -e " ${YELLOW}⚠ Invalid target '${TARGET}'.${RESET} Using default Antigravity location."
    DESTINATIONS+=("$HOME/.gemini/config/skills")
    ;;
esac

# --- Step 3: Skill Suite Inventory ---
echo -e "${BOLD}${WHITE}╭── [2/4] Skill Suite Inventory (9 Flagship Skills) ──────────────────╮${RESET}"
echo -e "${BOLD}${WHITE}│${RESET}  ${CYAN}01.${RESET} 💎 ${BOLD}evankristanto${RESET}          ${GRAY}Token Compaction, Bento/Aura UI, Security Shield${RESET}"
echo -e "${BOLD}${WHITE}│${RESET}  ${CYAN}02.${RESET} 📱 ${BOLD}universal-responsive${RESET}  ${GRAY}Container Queries, clamp() Math, Foldables to 4K${RESET}"
echo -e "${BOLD}${WHITE}│${RESET}  ${CYAN}03.${RESET} 🚀 ${BOLD}web-perf-optimizer${RESET}    ${GRAY}100/100 Lighthouse, Sub-second LCP, Zero CLS${RESET}"
echo -e "${BOLD}${WHITE}│${RESET}  ${CYAN}04.${RESET} 🎯 ${BOLD}conversion-copywriting${RESET}${GRAY}Human Voice Engine, B2B Pitch, Landing Page Copy${RESET}"
echo -e "${BOLD}${WHITE}│${RESET}  ${CYAN}05.${RESET} 🔥 ${BOLD}social-caption-maker${RESET}  ${GRAY}Viral Hooks, Social SEO, Gen Z Engagement Engine${RESET}"
echo -e "${BOLD}${WHITE}│${RESET}  ${CYAN}06.${RESET} 🛡️  ${BOLD}risk-management${RESET}       ${GRAY}5x5 Matrix, Pre-Mortem, Zero-Downtime Rollbacks${RESET}"
echo -e "${BOLD}${WHITE}│${RESET}  ${CYAN}07.${RESET} 🧠 ${BOLD}deep-think-planner${RESET}    ${GRAY}Metacognitive First-Principles, Multi-Path Plans${RESET}"
echo -e "${BOLD}${WHITE}│${RESET}  ${CYAN}08.${RESET} 👻 ${BOLD}zero-ai-detector${RESET}      ${GRAY}0% Turnitin/GPTZero Detection Bypass, Burstiness${RESET}"
echo -e "${BOLD}${WHITE}│${RESET}  ${CYAN}09.${RESET} 🎓 ${BOLD}academic-student-support${RESET}${GRAY}Dual-Output Mastery, 6 College Papers, Oral Prep${RESET}"
echo -e "${BOLD}${WHITE}╰───────────────────────────────────────────────────────────────────────╯${RESET}\n"

# --- Step 4: Installation Execution ---
echo -e "${BOLD}${WHITE}╭── [3/4] Installing Skills into Environment ───────────────────────────╮${RESET}"

TOTAL_INSTALLED=0

for dest in "${DESTINATIONS[@]}"; do
  echo -e "${BOLD}${WHITE}│${RESET}  ${BLUE}➜${RESET} Deploying to: ${CYAN}$dest${RESET}"
  mkdir -p "$dest"

  for skill_dir in "$SKILLS_SRC"/*/; do
    [ -d "$skill_dir" ] || continue
    skill_name="$(basename "$skill_dir")"
    cp -R "$skill_dir" "$dest/$skill_name"
    echo -e "${BOLD}${WHITE}│${RESET}    ${GREEN}✔${RESET} Installed ${BOLD}$skill_name${RESET}"
    ((TOTAL_INSTALLED++)) || true
  done
done

echo -e "${BOLD}${WHITE}╰───────────────────────────────────────────────────────────────────────╯${RESET}\n"

# Cleanup temp files if downloaded remotely
if [ "$CLEANUP_TEMP" = true ] && [ -n "${TMP_DIR:-}" ]; then
  rm -rf "$TMP_DIR"
fi

# --- Step 5: Success Summary & Cheat Sheet ---
echo -e "${BOLD}${GREEN}╔═══════════════════════════════════════════════════════════════════════╗${RESET}"
echo -e "${BOLD}${GREEN}║               ⚡ INSTALLATION COMPLETED SUCCESSFULLY!                 ║${RESET}"
echo -e "${BOLD}${GREEN}╚═══════════════════════════════════════════════════════════════════════╝${RESET}"
echo -e " ${BOLD}Total Packages Deployed:${RESET} ${GREEN}${TOTAL_INSTALLED} skills${RESET}"
echo -e " ${BOLD}Active Agent Path(s):${RESET}   ${CYAN}${DESTINATIONS[*]}${RESET}"
echo -e ""
echo -e "${BOLD}${WHITE}🚀 Quick Interactive Prompts to Try Right Now:${RESET}"
echo -e "  ${PURPLE}• Bento UI:${RESET}       ${DIM}\"Bikin dashboard modern bento pakai evankristanto\"${RESET}"
echo -e "  ${PURPLE}• Responsive:${RESET}     ${DIM}\"Refactor landing page ini pakai universal-responsive\"${RESET}"
echo -e "  ${PURPLE}• Performance:${RESET}    ${DIM}\"Audit Core Web Vitals website ini pakai web-perf-optimizer\"${RESET}"
echo -e "  ${PURPLE}• Copywriting:${RESET}    ${DIM}\"Buat landing page value prop pakai conversion-copywriting\"${RESET}"
echo -e "  ${PURPLE}• Viral Caption:${RESET}  ${DIM}\"Bikin caption Instagram carousel pakai social-caption-maker\"${RESET}"
echo -e "  ${PURPLE}• Risk Audit:${RESET}     ${DIM}\"Analisis resiko dan skenario pre-mortem pakai risk-management\"${RESET}"
echo -e "  ${PURPLE}• Deep Think:${RESET}     ${DIM}\"Pikirkan dulu arsitektur terbaik pakai deep-think-planner\"${RESET}"
echo -e "  ${PURPLE}• Stealth AI:${RESET}     ${DIM}\"Humanize artikel ini biar skor AI 0% pakai zero-ai-detector\"${RESET}"
echo -e "  ${PURPLE}• Tugas Kuliah:${RESET}   ${DIM}\"Bantu buat makalah S1 dan panduan ujian pakai academic-student-support\"${RESET}"
echo -e ""
echo -e " ${GRAY}Crafted with passion by Evan Kristanto (Vanzee) • Enjoy your superpower!${RESET}\n"
