#!/bin/bash

# flatpak
echo -e "\e[32m\n[INFO] Updating flatpak\e[0m"
sudo flatpak update -y
sudo flatpak uninstall --unused -y
