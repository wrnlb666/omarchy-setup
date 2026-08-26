#!/usr/bin/env bash

# update font
omarchy font set "Maple Mono NF CN" >/dev/null
occ update font

# hypr
./install_hypr.sh

# ghostty
./install_ghostty.sh

# add chaotic-aur
./install_chaotic.sh
