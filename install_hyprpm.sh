#!/usr/bin/env bash
sudo -v

# hyprpm
echo '[INFO] Installing hyprpm and plugins'
[[ -d ~/.config/hypr ]] || mkdir -p ~/.config/hypr
sudo pacman -S --noconfirm --needed base-devel git cpio cmake meson ninja
hyprpm update
hyprpm add https://github.com/hyprwm/hyprland-plugins
hyprpm enable hyprexpo
