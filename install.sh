#!/bin/bash

# Exit script on failure
set -e

# Update Arch and pre-installed packages
pacman -Syu

# Install additional packages
pacman -S - < pkglist.txt

# Install yay
sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si

# Create symlinks
mkdir -p ~/.config/ghostty && ln -sf ~/josv-linux/dotfiles/ghostty/config.ghostty ~/.config/ghostty/config.ghostty
mkdir -p ~/.config/hypr && ln -sf ~/josv-linux/dotfiles/hypr/hyprland.lua ~/.config/hypr/hyprland.lua
mkdir -p ~/.config/nvim && ln -sf ~/josv-linux/dotfiles/nvim/init.lua ~/.config/nvim/init.lua
mkdir -p ~/.config/uwsm && ln -sf ~/josv-linux/dotfiles/uwsm/env ~/.config/uwsm/env
mkdir -p ~/.config/yazi && ln -sf ~/josv-linux/dotfiles/yazi/keymap.toml ~/.config/yazi/keymap.toml
mkdir -p ~/.config/yazi && ln -sf ~/josv-linux/dotfiles/yazi/yazi.toml ~/.config/yazi/yazi.toml
ln -sf ~/josv-linux/dotfiles/zsh/zprofile ~/.zprofile
ln -sf ~/josv-linux/dotfiles/zsh/zshrc ~/.zshrc

# Start/enable systemd services
sudo systemctl start reflector.timer
sudo systemctl enable reflector.timer

sudo systemctl enable fstrim.timer

sudo systemctl start paccache.timer
sudo systemctl enable paccache.timer

systemctl --user enable hyprpolkitagent.service

# Change shell to zsh
chsh -s /bin/zsh

# Reboot
reboot
