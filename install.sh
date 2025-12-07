#!/usr/bin/env bash
sudo -v

# hypr
echo '[INFO] Installing config for hyprland'
[[ -d ~/.config/hypr ]] || mkdir -p ~/.config/hypr
hyprpm update
hyprpm add https://github.com/hyprwm/hyprland-plugins
hyprpm enable hyprexpo
hyprpm enable hyprscrolling
for f in $(command ls hypr); do
    [[ -f "~/.config/hypr/${f}" ]] && cp "~/.config/hypr/${f}" "~/.config/hypr/${f}.bak"
    ln -sf "$(pwd)/hypr/${f}" ~/.config/hypr/
done
echo '[WARN] Remeber to config `~/.config/hypr/monitors.conf` manually'

# snapper
echo '[INFO] Installing config for snapper'
for c in "home" "root"; do
    # Number
    sudo snapper -c "${c}" set-config NUMBER_MIN_AGE="0"
    sudo snapper -c "${c}" set-config NUMBER_CLEANUP="yes"
    sudo snapper -c "${c}" set-config NUMBER_LIMIT="10"
    sudo snapper -c "${c}" set-config NUMBER_LIMIT_IMPORTANT="5"

    # Timeline
    sudo snapper -c "${c}" set-config TIMELINE_CREATE="no"
    sudo snapper -c "${c}" set-config TIMELINE_MIN_AGE="0"
    sudo snapper -c "${c}" set-config TIMELINE_CLEANUP="yes"
    sudo snapper -c "${c}" set-config TIMELINE_LIMIT_HOURLY="0"
    sudo snapper -c "${c}" set-config TIMELINE_LIMIT_DAILY="0"
    sudo snapper -c "${c}" set-config TIMELINE_LIMIT_WEEKLY="5"
    sudo snapper -c "${c}" set-config TIMELINE_LIMIT_MONTHLY="0"
    sudo snapper -c "${c}" set-config TIMELINE_LIMIT_QUARTERLY="0"
    sudo snapper -c "${c}" set-config TIMELINE_LIMIT_YEARLY="0"
done

# limine
echo '[INFO] Installing config for limine'
sudo sed -E -i 's/^MAX_SNAPSHOT_ENTRIES=[0-9]+$/MAX_SNAPSHOT_ENTRIES=30/' '/etc/default/limine'
sudo sed -E -i 's/^SNAPSHOT_FORMAT_CHOICE=[0-9]+$/SNAPSHOT_FORMAT_CHOICE=30/' '/etc/default/limine'

# alacritty
ln -sf "$(pwd)/alacritty/alacritty.toml" ~/.config/alacritty/alacritty.toml

# ghostty
ln -sf "$(pwd)/ghostty/config" ~/.config/ghostty/config
