#!/usr/bin/env bash

set -e

install_package() {
    PACKAGE="$1"

    if command -v apt >/dev/null 2>&1; then
        sudo apt update
        sudo apt install -y "$PACKAGE"

    elif command -v dnf >/dev/null 2>&1; then
        sudo dnf install -y "$PACKAGE"

    elif command -v pacman >/dev/null 2>&1; then
        sudo pacman -Sy --noconfirm "$PACKAGE"

    elif command -v zypper >/dev/null 2>&1; then
        sudo zypper install -y "$PACKAGE"

    elif command -v apk >/dev/null 2>&1; then
        sudo apk add "$PACKAGE"

    else
        echo "Unsupported package manager."
        exit 1
    fi
}

check_dependency() {
    if ! command -v "$1" >/dev/null 2>&1; then
        echo "$1 is missing. Installing..."
        install_package "$1"
    fi
}

# Required tools
check_dependency curl

# Colors
GREEN="\033[0;32m"
RESET="\033[0m"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "=============================="
echo " Linux Post Install Setup"
echo "=============================="
echo

echo "Choose what to install:"
echo
echo "1) Fedora Desktop setup"
echo "2) Fedora Extra software"
echo "3) Debian Server setup"
echo "4) Debian Minimal KDE"
echo "5) Chinese input method (Fcitx5)"
echo "0) Exit"
echo

read -p "Choice: " choice

case "$choice" in

1)
    echo -e "${GREEN}Running Fedroa desktop setup...${RESET}"

    curl -fsSL https://christitus.com/linux -o /tmp/linutil.sh

    bash /tmp/linutil.sh \
        --config "$SCRIPT_DIR/configs/fedora-desktop.toml"
    ;;

2)
    echo -e "${GREEN}Installing Fedora extra software...${RESET}"

    curl -fsSL https://christitus.com/linux -o /tmp/linutil.sh

    bash /tmp/linutil.sh \
        --config "$SCRIPT_DIR/configs/fedora-extra-software.toml"
    ;;

3)
    echo -e "${GREEN}Running Debian server setup...${RESET}"

    curl -fsSL https://christitus.com/linux -o /tmp/linutil.sh

    bash /tmp/linutil.sh \
        --config "$SCRIPT_DIR/configs/debian-server.toml"
    ;;

4)
    echo -e "${GREEN}Installing minimal KDE on Debian...${RESET}"

    bash "$SCRIPT_DIR/scripts/kde.sh"
    ;;

5)
    echo -e "${GREEN}Installing Chinese input method on Fedora KDE...${RESET}"

    bash "$SCRIPT_DIR/scripts/chinese-input.sh"
    ;;

0)
    echo "Bye!"
    exit 0
    ;;

*)
    echo "Invalid option"
    exit 1
    ;;

esac

echo
echo -e "${GREEN}Done!${RESET}"