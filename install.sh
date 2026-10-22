#!/usr/bin/env bash
# Evan Kristanto Skills Suite - One-line installer for Linux & macOS
# Supports Antigravity, Claude Code, and Codex CLI

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILLS_SRC="$SCRIPT_DIR/skills"

TARGET="${1:-antigravity}"

case "$TARGET" in
  antigravity)
    DESTS=("$HOME/.gemini/config/skills")
    ;;
  claude)
    DESTS=("$HOME/.claude/skills")
    ;;
  codex)
    DESTS=("$HOME/.codex/skills")
    ;;
  all)
    DESTS=("$HOME/.gemini/config/skills" "$HOME/.claude/skills" "$HOME/.codex/skills")
    ;;
  *)
    echo "Usage: ./install.sh [antigravity|claude|codex|all]"
    exit 1
    ;;
esac

for dest in "${DESTS[@]}"; do
  echo "Installing skills to: $dest"
  mkdir -p "$dest"
  for skill_dir in "$SKILLS_SRC"/*/; do
    skill_name="$(basename "$skill_dir")"
    cp -R "$skill_dir" "$dest/$skill_name"
    echo "  -> Installed $skill_name"
  done
done

echo ""
echo "All Evan Kristanto skills installed successfully!"
echo "Restart your AI coding agent or start a new prompt session."
