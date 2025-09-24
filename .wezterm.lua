local wezterm = require("wezterm")
local config = wezterm.config_builder()
local act = wezterm.action

-- Font settings
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 14

-- Window UI
config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.75
config.macos_window_background_blur = 25

-- Load the Poimandres theme
-- local poimandres = dofile(wezterm.home_dir .. "/.config/wezterm/poimandres.lua")

-- Colors:
-- config.colors = poimandres.setup({
-- 	flavour = "base",
-- })

config.colors = {
	background = "rgba(30, 30, 32, 0.65)",
	foreground = "#ECECEC",

	cursor_bg = "#34495e",
	-- cursor_bg = "rgba(52, 73, 94, 0.7)",
	-- cursor_fg = "rgba(255, 255, 255, 0)",
	-- cursor_fg = "black",
	cursor_border = "#34495e",

	selection_bg = "fffacd",
	selection_fg = "black",
}

-- Keys
config.keys = {
	{ key = "v", mods = "CMD", action = act.PasteFrom("Clipboard") },
	{ key = "c", mods = "CMD", action = act.CopyTo("Clipboard") },
}

return config
