hl.config({
  general = {
    no_focus_fallback = true,
  },
  scrolling = {
    direction = "right",
    column_width = 0.5,
    follow_focus = true,
    focus_fit_method = 1,
    follow_min_visible = 1.0,
    fullscreen_on_one_column = false,
    explicit_column_widths = "0.333, 0.5, 0.667, 1.0",
  },
  group = {
    drag_into_group = 2,
    groupbar = {
      gradient_rounding = 4,
      gradient_round_only_edges = false,
      font_family = "JetBrainsMono Nerd Font",
      col = {
        inactive = "rgba(3232324c)",
        active = "rgba(80808080)",
      },
    },
  },
})
