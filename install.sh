#!/usr/bin/env bash
# ==============================================================================
# ⚡ VANZEE-SKILLS INTERACTIVE INSTALLER
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

print_banner() {
  clear 2>/dev/null || true
  cat << "EOF"

   [38;5;51m██╗   ██╗ █████╗ ███╗   ██╗███████╗███████╗███████╗     [38;5;141m███████╗██╗  ██╗██╗██╗     ██╗     ███████╗
   [38;5;51m██║   ██║██╔══██╗████╗  ██║╚══███╔╝██╔════╝██╔════╝     [38;5;141m██╔════╝██║ ██╔╝██║██║     ██║     ██╔════╝
   [38;5;51m██║   ██║███████║██╔██╗ ██║  ███╔╝ █████╗  █████╗       [38;5;141m███████╗█████╔╝ ██║██║     ██║     ███████╗
   [38;5;51m╚██╗ ██╔╝██╔══██║██║╚██╗██║ ███╔╝  ██╔══╝  ██╔══╝       [38;5;141m╚════██║██╔═██╗ ██║██║     ██║     ╚════██║
   [38;5;51m ╚████╔╝ ██║  ██║██║ ╚████║███████╗███████╗███████╗     [38;5;141m███████║██║  ██╗██║███████╗███████╗███████║
   [38;5;51m  ╚═══╝  ╚═╝  ╚═╝╚═╝  ╚═══╝╚══════╝╚══════╝╚══════╝     [38;5;141m╚══════╝╚═╝  ╚═╝╚═╝╚══════╝╚══════╝╚══════╝
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

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILLS_SRC="$SCRIPT_DIR/skills"

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

print_banner

# --- Step 1: Environment Inspection ---
echo -e "${BOLD}${WHITE}╭── [1/4] Environment Inspection ──────────────────────────────────────╮${RESET}"
OS_TYPE="Unknown"
case "$(uname -s)" in
  Darwin*) OS_TYPE="macOS (${BLUE}Darwin${RESET})" ;;
  Linux*)  OS_TYPE="Linux (${BLUE}$(uname -o 2>/dev/null || echo "GNU/Linux")${RESET})" ;;
  CYGWIN*|MINGW*|MSYS*) OS_TYPE="Windows (${BLUE}Git Bash / MSYS${RESET})" ;;
esac
echo -e "${BOLD}${WHITE}│${RESET}  ${GRAY}• Host Operating System:${RESET}  $OS_TYPE"

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

# --- Step 2: Interactive Skill Selection ---
echo -e "${BOLD}${WHITE}╭── [2/4] Choose Installation Mode ────────────────────────────────────╮${RESET}"
echo -e "${BOLD}${WHITE}│${RESET}  ${GREEN}[A] Full Flagship Suite (All 9 Skills)                   [DEFAULT]${RESET}  ${BOLD}${WHITE}│${RESET}"
echo -e "${BOLD}${WHITE}│${RESET}  ${CYAN}[1] Web & UI/UX Craft Pack     (evankristanto, responsive, perf)    ${RESET} ${BOLD}${WHITE}│${RESET}"
echo -e "${BOLD}${WHITE}│${RESET}  ${CYAN}[2] Growth & Marketing Pack   (copywriting, caption, zero-ai)      ${RESET} ${BOLD}${WHITE}│${RESET}"
echo -e "${BOLD}${WHITE}│${RESET}  ${CYAN}[3] Deep Reasoning & Safety   (deep-think, risk-management)        ${RESET} ${BOLD}${WHITE}│${RESET}"
echo -e "${BOLD}${WHITE}│${RESET}  ${CYAN}[4] Academic & Student Pack   (academic-support, zero-ai)          ${RESET} ${BOLD}${WHITE}│${RESET}"
echo -e "${BOLD}${WHITE}│${RESET}  ${YELLOW}[C] Custom Selection          (Pilih nomor skill manual)           ${RESET} ${BOLD}${WHITE}│${RESET}"
echo -e "${BOLD}${WHITE}╰───────────────────────────────────────────────────────────────────────╯${RESET}\n"

ALL_SKILL_NAMES=(
  "evankristanto"
  "universal-responsive"
  "web-perf-optimizer"
  "conversion-copywriting"
  "social-caption-maker"
  "risk-management"
  "deep-think-planner"
  "zero-ai-detector"
  "academic-student-support"
)

read -r -p "Pilih preset yang mau di-install [A/1/2/3/4/C] (Tekan ENTER untuk Semua): " USER_CHOICE || USER_CHOICE="A"
USER_CHOICE="${USER_CHOICE:-A}"

CHOSEN_SKILLS=()

case "${USER_CHOICE^^}" in
  1)
    CHOSEN_SKILLS=("evankristanto" "universal-responsive" "web-perf-optimizer")
    echo -e "\n${CYAN}➜ Mode Dipilih: [1] Web & UI/UX Craft Pack${RESET}"
    ;;
  2)
    CHOSEN_SKILLS=("conversion-copywriting" "social-caption-maker" "zero-ai-detector")
    echo -e "\n${CYAN}➜ Mode Dipilih: [2] Growth & Marketing Pack${RESET}"
    ;;
  3)
    CHOSEN_SKILLS=("deep-think-planner" "risk-management")
    echo -e "\n${CYAN}➜ Mode Dipilih: [3] Deep Reasoning & Safety Pack${RESET}"
    ;;
  4)
    CHOSEN_SKILLS=("academic-student-support" "zero-ai-detector")
    echo -e "\n${CYAN}➜ Mode Dipilih: [4] Academic & Student Pack${RESET}"
    ;;
  C)
    echo -e "\n${YELLOW}╭── DAFTAR SKILL TERSEDIA ──────────────────────────────────────────────╮${RESET}"
    echo -e "${YELLOW}│${RESET}  [1] [WEB] evankristanto           - Token Compaction, Bento/Aura UI"
    echo -e "${YELLOW}│${RESET}  [2] [MOB] universal-responsive   - Container Queries, clamp() Math"
    echo -e "${YELLOW}│${RESET}  [3] [SPD] web-perf-optimizer     - 100/100 Lighthouse, Sub-second LCP"
    echo -e "${YELLOW}│${RESET}  [4] [CPY] conversion-copywriting  - Human Voice Engine, B2B Pitch"
    echo -e "${YELLOW}│${RESET}  [5] [VIR] social-caption-maker   - Viral Hooks, Social SEO, Gen Z"
    echo -e "${YELLOW}│${RESET}  [6] [RSK] risk-management        - 5x5 Matrix, Pre-Mortem, Rollbacks"
    echo -e "${YELLOW}│${RESET}  [7] [THK] deep-think-planner     - Metacognitive First-Principles"
    echo -e "${YELLOW}│${RESET}  [8] [0AI] zero-ai-detector       - 0% Turnitin/GPTZero Detection Bypass"
    echo -e "${YELLOW}│${RESET}  [9] [EDU] academic-student-support - Dual-Output Mastery, 6 Papers"
    echo -e "${YELLOW}╰───────────────────────────────────────────────────────────────────────╯${RESET}\n"
    read -r -p "Ketik nomor skill yang mau dipasang (contoh: 1 3 5 8): " CUSTOM_NUMS || CUSTOM_NUMS=""
    if [ -z "$CUSTOM_NUMS" ]; then
      CHOSEN_SKILLS=("${ALL_SKILL_NAMES[@]}")
    else
      for num in $CUSTOM_NUMS; do
        idx=$((num - 1))
        if [ "$idx" -ge 0 ] && [ "$idx" -lt "${#ALL_SKILL_NAMES[@]}" ]; then
          CHOSEN_SKILLS+=("${ALL_SKILL_NAMES[$idx]}")
        fi
      done
    fi
    [ ${#CHOSEN_SKILLS[@]} -eq 0 ] && CHOSEN_SKILLS=("${ALL_SKILL_NAMES[@]}")
    ;;
  *)
    CHOSEN_SKILLS=("${ALL_SKILL_NAMES[@]}")
    echo -e "\n${GREEN}➜ Mode Dipilih: [A] Full Flagship Suite (Semua 9 Skill)${RESET}"
    ;;
esac

# Target Resolution
TARGET="${1:-auto}"
DESTINATIONS=()

case "$TARGET" in
  auto)
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
    DESTINATIONS+=("$HOME/.gemini/config/skills")
    ;;
esac

# --- Step 3: Installation Execution ---
echo -e "\n${BOLD}${WHITE}╭── [3/4] Installing Selected Skills ───────────────────────────────────╮${RESET}"

TOTAL_INSTALLED=0

for dest in "${DESTINATIONS[@]}"; do
  echo -e "${BOLD}${WHITE}│${RESET}  ${BLUE}➜${RESET} Deploying to: ${CYAN}$dest${RESET}"
  mkdir -p "$dest"

  for skill_name in "${CHOSEN_SKILLS[@]}"; do
    skill_dir="$SKILLS_SRC/$skill_name"
    if [ -d "$skill_dir" ]; then
      cp -R "$skill_dir" "$dest/$skill_name"
      echo -e "${BOLD}${WHITE}│${RESET}    ${GREEN}✔${RESET} Installed ${BOLD}$skill_name${RESET}"
      ((TOTAL_INSTALLED++)) || true
    fi
  done
done

echo -e "${BOLD}${WHITE}╰───────────────────────────────────────────────────────────────────────╯${RESET}\n"

if [ "$CLEANUP_TEMP" = true ] && [ -n "${TMP_DIR:-}" ]; then
  rm -rf "$TMP_DIR"
fi

# --- Step 4: Success Card & Targeted Prompts ---
echo -e "${BOLD}${GREEN}╔═══════════════════════════════════════════════════════════════════════╗${RESET}"
echo -e "${BOLD}${GREEN}║               ⚡ INSTALLATION COMPLETED SUCCESSFULLY!                 ║${RESET}"
echo -e "${BOLD}${GREEN}╚═══════════════════════════════════════════════════════════════════════╝${RESET}"
echo -e " ${BOLD}Total Selected Packages:${RESET} ${GREEN}${#CHOSEN_SKILLS[@]} skills${RESET}"
echo -e " ${BOLD}Total Target Deployments:${RESET} ${GREEN}${TOTAL_INSTALLED} instances${RESET}"
echo -e " ${BOLD}Active Target Path(s):${RESET}   ${CYAN}${DESTINATIONS[*]}${RESET}"
echo -e ""
echo -e "${BOLD}${WHITE}🚀 Quick Prompts to Try Based on Your Selection:${RESET}"

for sn in "${CHOSEN_SKILLS[@]}"; do
  case "$sn" in
    evankristanto)           echo -e "  ${PURPLE}• Bento UI:${RESET}       ${DIM}\"Bikin dashboard modern bento pakai evankristanto\"${RESET}" ;;
    universal-responsive)    echo -e "  ${PURPLE}• Responsive:${RESET}     ${DIM}\"Refactor landing page ini pakai universal-responsive\"${RESET}" ;;
    web-perf-optimizer)      echo -e "  ${PURPLE}• Performance:${RESET}    ${DIM}\"Audit Core Web Vitals website ini pakai web-perf-optimizer\"${RESET}" ;;
    conversion-copywriting)  echo -e "  ${PURPLE}• Copywriting:${RESET}    ${DIM}\"Buat landing page value prop pakai conversion-copywriting\"${RESET}" ;;
    social-caption-maker)    echo -e "  ${PURPLE}• Viral Caption:${RESET}  ${DIM}\"Bikin caption Instagram carousel pakai social-caption-maker\"${RESET}" ;;
    risk-management)         echo -e "  ${PURPLE}• Risk Audit:${RESET}     ${DIM}\"Analisis resiko dan skenario pre-mortem pakai risk-management\"${RESET}" ;;
    deep-think-planner)      echo -e "  ${PURPLE}• Deep Think:${RESET}     ${DIM}\"Pikirkan dulu arsitektur terbaik pakai deep-think-planner\"${RESET}" ;;
    zero-ai-detector)        echo -e "  ${PURPLE}• Stealth AI:${RESET}     ${DIM}\"Humanize artikel ini biar skor AI 0% pakai zero-ai-detector\"${RESET}" ;;
    academic-student-support)echo -e "  ${PURPLE}• Tugas Kuliah:${RESET}   ${DIM}\"Bantu buat makalah S1 dan panduan ujian pakai academic-student-support\"${RESET}" ;;
  esac
done

echo -e ""
echo -e " ${GRAY}Crafted with passion by Evan Kristanto (Vanzee) • Enjoy your superpower!${RESET}\n"
