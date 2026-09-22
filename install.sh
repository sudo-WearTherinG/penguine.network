#!/usr/bin/env bash
set -euo pipefail

PLUGIN_ID="penguine.network"
PLUGIN_DIR="$HOME/.config/omarchy/plugins/$PLUGIN_ID"
REPO="https://github.com/sudo-WearTherinG/penguine.network.git"

echo "Installing $PLUGIN_ID..."

mkdir -p "$(dirname "$PLUGIN_DIR")"

if [ -d "$PLUGIN_DIR/.git" ]; then
    git -C "$PLUGIN_DIR" pull --ff-only
else
    git clone "$REPO" "$PLUGIN_DIR"
fi

omarchy plugin enable "$PLUGIN_ID"
omarchy restart shell

echo "Installed $PLUGIN_ID successfully."
