#!/usr/bin/env bash

[[ -d ~/.local/share/applications ]] || mkdir -p ~/.local/share/applications/
ln -sf "$(pwd)/tencent/com.qq.QQ.desktop" ~/.local/share/applications/
ln -sf "$(pwd)/tencent/com.tencent.WeChat.desktop" ~/.local/share/applications/

[[ -d ~/.config/omarchy/plugins ]] || mkdir -p ~/.config/omarchy/plugins/
[[ -d ~/.config/omarchy/plugins/tencent-tray ]] && rm -rf ~/.config/omarchy/plugins/tencent-tray
ln -sf "$(pwd)/tencent/tencent-tray" ~/.config/omarchy/plugins/tencent-tray

omarchy plugin enable wrnlb.chat-tray
