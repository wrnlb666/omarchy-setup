#!/usr/bin/env bash

echo '[INFO] Installing hooks'
for fi in hooks/*; do
    ln -sf "$(pwd)/${fi}" "${HOME}/.config/omarchy/hooks/$(basename "$fi")"
done
