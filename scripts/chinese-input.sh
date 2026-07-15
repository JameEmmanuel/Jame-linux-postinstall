#!/usr/bin/env bash

set -e

echo "Installing Chinese input on Fedora..."

# Update package list
sudo dnf check-update

# Install
sudo dnf install -y \
    fcitx5 \
    fcitx5-chinese-addons

echo "Chinese input installation complete."
echo "Open KDE system settings to configure"