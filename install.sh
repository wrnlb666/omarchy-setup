#!/usr/bin/env bash
sudo -v

# waybar
./install_waybar.sh

# add chaotic-aur
./install_chaotic.sh

# hypr
./install_hypr.sh

# snapper
./install_snapper.sh

# limine
./install_limine.sh

# alacritty
./install_alacritty.sh

# ghostty
./install_ghostty.sh

# hooks
./install_hooks.sh

# switch channel to edge
./install_channel_edge.sh
