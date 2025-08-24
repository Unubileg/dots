local wezterm = require("wezterm")
local config = wezterm.config_builder()
local act = wezterm.action

-- Load the Poimandres theme
local poimandres = dofile(wezterm.home_dir .. "/.config/wezterm/poimandres.lua")

-- Set the theme with your preferred flavor
config.colors = poimandres.setup({
	flavour = "base",
})

-- Font settings
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 14
config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.8
config.macos_window_background_blur = 99

-- Add specific key bindings including paste
config.keys = {
	-- Paste from clipboard
	{ key = "v", mods = "CMD", action = act.PasteFrom("Clipboard") },
	-- Copy to clipboard
	{ key = "c", mods = "CMD", action = act.CopyTo("Clipboard") },
}

return config
