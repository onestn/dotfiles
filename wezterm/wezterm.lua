local wezterm = require 'wezterm'

return {
  font = wezterm.font_with_fallback({
    "JetBrains Mono",
    "MesloLGS NF", -- Nerd Font fallback
  }),
  font_size = 14.0,

  color_scheme = "Catppuccin Mocha",

  enable_tab_bar = false,
  window_decorations = "RESIZE",
  window_padding = {
    left = 6, right = 6, top = 6, bottom = 6,
  },
  adjust_window_size_when_changing_font_size = false,

  macos_window_background_blur = 20,
  window_background_opacity = 0.92,
}
