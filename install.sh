#!/bin/bash

# Exit script on failure
set -e

# Install additional packages
sudo pacman -S --noconfirm - <~/josv-linux/pkglist.txt

# Install yay
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

# Install catppuccin cursor
yay -S catppuccin-cursors-mocha

# Create symlinks
mkdir -p ~/.config/ghostty
ln -sf ~/josv-linux/dotfiles/ghostty/config.ghostty ~/.config/ghostty/config.ghostty

mkdir -p ~/.config/hypr
ln -sf ~/josv-linux/dotfiles/hypr/hyprland.lua ~/.config/hypr/hyprland.lua

mkdir -p ~/.config/uwsm
ln -sf ~/josv-linux/dotfiles/uwsm/env ~/.config/uwsm/env

mkdir -p ~/.config/yazi
ln -sf ~/josv-linux/dotfiles/yazi/keymap.toml ~/.config/yazi/keymap.toml
ln -sf ~/josv-linux/dotfiles/yazi/yazi.toml ~/.config/yazi/yazi.toml
ln -sf ~/josv-linux/dotfiles/yazi/theme.toml ~/.config/yazi/theme.toml

ln -sf ~/josv-linux/dotfiles/zsh/zprofile ~/.zprofile
ln -sf ~/josv-linux/dotfiles/zsh/zshrc ~/.zshrc

mkdir -p ~/.config/noctalia
ln -sf ~/josv-linux/dotfiles/noctalia/config.toml ~/.config/noctalia/config.toml

mkdir -p ~/.config/fontconfig
ln -sf ~/josv-linux/dotfiles/fontconfig/fonts.conf ~/.config/fontconfig/fonts.conf

sudo mkdir -p /etc/keyd
sudo ln -sf ~/josv-linux/dotfiles/keyd/default.conf /etc/keyd/default.conf

mkdir -p ~/.config/lazygit
ln -sf ~/josv-linux/dotfiles/lazygit/config.yml ~/.config/lazygit/config.yml

# Start/enable systemd services
sudo systemctl start reflector.timer
sudo systemctl enable reflector.timer

sudo systemctl enable fstrim.timer

sudo systemctl start paccache.timer
sudo systemctl enable paccache.timer

sudo systemctl enable --now keyd

# Change shell to zsh
chsh -s /bin/zsh

# Set up git config
git config --global user.email "99josv20@gmail.com"
git config --global user.name "JoSv"

# Login to GitHub and authorize
gh auth login -p https

# Reboot
#reboot
