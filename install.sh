#!/usr/bin/env bash
set -euo pipefail

PLUGIN_ID="penguine.network"
REPO="https://github.com/sudo-WearTherinG/penguine.network.git"

echo "Installing $PLUGIN_ID..."

omarchy plugin add "$REPO" --enable
omarchy restart shell

echo "Installed $PLUGIN_ID successfully."
