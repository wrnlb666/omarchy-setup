-- Keep the internal display at 1x and mirror it to any connected display.
hl.env("GDK_SCALE", "1")
hl.monitor({ output = "eDP-1", mode = "preferred", position = "auto", scale = 1 })
hl.monitor({ output = "", mode = "preferred", position = "auto", scale = 1, mirror = "eDP-1" })
