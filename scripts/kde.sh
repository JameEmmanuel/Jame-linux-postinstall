#!/usr/bin/env bash

set -e

echo "Installing minimal KDE Plasma on Debian..."

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

echo "KDE Plasma installation complete."
echo "Reboot the system to start KDE."