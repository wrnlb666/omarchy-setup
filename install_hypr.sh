#!/usr/bin/env bash
sudo -v

# hypr
echo '[INFO] Installing config for hyprland'
[[ -d ~/.config/hypr ]] || mkdir -p ~/.config/hypr
for f in $(command ls hypr); do
    [[ -f "${HOME}/.config/hypr/${f}" ]] && cp "${HOME}/.config/hypr/${f}" "${HOME}/.config/hypr/${f}.bak"
    ln -sf "$(pwd)/hypr/${f}" ~/.config/hypr/
done
echo "[WARN] Remeber to config \`~/.config/hypr/monitors.conf\` manually"
