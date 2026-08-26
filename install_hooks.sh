#!/usr/bin/env bash

echo '[INFO] Installing hooks'
for hook in hooks/*; do
    cp -rf "$(pwd)/${hook}" "${HOME}/.config/omarchy/hooks/$(basename "$hook")"
done
