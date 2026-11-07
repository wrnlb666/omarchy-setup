#!/usr/bin/env bash
sudo -v

# fonts
./install_fonts.sh

# switch omarchy channel
./install_channel.sh

# add chaotic-aur
./install_chaotic.sh

# omarchy plugins
./install_plugins.sh

# hypr
./install_hypr.sh

# wechat and QQ
./install_tencent.sh

# snapper
./install_snapper.sh

# limine
./install_limine.sh

# ghostty
./install_ghostty.sh

# hooks
./install_hooks.sh

# install environment variable
./install_env.sh
