#!/usr/bin/env bash

[[ -d ~/.local/share/applications ]] || mkdir -p ~/.local/share/applications/
cp -f "$(pwd)/tencent/com.qq.QQ.desktop" ~/.local/share/applications/
cp -f "$(pwd)/tencent/com.tencent.WeChat.desktop" ~/.local/share/applications/

[[ -d ~/.config/omarchy/plugins ]] || mkdir -p ~/.config/omarchy/plugins/
[[ -d ~/.config/omarchy/plugins/tencent-tray ]] && rm -rf ~/.config/omarchy/plugins/tencent-tray
cp -rf "$(pwd)/tencent/tencent-tray" ~/.config/omarchy/plugins/tencent-tray

omarchy plugin enable wrnlb.chat-tray
