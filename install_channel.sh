#!/usr/bin/env bash

if ! [[ "$(omarchy channel current)" == "stable" ]]; then
    echo '[INFO] Setting Omarchy channel'
    omarchy channel set stable
fi
