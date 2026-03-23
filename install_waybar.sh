#!/usr/bin/env bash

echo '[INFO] Installing config for waybar'
ln -sf "$(pwd)/waybar/config.jsonc" ~/.config/waybar/config.jsonc
ln -sf "$(pwd)/waybar/style.css" ~/.config/waybar/style.css
