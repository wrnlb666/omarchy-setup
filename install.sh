#!/usr/bin/env bash
sudo -v

# switch channel to edge
./install_channel_edge.sh

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
