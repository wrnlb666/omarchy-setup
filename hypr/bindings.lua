-- Keep only your personal keybinding overrides here. Add new bindings or
-- unbind defaults before replacing them.

-- See current bindings and descriptions:
--   omarchy menu keybindings --print

-- To disable every Omarchy default binding, set this in
-- ~/.config/hypr/hyprland.lua before require("default.hypr.omarchy"), then add
-- only the bindings you want below:
--   omarchy_default_bindings = false

-- To disable all preinstalled app/webapp bindings, set:
--   omarchy_preinstalled_bindings = false

-- Add a new binding.
-- o.bind("SUPER + SHIFT + R", "SSH", "alacritty -e ssh your-server")

-- Change an existing binding by unbinding it first, then binding the key again.
-- This example changes SUPER+SPACE from the launcher to the Omarchy root menu.
-- hl.unbind("SUPER + SPACE")
-- o.bind("SUPER + SPACE", "Omarchy menu", "omarchy-menu toggle root")

-- Disable a default binding without replacing it.
-- hl.unbind("SUPER + SHIFT + B")

-- Logitech MX Keys examples:
-- o.bind("SUPER + SHIFT + S", nil, "omarchy-capture-screenshot")
-- o.bind("SUPER + H", nil, "voxtype record toggle")
-- o.bind("SUPER + PERIOD", nil, "omarchy-shell shell toggle omarchy.emojis")


hl.unbind("SUPER + J")
hl.unbind("SUPER + L")
hl.unbind("SUPER + K")
hl.unbind("SUPER + F")
hl.unbind("SUPER + C")
hl.unbind("SUPER + V")
hl.unbind("SUPER + T")
hl.unbind("SUPER + O")
hl.unbind("SUPER + SHIFT + M")
hl.unbind("SUPER + SHIFT + Y")
hl.unbind("SUPER + SHIFT + E")
hl.unbind("SUPER + SHIFT + C")
hl.unbind("SUPER + SHIFT + G")
hl.unbind("SUPER + SHIFT + F")
hl.unbind("SUPER + SHIFT + B")
hl.unbind("SUPER + SHIFT + X")
hl.unbind("SUPER + SHIFT + S")
hl.unbind("SUPER + SHIFT + SLASH")
hl.unbind("SUPER + SHIFT + ALT + G")
hl.unbind("SUPER + SHIFT + ALT + B")
hl.unbind("SUPER + SHIFT + ALT + X")
hl.unbind("SUPER + ALT + SHIFT + F")
hl.unbind("SUPER + SHIFT + CTRL + G")
hl.unbind("SUPER + SHIFT + RETURN")
hl.unbind("SUPER + mouse_up")
hl.unbind("SUPER + mouse_down")
hl.unbind("SUPER + SPACE")
hl.unbind("SUPER + ALT + SPACE")

o.bind("SUPER + B", "Browser", { omarchy = "browser" })
o.bind("SUPER + SPACE", "Apps menu", "omarchy-menu toggle")
o.bind("SUPER + ALT + SPACE", "Omarchy menu", "omarchy-menu toggle apps")
o.bind("SUPER + Q", "Close window", hl.dsp.window.close())
o.bind("SUPER + O", "Toggle floating", hl.dsp.window.float({ action = "toggle" }))
o.bind("SUPER + V", "Toggle split", hl.dsp.layout("togglesplit"))
o.bind("SUPER + D", "Launch apps", "omarchy-menu toggle apps")
o.bind("SUPER + M", "Show key bindings", "omarchy-menu-keybindings")
o.bind("SUPER + E", "File manager", { omarchy = "nautilus" })
o.bind("SUPER + Y", "YouTube", { webapp = "https://youtube.com/" })
o.bind("SUPER + A", "ChatGPT", { webapp = "https://chatgpt.com/?temporary-chat=true" })
o.bind("SUPER + SHIFT + B", "Browser (private)", { omarchy = "browser --private" })
o.bind("SUPER + SHIFT + Y", "YouTube Music", { webapp = "https://music.youtube.com/" })
o.bind("SUPER + SHIFT + E", "File manager (cwd)", { omarchy = "nautilus-cwd" })
o.bind("SUPER + SHIFT + RETURN", "Floating terminal", [[setsid uwsm-app -- alacritty --class=Omarchy --title=Omarchy -e "${SHELL:-bash}" -c 'omarchy-show-logo; command cd "$(omarchy-cmd-terminal-cwd)"; exec "${SHELL:-bash}"']])

o.bind("SUPER + H", "Move focus left", hl.dsp.focus({ direction = "l" }))
o.bind("SUPER + L", "Move focus right", hl.dsp.focus({ direction = "r" }))
o.bind("SUPER + K", "Move focus up", hl.dsp.focus({ direction = "u" }))
o.bind("SUPER + J", "Move focus down", hl.dsp.focus({ direction = "d" }))

o.bind("SUPER + SHIFT + H", "Swap window to the left", hl.dsp.window.swap({ direction = "l" }))
o.bind("SUPER + SHIFT + L", "Swap window to the right", hl.dsp.window.swap({ direction = "r" }))
o.bind("SUPER + SHIFT + K", "Swap window up", hl.dsp.window.swap({ direction = "u" }))
o.bind("SUPER + SHIFT + J", "Swap window down", hl.dsp.window.swap({ direction = "d" }))

o.bind("SUPER + ALT + H", "Move window to group on left", hl.dsp.window.move({ into_group = "l" }))
o.bind("SUPER + ALT + L", "Move window to group on right", hl.dsp.window.move({ into_group = "r" }))
o.bind("SUPER + ALT + K", "Move window to group on top", hl.dsp.window.move({ into_group = "u" }))
o.bind("SUPER + ALT + J", "Move window to group on bottom", hl.dsp.window.move({ into_group = "d" }))

o.bind("ALT + L", "Next window in group", hl.dsp.group.next())
o.bind("ALT + H", "Previous window in group", hl.dsp.group.prev())
o.bind("ALT + mouse_up", "Previous window in group", hl.dsp.group.next())
o.bind("ALT + mouse_down", "Next window in group", hl.dsp.group.prev())

for index = 1, 10 do
  local key = index == 10 and "0" or tostring(index)
  o.bind("ALT + " .. key, "Switch to group window " .. index, hl.dsp.group.active({ index = index }))
end

o.bind("SUPER + mouse_up", "Scroll active workspace backward", hl.dsp.focus({ workspace = "e+1" }))
o.bind("SUPER + mouse_down", "Scroll active workspace forward", hl.dsp.focus({ workspace = "e-1" }))
o.bind("SUPER + F", "Full width", hl.dsp.window.fullscreen({ mode = "maximized" }))
o.bind("SUPER + SHIFT + F", "Force full screen", hl.dsp.window.fullscreen({ mode = "fullscreen" }))
o.bind("SUPER + I", "Toggle workspace layout", "omarchy-hyprland-workspace-layout-toggle")
o.bind("SUPER + code:20", "Expand column", hl.dsp.layout("colresize -conf"))
o.bind("SUPER + code:21", "Shrink column", hl.dsp.layout("colresize +conf"))
o.bind("SUPER + SHIFT + S", "Move window to scratchpad", hl.dsp.window.move({ workspace = "special:scratchpad", follow = false }))
