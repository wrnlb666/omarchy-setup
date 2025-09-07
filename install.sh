#!/usr/bin/env bash
sudo -v

# bashrc
echo '[INFO] Installing config for bashrc'
ln -sf "$(pwd)/bash/bashrc.sh" ~/.bashrc.local
echo "# my bash config" >> ~/.bashrc
echo "if [[ -r ~/.bashrc.local ]]; then" >> ~/.bashrc
echo "    source ~/.bashrc.local" >> ~/.bashrc
echo "fi" >> ~/.bashrc

# hypr
echo '[INFO] Installing config for hyprland'
[[ -d ~/.config/hypr ]] || mkdir -p ~/.config/hypr
for f in $(command ls hypr); do
    ln -sf "$(pwd)/hypr/${f}" ~/.config/hypr/
done
echo '[WARN] Remeber to config `~/.config/hypr/monitors.conf` manually'

# snapper
echo '[INFO] Installing config for snapper'
for c in "home" "root"; do
    sudo ln -sf "$(pwd)/snapper/${c}" "/etc/snapper/configs/${c}"
done

# limine
sudo sed -i 's/^MAX_SNAPSHOT_ENTRIES=5$/MAX_SNAPSHOT_ENTRIES=20/' '/etc/default/limine'
sudo sed -i 's/^SNAPSHOT_FORMAT_CHOICE=5$/SNAPSHOT_FORMAT_CHOICE=20/' '/etc/default/limine'
