#!/usr/bin/env bash
sudo -v

# bashrc
echo '[INFO] Installing config for bashrc'
ln -sf "$(pwd)/bash/bashrc.sh" ~/.bashrc.local
if ! grep -Fq '# my bash config' ~/.bashrc; then
    echo "# my bash config" >> ~/.bashrc
    echo "if [[ -r ~/.bashrc.local ]]; then" >> ~/.bashrc
    echo "    source ~/.bashrc.local" >> ~/.bashrc
    echo "fi" >> ~/.bashrc
fi

# hypr
echo '[INFO] Installing config for hyprland'
[[ -d ~/.config/hypr ]] || mkdir -p ~/.config/hypr
for f in $(command ls hypr); do
    [[ -f "~/.config/hypr/${f}" ]] && cp "~/.config/hypr/${f}" "~/.config/hypr/${f}.bak"
    ln -f "$(pwd)/hypr/${f}" ~/.config/hypr/
done
echo '[WARN] Remeber to config `~/.config/hypr/monitors.conf` manually'

# snapper
echo '[INFO] Installing config for snapper'
for c in "home" "root"; do
    sudo snapper -c "${c}" set-config TIMELINE_CREATE="no"
    sudo snapper -c "${c}" set-config NUMBER_LIMIT="5"
    sudo snapper -c "${c}" set-config NUMBER_LIMIT="5"
    sudo snapper -c "${c}" set-config NUMBER_MIN_AGE="600"
    sudo snapper -c "${c}" set-config NUMBER_LIMIT_IMPORTANT="5"
done

# limine
sudo sed -i 's/^MAX_SNAPSHOT_ENTRIES=5$/MAX_SNAPSHOT_ENTRIES=20/' '/etc/default/limine'
sudo sed -i 's/^SNAPSHOT_FORMAT_CHOICE=5$/SNAPSHOT_FORMAT_CHOICE=20/' '/etc/default/limine'

# alacritty
ln -sf "$(pwd)/alacritty/alacritty.toml" ~/.config/alacritty/alacritty.toml
