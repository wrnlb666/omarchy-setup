#!/usr/bin/env bash

# hypr
echo '[INFO] Installing config for hyprland'
[[ -d ~/.config/hypr ]] || mkdir -p ~/.config/hypr
hyprpm update
hyprpm add https://github.com/hyprwm/hyprland-plugins
hyprpm enable hyprexpo
for f in $(command ls hypr); do
    [[ -f "~/.config/hypr/${f}" ]] && cp "~/.config/hypr/${f}" "~/.config/hypr/${f}.bak"
    ln -sf "$(pwd)/hypr/${f}" ~/.config/hypr/
done
echo '[WARN] Remeber to config `~/.config/hypr/monitors.conf` manually'
