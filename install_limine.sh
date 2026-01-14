#!/usr/bin/env bash
sudo -v

echo '[INFO] Installing config for limine'
sudo sed -E -i 's/^MAX_SNAPSHOT_ENTRIES=[0-9]+$/MAX_SNAPSHOT_ENTRIES=30/' '/etc/default/limine'
sudo sed -E -i 's/^SNAPSHOT_FORMAT_CHOICE=[0-9]+$/SNAPSHOT_FORMAT_CHOICE=30/' '/etc/default/limine'
