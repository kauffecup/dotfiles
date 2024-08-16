local wezterm = require("wezterm")
local config = wezterm.config_builder()
wezterm.log_info("reloading")

require("tabs").setup(config)
require("mouse").setup(config)
require("links").setup(config)
require("keys").setup(config)

-- Colorscheme
config.color_scheme = "Catppuccin Macchiato"

-- Fonts
config.font = wezterm.font({ family = "BerkeleyMono Nerd Font" })
config.font_size = 16
config.bold_brightens_ansi_colors = true

-- Cursor
config.scrollback_lines = 10000

return config
