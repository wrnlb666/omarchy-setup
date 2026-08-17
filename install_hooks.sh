#!/usr/bin/env bash

echo '[INFO] Installing hooks'
for hook in hooks/*; do
    ln -sf "$(pwd)/${hook}" "${HOME}/.config/omarchy/hooks/$(basename "$hook")"
done
