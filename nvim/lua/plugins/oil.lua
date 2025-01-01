return {
	{
		"stevearc/oil.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("oil").setup({
				skip_confirm_for_simple_edits = true,
				view_options = {
					show_hidden = false,
					is_hidden_file = function(name, bufnr)
						return name == ".git"
					end,
					is_always_hidden = function(name, bufnr)
						return false
					end,
					natural_order = true,
					sort = {
						{ "type", "asc" },
						{ "name", "asc" },
					},
				},
			})
		end,
	},
}
