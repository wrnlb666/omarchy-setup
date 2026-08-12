hl.config({
  input = {
    repeat_rate = 40,
    repeat_delay = 600,
    numlock_by_default = true,
    touchpad = {
      natural_scroll = true,
      scroll_factor = 0.4,
    },
  },
})

hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })
hl.gesture({ fingers = 3, direction = "swipe", mod = "SUPER", action = "resize" })
hl.gesture({ fingers = 4, direction = "vertical", action = "special", special = "scratchpad" })
