#!/bin/bash


# Exit script on failure
set -e


# Install additional packages
sudo pacman -S --noconfirm - <~/josv-linux/pkglist.txt


# Install yay
git clone https://aur.archlinux.org/yay.git
cd yay
yes "" | makepkg -si


# Install catppuccin cursor
yes "" | yay -S catppuccin-cursors-mocha

# Create symlinks
DOTFILES="${HOME}/josv-linux/dotfiles/"
CONFIG="${HOME}/.config/"

ln -sf ${DOTFILES}ghostty    			     ${CONFIG}ghostty

ln -sf ${DOTFILES}hypr       			     ${CONFIG}hypr

ln -sf ${DOTFILES}uwsm       			     ${CONFIG}uwsm

ln -sf ${DOTFILES}yazi       			     ${CONFIG}yazi

ln -sf ${DOTFILES}noctalia   			     ${CONFIG}noctalia

ln -sf ${DOTFILES}fontconfig 			     ${CONFIG}fontconfig

ln -sf ${DOTFILES}lazygit    			     ${CONFIG}lazygit


ln -sf ~/josv-linux/dotfiles/zsh/zprofile ~/.zprofile
ln -sf ~/josv-linux/dotfiles/zsh/zshrc ~/.zshrc


sudo ln -sf ${DOTFILES}keyd/default.conf /etc/keyd/default.conf

sudo ln -sf ${DOTFILES}grub/grub /etc/default/grub 


# Generate GRUB config
sudo grub-mkconfig -o /boot/grub/grub.cfg


# Start/enable systemd services
sudo systemctl start reflector.timer
sudo systemctl enable reflector.timer

sudo systemctl start paccache.timer
sudo systemctl enable paccache.timer

sudo systemctl enable fstrim.timer

sudo systemctl enable keyd


# Change shell to zsh
chsh -s /bin/zsh


# Set up git config
git config --global user.email "99josv20@gmail.com"
git config --global user.name "JoSv"


# Login to GitHub and authorize
gh auth login -h github.com -p https -w


# Reboot
reboot
