local fb_actions = require("telescope").extensions.file_browser.actions

require("telescope").setup({
	defaults = {
		file_ignore_patterns = { "node_modules" },
		hidden = true,
	},

	pickers = {
		find_files = {
			theme = "dropdown",
		},
	},

	extensions = {
		file_browser = {
			cwd_to_path = true,
			hijack_netrw = true,
			theme = "dropdown",
			mappings = {
				["n"] = {
					["N"] = fb_actions.create,
				},
			},
		},
	},
})

require("telescope").load_extension("file_browser")
