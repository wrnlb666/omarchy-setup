#!/usr/bin/env bash

# plugins
plugins=(
    "https://github.com/crmne/omarchy-hyprmoncfg.git"
    # "https://github.com/jitendradara12/omaconnect.git"
    "https://github.com/sanjyay/Mirador.git"
)

for plugin in "${plugins[@]}"; do
    omarchy plugin add "$plugin" --enable --yes
done
