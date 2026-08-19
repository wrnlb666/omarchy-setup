#!/usr/bin/env bash

# environment
echo '[INFO] Installing environment variable'
[[ -d ~/.config/environment.d ]] || mkdir -p ~/.config/environment.d
for path in environment/*.conf; do
    envi="${path##*/}"
    [[ -f "${HOME}/.config/environment.d/${envi}" ]] &&
        cp \
            "${HOME}/.config/environment.d/${envi}" \
            "${HOME}/.config/environment.d/${envi}.bak"
    ln -sf "$(pwd)/environment/${envi}" ~/.config/environment.d/
done
echo "Logout and login again to take effect"
