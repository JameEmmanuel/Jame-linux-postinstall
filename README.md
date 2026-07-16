# Jame's Linux Post-Install Script

A personal automation script for setting up a fresh Linux installation.

This project is designed to automate common post-installation tasks so a new system can be configured with a single command.

## Features

- 🖥️ Desktop and server installation profiles
- 🎮 NVIDIA driver installation (where applicable)
- 🎵 Multimedia codec installation
- 🖥️ Minimal KDE Plasma installation
- 🌏 Chinese input method (Fcitx5)
- 📦 Installation of my commonly used software
- ⚙️ Easily extendable with additional scripts

## Supported Distributions

- Arch
- Fedora
- Debian

Support for additional distributions may be added in the future.

## Quick Start

Run the bootstrap script:

```bash
curl -fsSL https://raw.githubusercontent.com/JameEmmanuel/Jame-linux-postinstall/main/bootstrap.sh | bash
```

The bootstrap script will:

1. Install any required dependencies.
2. Clone this repository.
3. Launch the post-installation menu.

## Manual Installation

```bash
git clone https://github.com/JameEmmanuel/Jame-linux-postinstall.git
cd Jame-linux-postinstall
chmod +x main.sh
./main.sh
```

## Current Menu

- Fedora Desktop Setup
- Fedora Extra Software
- Debian Server Setup
- Minimal KDE Plasma
- Chinese Input Method (Fcitx5)

## Project Structure

```text
configs/
├── debian-server.toml
├── fedora-desktop.toml
└── fedora-extra-software.toml

scripts/
├── chinese-input.sh
└── kde.sh

bootstrap.sh
main.sh
```

## License

This project is licensed under the MIT License.