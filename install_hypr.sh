#!/usr/bin/env bash

# hypr
echo '[INFO] Installing config for hyprland'
[[ -d ~/.config/hypr ]] || mkdir -p ~/.config/hypr
for path in hypr/*; do
    conf="${path##*/}"
    [[ -f "${HOME}/.config/hypr/${conf}" ]] &&
        cp \
            "${HOME}/.config/hypr/${conf}" \
            "${HOME}/.config/hypr/${conf}.bak"
    cp -f "$(pwd)/hypr/${conf}" ~/.config/hypr/
done
