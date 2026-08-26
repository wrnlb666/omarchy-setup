#!/usr/bin/env bash

# hypr
./install_hypr.sh

# ghostty
./install_ghostty.sh

# add chaotic-aur
./install_chaotic.sh

# update font
omarchy font set "Maple Mono NF CN" >/dev/null
occ update font
