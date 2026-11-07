#!/usr/bin/env bash

# plugins
plugins=(
    "https://github.com/crmne/omarchy-hyprmoncfg.git"
    "https://github.com/sanjyay/Mirador.git"
    "https://github.com/mtolhuys/fathom.git"
    "https://github.com/JJDizz1L/dizziee.system-updates.git"
)

for plugin in "${plugins[@]}"; do
    omarchy plugin add "$plugin" --enable --yes
done
