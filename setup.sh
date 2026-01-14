#!/bin/env bash

DEPS=(curl sed mpv fzf kitty wget)
MISSING=()


for dep in "${DEPS[@]}"; do
    if ! command -v "$dep" >/dev/null 2>&1; then
        MISSING+=("$dep")
    fi
done

if (( ${#MISSING[@]} > 0 )); then
  echo "Missing dependencies (please install):"
    printf ' - %s\n' "${MISSING[@]}"
    exit 2
fi

if [ -n "$TERMUX_VERSION" ]; then
  wget "https://raw.githubusercontent.com/por-cli/por-cli/refs/heads/main/por-cli" -O "/data/data/com.termux/files/usr/bin/por-cli" &&
     chmod +x "/usr/local/bin/por-cli"
else
  sudo wget "https://raw.githubusercontent.com/por-cli/por-cli/refs/heads/main/por-cli" -O "/data/data/com.termux/files/usr/bin/por-cli" &&
    sudo chmod +x "/usr/local/bin/por-cli"
fi

HIS="${XDG_STATE_HOME:-$HOME/.local/state}/por-cli/watch.history"
mkdir -p "$(dirname "$HIS")"
touch "$HIS"

