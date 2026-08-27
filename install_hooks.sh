#!/usr/bin/env bash

echo '[INFO] Installing hooks'
for hook in hooks/*; do
    name="$(basename "$hook")"
    target="${HOME}/.config/omarchy/hooks/${name}"

    if [[ -f "$hook" ]]; then
        ln -sf "$(pwd)/${hook}" "$target"
    elif [[ -d "$hook" ]]; then
        [[ -d "$target" ]] || mkdir -p "$target"
        for file in "$hook"/*; do
            [[ -e "$file" ]] || continue

            ln -sf "$(pwd)/${file}" \
                "$target/$(basename "$file")"
        done
    fi
done
