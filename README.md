# Penguine Network

A network manager widget for Omarchy, based on `omarchy.network`.

## Features

* Wi-Fi network list and connection status
* Multiple Wi-Fi adapter support
* Per-adapter ON/OFF switches
* Rescan available networks by pressing **`r`** while the Wi-Fi UI is open
* Forget saved Wi-Fi networks
* Ethernet status
* Wi-Fi signal icons
* QR code for the connected Wi-Fi
* Speed test
* Automatically replaces `omarchy.network`

## Install

Run:

```bash
curl -fsSL https://raw.githubusercontent.com/sudo-WearTherinG/penguine.network/main/install.sh | bash
```

The installer disables the original `omarchy.network`, installs and enables Penguine Network, places it after Bluetooth on the bar, and restarts the shell.

Check:

```bash
omarchy plugin list
```

You should see:

```text
omarchy.network       disabled
penguine.network      enabled
```

## Wi-Fi Controls

Open the Wi-Fi UI to manage networks.

### Rescan Networks

Press:

```text
r
```

while the Wi-Fi UI is open to rescan available networks.

### Multiple Wi-Fi Adapters

If multiple Wi-Fi adapters are available, each adapter has its own switch.

You can turn individual adapters **ON or OFF** without disabling the others.

### Forget a Network

Select a saved Wi-Fi network and use the **Forget Network** option to remove its saved connection.

## Bar Icon Moving Issue

Sometimes Omarchy may move the network widget to a different position on the bar.

To put it back after Bluetooth:

```bash
omarchy bar move penguine.network --section right --after omarchy.bluetooth
omarchy restart shell
```

If Bluetooth is unavailable:

```bash
omarchy bar move penguine.network --section right
omarchy restart shell
```

## Uninstall

Run:

```bash
omarchy plugin disable penguine.network
omarchy plugin remove penguine.network
omarchy plugin enable omarchy.network
omarchy restart shell
```

This removes Penguine Network and restores the original Omarchy network widget.

## GitHub

Repository:

https://github.com/sudo-WearTherinG/penguine.network
