#!/usr/bin/env bash
sudo -v

# switch omarchy channel
./install_channel.sh

# add chaotic-aur
./install_chaotic.sh

# hypr
./install_hypr.sh

# omarchy plugins
./install_plugins.sh

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

# install environment variable
./install_env.sh
