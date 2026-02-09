local wezterm = require 'wezterm'
local config = wezterm.config_builder and wezterm.config_builder() or {}

config.font = wezterm.font_with_fallback({
  "JetBrains Mono",
  "MesloLGS NF", -- Nerd Font fallback
})
config.font_size = 14.0
config.color_scheme = "Catppuccin Mocha"
config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.window_padding = {
  left = 6, right = 6, top = 6, bottom = 6,
}
config.adjust_window_size_when_changing_font_size = false
config.window_background_opacity = 0.92

if wezterm.target_os == "Windows" then
  config.default_prog = {
    "C:/Windows/System32/WindowsPowerShell/v1.0/powershell.exe",
    "-NoLogo",
  }
elseif wezterm.target_os == "Darwin" then
  config.macos_window_background_blur = 20
end

return config
