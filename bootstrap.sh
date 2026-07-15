#!/usr/bin/env bash

set -e

if command -v apt >/dev/null 2>&1; then
    sudo apt update
    sudo apt install -y git
elif command -v dnf >/dev/null 2>&1; then
    sudo dnf install -y git
elif command -v pacman >/dev/null 2>&1; then
    sudo pacman -Sy --noconfirm git
fi

git clone https://github.com/JameEmmanuel/Jame-linux-postinstall.git

cd Jame-linux-postinstall

./main.sh