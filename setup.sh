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

# --- 4. Deploy Dotfiles (Bare Git Method) ---
# Replace 'username' and 'dotfiles' with your actual GitHub info
DOTFILES_REPO="https://github.com/username/dotfiles.git"

echo "Deploying dotfiles from GitHub..."
git clone --bare $DOTFILES_REPO $HOME/.cfg

# Define the alias locally for the remainder of the script
function config {
   /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@
}

# Backup existing configs just in case
mkdir -p .config-backup
config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}

# Checkout the files
config checkout
config config --local status.showUntrackedFiles no

echo "Setup complete! Please reboot to ensure all groups (like vboxusers) and services are active."
