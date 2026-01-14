#!/usr/bin/env bash
sudo -v

echo '[INFO] Installing config for snapper'
for c in "home" "root"; do
    # Number
    sudo snapper -c "${c}" set-config NUMBER_MIN_AGE="0"
    sudo snapper -c "${c}" set-config NUMBER_CLEANUP="yes"
    sudo snapper -c "${c}" set-config NUMBER_LIMIT="10"
    sudo snapper -c "${c}" set-config NUMBER_LIMIT_IMPORTANT="5"

    # Timeline
    sudo snapper -c "${c}" set-config TIMELINE_CREATE="no"
    sudo snapper -c "${c}" set-config TIMELINE_MIN_AGE="0"
    sudo snapper -c "${c}" set-config TIMELINE_CLEANUP="yes"
    sudo snapper -c "${c}" set-config TIMELINE_LIMIT_HOURLY="0"
    sudo snapper -c "${c}" set-config TIMELINE_LIMIT_DAILY="0"
    sudo snapper -c "${c}" set-config TIMELINE_LIMIT_WEEKLY="5"
    sudo snapper -c "${c}" set-config TIMELINE_LIMIT_MONTHLY="0"
    sudo snapper -c "${c}" set-config TIMELINE_LIMIT_QUARTERLY="0"
    sudo snapper -c "${c}" set-config TIMELINE_LIMIT_YEARLY="0"
done
