#!/usr/bin/env bash
set -euo pipefail

CONFIG="/etc/dnf/automatic.conf"

# DNF-only safety check
if ! command -v dnf >/dev/null 2>&1; then
    echo "ERROR: DNF was not detected."
    echo "This script requires a DNF-based system."
    exit 1
fi

echo "DNF detected. Continuing..."

echo "Installing DNF5 automatic updates..."
sudo dnf install -y dnf5-plugin-automatic

echo "Configuring security-only automatic updates..."
sudo tee "$CONFIG" > /dev/null <<'EOF'
[commands]
upgrade_type = security
download_updates = yes
apply_updates = yes
EOF

echo "Enabling automatic update timer..."
sudo systemctl enable --now dnf5-automatic.timer

echo
echo "Configuration:"
sudo cat "$CONFIG"

echo
echo "Timer status:"
systemctl status dnf5-automatic.timer --no-pager

echo
echo "List of timer:"
systemctl list-timers dnf5-automatic.timer