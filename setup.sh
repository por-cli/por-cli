#!/usr/bin/env bash

COMMON_DEPS=(curl sed mpv fzf wget jq chafa yt-dlp)
MAC_DEPS=(ggrep gshuf)
MISSING=()
OS=$(uname -s)

# detect mac
if [ "$OS" = "Linux" ]; then
  DEPS=("${COMMON_DEPS[@]}")
elif [ "$OS" = "Darwin" ]; then
  DEPS=("${COMMON_DEPS[@]}" "${MAC_DEPS[@]}")
fi

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

DOWNLOAD_URL=$(curl -fsSL https://api.github.com/repos/por-cli/por-cli/releases/latest | jq -r '.assets[] | select(.name == "por-cli") | .browser_download_url')

if [ -z "$DOWNLOAD_URL" ] || [ "$DOWNLOAD_URL" = "null" ]; then
  echo "Error: Could not find por-cli in the latest release."
  exit 1
fi

if [ -n "$TERMUX_VERSION" ]; then
  wget "$DOWNLOAD_URL" -O "$PREFIX/bin/por-cli" &&
    chmod +x "$PREFIX/bin/por-cli"
else
  sudo wget "$DOWNLOAD_URL" -O "/usr/local/bin/por-cli" &&
    sudo chmod +x "/usr/local/bin/por-cli"
fi

HIS="${XDG_STATE_HOME:-$HOME/.local/state}/por-cli/watch.history"
mkdir -p "$(dirname "$HIS")"
touch "$HIS"
