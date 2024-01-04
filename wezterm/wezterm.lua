local wezterm = require("wezterm")

local appearance = wezterm.gui.get_appearance()
local font = wezterm.font("JetBrainsMono Nerd Font Mono", { weight = "Regular", stretch = "Normal", style = "Normal" })
local act = wezterm.action

return {
	color_scheme = "Catppuccin Mocha",
	window_decorations = "RESIZE",
	window_close_confirmation = "NeverPrompt",
	native_macos_fullscreen_mode = false,
	enable_tab_bar = false,
	font_size = 14,
	font = font,
	line_height = 1.2,
	window_background_opacity = 0.9,
	text_background_opacity = 1,
	adjust_window_size_when_changing_font_size = false,
	cursor_thickness = 0.7,
	check_for_updates = true,
	check_for_updates_interval_seconds = 86400,
	window_padding = {
		left = 30,
		right = 30,
		top = 20,
		bottom = 10,
	},
	keys = {},
}
