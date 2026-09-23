# Penguine Network

A Wi-Fi/network bar widget for Omarchy, based on the built-in `omarchy.network`.

It provides:

* Wi-Fi connection status
* Wi-Fi signal icon
* Available Wi-Fi networks
* Network connection controls
* Ethernet/network status
* Wi-Fi QR functionality
* Speed-test functionality

## Requirements

* [Omarchy](https://omarchy.org/)
* A working Omarchy installation with the Quickshell bar

## Installation

The easiest way to install Penguine Network is with the installer:

```bash
curl -fsSL https://raw.githubusercontent.com/sudo-WearTherinG/penguine.network/main/install.sh | bash
```

The installer will:

1. Disable the built-in `omarchy.network`.
2. Install `penguine.network`.
3. Enable the plugin.
4. Move it into the right side of the bar.
5. Place it after `omarchy.bluetooth` when Bluetooth is available.
6. Fall back to the right section if Bluetooth is unavailable.
7. Restart the Omarchy shell.

After installation, check the plugin state with:

```bash
omarchy plugin list
```

You should see:

```text
omarchy.network       disabled
penguine.network      enabled
```

## Manual Installation

If you do not want to use the installer:

```bash
omarchy plugin disable omarchy.network
omarchy plugin add https://github.com/sudo-WearTherinG/penguine.network.git --enable --yes
omarchy bar move penguine.network --section right --after omarchy.bluetooth
omarchy restart shell
```

The plugin ID is:

```text
penguine.network
```

## Bar Icon Placement Bug

### Known issue

The Wi-Fi/network widget can occasionally move to an unexpected position on the Omarchy bar.

This is a **bar layout issue**, not a Wi-Fi/network functionality issue.

Omarchy stores the bar layout in:

```text
~/.config/omarchy/shell.json
```

The widget may sometimes appear in another bar section or lose its expected position after changes to the bar configuration.

### Fix

Move the widget back next to Bluetooth:

```bash
omarchy bar move penguine.network --section right --after omarchy.bluetooth
```

Then restart the shell:

```bash
omarchy restart shell
```

You can verify the placement in:

```bash
grep -B5 -A5 '"id": "penguine.network"' ~/.config/omarchy/shell.json
```

If Bluetooth is not available, place the widget in the right section instead:

```bash
omarchy bar move penguine.network --section right
```

Omarchy officially supports moving bar widgets with `omarchy bar move`.

## Uninstall

To remove Penguine Network completely:

```bash
omarchy plugin disable penguine.network
omarchy plugin remove penguine.network
omarchy plugin enable omarchy.network
omarchy restart shell
```

This removes Penguine Network and restores the original Omarchy network widget.

Check the result with:

```bash
omarchy plugin list
```

Expected state:

```text
omarchy.network       enabled
penguine.network      not installed
```

## If the Plugin Is Already Broken

If the plugin directory exists but Omarchy cannot remove it normally, remove the installed checkout manually:

```bash
rm -rf ~/.config/omarchy/plugins/penguine.network
omarchy plugin enable omarchy.network
omarchy restart shell
```

Then verify:

```bash
omarchy plugin list
```

## Updating

Because the plugin is installed from GitHub, future versions can be installed by running:

```bash
omarchy plugin update
```

Omarchy supports updating installed Git-based plugins through its plugin system.

## Security Notice

Omarchy plugins run as code inside the user's shell environment rather than as sandboxed applications. Only install plugins from repositories you trust and review the source before installing third-party plugins.

## Repository

GitHub:

https://github.com/sudo-WearTherinG/penguine.network

## License

See the repository for license information.
