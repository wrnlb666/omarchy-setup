#!/usr/bin/env bash

# hypr
echo '[INFO] Installing config for hyprland'
[[ -d ~/.config/hypr ]] || mkdir -p ~/.config/hypr
for f in $(command ls -A hypr); do
    [[ -f "${HOME}/.config/hypr/${f}" ]] && cp "${HOME}/.config/hypr/${f}" "${HOME}/.config/hypr/${f}.bak"
    ln -sf "$(pwd)/hypr/${f}" ~/.config/hypr/
done
