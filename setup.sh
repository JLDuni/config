#!/bin/bash

echo "Updating system and installing base-devel..."
sudo pacman -Syu --noconfirm
sudo pacman -S --needed base-devel git --noconfirm

if ! command -v yay &> /dev/null; then
    echo "yay not found. Installing yay..."
    git clone https://aur.archlinux.org/yay.git /tmp/yay
    cd /tmp/yay && makepkg -si --noconfirm
    cd -
fi

echo "Installing software packages..."
OFFICIAL_PKGS=(
    "gns3-gui" "gns3-server" "virtualbox" "github-cli" "glab" 
    "go" "neovim" "tmux" "kitty" "waybar" "nautilus" 
    "libreoffice-fresh" "python-matplotlib" "systemd" "tigervnc"
    "xsettingsd" "hyprland" "dconf" "pulseaudio" "networkmanager"
    "hypridle" "hyprpaper" "hyprlock" 
)

AUR_PKGS=(
    "nwg-look" "spotify" "networkmanager-dmenu-git"
)

yay -S --needed "${OFFICIAL_PKGS[@]}" "${AUR_PKGS[@]}" --noconfirm
