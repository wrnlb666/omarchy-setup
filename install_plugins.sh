#!/usr/bin/env bash

# plugins
plugins=(
    "https://github.com/crmne/omarchy-hyprmoncfg.git"
    "https://github.com/jitendradara12/omaconnect.git"
)

for plugin in "${plugins[@]}"; do
    omarchy plugin add "$plugin" --enable --yes
done
