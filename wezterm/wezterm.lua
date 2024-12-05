local wezterm = require 'wezterm'
local config = {}

config.color_scheme = 'Tokyo Night Day'

config.font = wezterm.font({ family = 'JetBrainsMono Nerd Font Mono' })
config.font_size = 14

config.window_decorations = 'RESIZE'
config.window_frame = {
  font = wezterm.font({ family = 'JetBrainsMono Nerd Font Mono', weight = 'Bold' }),
  font_size = 11,
}

return config
