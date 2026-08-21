import QtQuick
import Quickshell
import Quickshell.Services.SystemTray

Item {
  id: root

  // Injected by Omarchy's keepLoaded overlay loader.
  property var shell: null

  function text(value) {
    return String(value || "").toLowerCase()
  }

  function hasAny(item, needles) {
    var values = [item.id, item.title, item.tooltipTitle]
    for (var i = 0; i < values.length; i++) {
      var value = text(values[i])
      for (var j = 0; j < needles.length; j++) {
        if (value === needles[j]) return true
      }
    }
    return false
  }

  function activateTrayItem(needles) {
    var items = SystemTray.items.values
    for (var i = 0; i < items.length; i++) {
      if (hasAny(items[i], needles)) {
        items[i].activate()
        return true
      }
    }
    return false
  }

  function activateQQTrayItem() {
    var items = SystemTray.items.values
    for (var i = 0; i < items.length; i++) {
      var item = items[i]
      // QQ shares Chrome's generic tray ID with ChatGPT and Bitwarden. In this
      // session QQ is the only such item without any title or tooltip.
      if (text(item.id) === "chrome_status_icon_1"
          && text(item.title) === ""
          && text(item.tooltipTitle) === ""
          && text(item.tooltipDescription) === "") {
        item.activate()
        return true
      }
    }
    return false
  }

  function activateWeChatTrayItem() {
    var items = SystemTray.items.values
    for (var i = 0; i < items.length; i++) {
      if (text(items[i].id) === "wechat") {
        items[i].activate()
        return true
      }
    }
    return false
  }

  // Diagnostic IPC method: returns the live StatusNotifier fields used for
  // matching. The optional argument is ignored so it can be called via
  // `omarchy-shell shell call`.
  function trayItems(_unused) {
    var result = []
    var items = SystemTray.items.values
    for (var i = 0; i < items.length; i++) {
      result.push({
        id: String(items[i].id || ""),
        title: String(items[i].title || ""),
        tooltipTitle: String(items[i].tooltipTitle || ""),
        tooltipDescription: String(items[i].tooltipDescription || ""),
        icon: String(items[i].icon || ""),
        category: String(items[i].category || "")
      })
    }
    return JSON.stringify(result)
  }

  function open(app) {
    if (app === "qq") {
      if (activateQQTrayItem()) return "activated"
      Quickshell.execDetached([
        "/usr/bin/flatpak", "run", "--branch=stable", "--arch=x86_64",
        "--command=qq", "--file-forwarding", "com.qq.QQ", "@@u", "@@"
      ])
      return "started"
    }

    if (app === "wechat") {
      if (activateWeChatTrayItem()) return "activated"
      Quickshell.execDetached([
        "/usr/bin/flatpak", "run", "--branch=stable", "--arch=x86_64",
        "--command=wechat", "--file-forwarding", "com.tencent.WeChat", "@@u", "@@"
      ])
      return "started"
    }

    return "unknown-app"
  }
}
