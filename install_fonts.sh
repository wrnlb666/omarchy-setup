#!/usr/bin/env bash

# install fonts
if ! occ update list | grep 'font' >/dev/null; then
    echo '[INFO] Installing fontconfig and fonts...'
    occ install font
fi
omarchy font set "Maple Mono NF CN" >/dev/null
occ update font
