#!/usr/bin/env bash
sudo -v

# hypr
echo '[INFO] Installing config for hyprland'
[[ -d ~/.config/hypr ]] || mkdir -p ~/.config/hypr
sudo pacman -S --noconfirm --needed base-devel git cpio cmake meson ninja
hyprpm update
hyprpm add https://github.com/hyprwm/hyprland-plugins
hyprpm enable hyprexpo
for f in $(command ls hypr); do
    [[ -f "~/.config/hypr/${f}" ]] && cp "~/.config/hypr/${f}" "~/.config/hypr/${f}.bak"
    ln -sf "$(pwd)/hypr/${f}" ~/.config/hypr/
done
echo '[WARN] Remeber to config `~/.config/hypr/monitors.conf` manually'
