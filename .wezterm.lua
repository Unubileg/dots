local wezterm = require("wezterm")
local config = wezterm.config_builder()
local act = wezterm.action

-- Font settings
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 14

-- Window UI
config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.95 -- Slight transparency
config.macos_window_background_blur = 25

-- Optional background image
-- config.window_background_image = wezterm.home_dir .. "/Downloads/blue2.jpg"
config.window_background_image_hsb = {
	brightness = 1.0,
	hue = 1.0,
	saturation = 1.0,
}

-- Colors (Ayu Dark theme)
config.colors = {
	background = "#0F1419", -- Ayu Dark background
	foreground = "#f2f2f2", -- Light foreground

	cursor_bg = "#f2f2f2",
	cursor_border = "#f2f2f2",
	cursor_fg = "#0F1419",

	selection_bg = "#2b2b2b", -- dark gray selection
	selection_fg = "#f2f2f2",

	split = "#44475a",

	ansi = {
		"#0F1419",
		"#f07178",
		"#ffb454",
		"#ffcb6b",
		"#33d9e4",
		"#d6deeb",
		"#c3e88d",
		"#f2f2f2",
	},
	brights = {
		"#686868",
		"#f07178",
		"#ffb454",
		"#ffcb6b",
		"#33d9e4",
		"#d6deeb",
		"#c3e88d",
		"#ffffff",
	},
}

-- Keys
config.keys = {
	{ key = "v", mods = "CMD", action = act.PasteFrom("Clipboard") },
	{ key = "c", mods = "CMD", action = act.CopyTo("Clipboard") },
}

return config
