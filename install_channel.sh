#!/usr/bin/env bash

if ! [[ "$(omarchy channel current)" == "edge" ]]; then
    echo '[INFO] Setting Omarchy channel'
    omarchy channel set edge
fi
