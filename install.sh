#!/usr/bin/env bash
set -euo pipefail

PLUGIN_ID="penguine-network"
REPO="https://github.com/sudo-WearTherinG/penguine.network.git"

omarchy plugin disable omarchy.network 2>/dev/null || true

echo "Installing $PLUGIN_ID..."

omarchy plugin add "$REPO" --enable --yes

if omarchy bar move penguine.network --section right --after omarchy.bluetooth 2>/dev/null; then
    echo "Placed penguine.network after Bluetooth."
else
    omarchy bar move penguine.network --section right
    echo "Bluetooth not found; placed penguine.network in the right section."
fi

omarchy restart shell

echo "Installed $PLUGIN_ID successfully."
