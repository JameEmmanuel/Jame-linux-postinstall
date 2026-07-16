#!/usr/bin/env bash

set -e

echo "Installing minimal KDE Plasma ..."

if command -v apt >/dev/null 2>&1; then
    echo "Detected Debian/Ubuntu."
    # Update package list
    sudo apt update

    # Terminal first
    sudo apt install -y konsole

    # Install minimal Plasma desktop
    sudo apt install -y \
        plasma-desktop \
        sddm \
        dolphin \
        firefox-esr

    # Enable display manager
    sudo systemctl enable sddm

elif command -v dnf >/dev/null 2>&1; then
    echo "Detected Fedora."
    sudo dnf upgrade --refresh -y

    sudo dnf install -y \
        konsole \
        dolphin \
        plasma-discover \
        plasma-desktop \
        plasma-login-manager \
        firefox
    
    # Enable display manager
    sudo systemctl enable plasmalogin
    # Need this because Fedora Everything default this to multi-user.target
    sudo systemctl set-default graphical.target

elif command -v pacman >/dev/null 2>&1; then
    echo "Detected Arch."
    sudo pacman -Syu --noconfirm

    sudo pacman -S --noconfirm \
        konsole \
        dolphin \
        discover \
        plasma-desktop \
        plasma-login-manager \
        firefox
    
    # Enable display manager
    sudo systemctl enable plasmalogin

else
    echo "Unsupported package manager."
    echo "Supported: Arch (pacman), Fedora (dnf), Debian/Ubuntu (apt)"
    exit 1
fi

echo "KDE Plasma installation complete."
echo "Reboot the system to start KDE."