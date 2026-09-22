#!/usr/bin/env bash
set -euo pipefail

PLUGIN_ID="penguine-network"
REPO="https://github.com/sudo-WearTherinG/penguine.network.git"

omarchy plugin disable omarchy.network 2>/dev/null || true

echo "Installing $PLUGIN_ID..."

omarchy plugin add "$REPO" --enable --yes
omarchy bar move penguine.network --after omarchy.bluetooth
omarchy restart shell

echo "Installed $PLUGIN_ID successfully."
