#!/bin/bash

# flatpak
echo -e "\e[32m\n[INFO] Updating flatpak\e[0m"
flatpak update -y
flatpak uninstall --unused -y
