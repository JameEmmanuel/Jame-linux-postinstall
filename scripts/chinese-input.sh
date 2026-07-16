#!/usr/bin/env bash

set -e

echo "Installing Chinese input..."

if command -v dnf >/dev/null 2>&1; then
    echo "Detected Fedora."

    sudo dnf upgrade --refresh -y

    sudo dnf install -y \
        fcitx5 \
        fcitx5-chinese-addons \
        kcm-fcitx5 \
        fcitx5-autostart

elif command -v apt >/dev/null 2>&1; then
    echo "Detected Debian/Ubuntu."

    sudo apt update

    sudo apt install -y \
        fcitx5 \
        fcitx5-chinese-addons \
        kde-config-fcitx5

elif command -v pacman >/dev/null 2>&1; then
    echo "Detected Arch."
    sudo pacman -Syu --noconfirm

    sudo pacman -S --noconfirm \
        fcitx5 \
        fcitx5-chinese-addons \
        fcitx5-configtool

else
    echo "Unsupported package manager."
    echo "Supported: Arch (pacman), Fedora (dnf), Debian/Ubuntu (apt)"
    exit 1
fi

echo "Chinese input installation complete."
echo "Open KDE system settings to configure"

fcitx5-configtool