local wezterm = require("wezterm")

local k = require("utils/keys")

local appearance = wezterm.gui.get_appearance()
local font = wezterm.font("CommitMono Nerd Font Mono", { weight = "Regular", stretch = "Normal", style = "Normal" })
local act = wezterm.action

return {
	color_scheme = "rose-pine-moon",
	window_decorations = "RESIZE",
	window_close_confirmation = "NeverPrompt",
	native_macos_fullscreen_mode = false,
	enable_tab_bar = false,
	font_size = 14,
	font = font,
	line_height = 1.2,
	window_background_opacity = 1,
	text_background_opacity = 1,
	adjust_window_size_when_changing_font_size = false,
	cursor_thickness = 0.7,
	check_for_updates = true,
	check_for_updates_interval_seconds = 86400,
	window_padding = {
		left = 0,
		right = 0,
		top = 5,
		bottom = 5,
	},
	keys = {
		k.cmd_key(".", k.multiple_actions(":ZenMode")),
		k.cmd_key("[", act.SendKey({ mods = "CTRL", key = "o" })),
		k.cmd_key("]", act.SendKey({ mods = "CTRL", key = "i" })),
		k.cmd_key("f", k.multiple_actions(":Grep")),
		k.cmd_key("i", k.multiple_actions(":SmartGoTo")),
		k.cmd_key("O", k.multiple_actions(":GoToSymbol")),
		k.cmd_key("P", k.multiple_actions(":GoToCommand")),
		k.cmd_key("p", k.multiple_actions(":GoToFile")),
		k.cmd_key("q", k.multiple_actions(":qa!")),
		k.cmd_to_tmux_prefix("1", "1"),
		k.cmd_to_tmux_prefix("2", "2"),
		k.cmd_to_tmux_prefix("3", "3"),
		k.cmd_to_tmux_prefix("4", "4"),
		k.cmd_to_tmux_prefix("5", "5"),
		k.cmd_to_tmux_prefix("6", "6"),
		k.cmd_to_tmux_prefix("7", "7"),
		k.cmd_to_tmux_prefix("8", "8"),
		k.cmd_to_tmux_prefix("9", "9"),
		k.cmd_to_tmux_prefix("`", "n"),
		k.cmd_to_tmux_prefix("b", "b"),
		k.cmd_to_tmux_prefix("C", "C"),
		k.cmd_to_tmux_prefix("d", "D"),
		k.cmd_to_tmux_prefix("G", "G"),
		k.cmd_to_tmux_prefix("g", "g"),
		k.cmd_to_tmux_prefix("j", "J"),
		k.cmd_to_tmux_prefix("K", "T"),
		k.cmd_to_tmux_prefix("k", "K"),
		k.cmd_to_tmux_prefix("l", "L"),
		k.cmd_to_tmux_prefix("n", '"'),
		k.cmd_to_tmux_prefix("N", "%"),
		k.cmd_to_tmux_prefix("o", "u"),
		k.cmd_to_tmux_prefix("T", "B"),
		k.cmd_to_tmux_prefix("Y", "Y"),
		k.cmd_to_tmux_prefix("t", "c"),
		k.cmd_to_tmux_prefix("w", "x"),
		k.cmd_to_tmux_prefix("z", "z"),
		k.cmd_to_tmux_prefix("Z", "Z"),
		k.cmd_ctrl_to_tmux_prefix("t", "J"),
	},
}
