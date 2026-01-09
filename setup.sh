#!/bin/env bash

sudo wget "https://raw.githubusercontent.com/por-cli/por-cli/refs/heads/main/por-cli" -O "/usr/local/bin"
sudo chmod +x "/usr/local/bin/por-cli"

HIS="${XDG_STATE_HOME:-$HOME/.local/state}/por-cli/watch.history"
mkdir -p "$(dirname "$HIS")"
touch "$HIS"

