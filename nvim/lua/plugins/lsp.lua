return {
	{

		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			local mason = require("mason")
			local mason_lspconfig = require("mason-lspconfig")

			mason.setup({})

			mason_lspconfig.setup({
				ensure_installed = { "tsserver", "jsonls", "rust_analyzer" },
			})

			mason_lspconfig.setup_handlers({
				function(server_name) -- default handler (optional)
					require("lspconfig")[server_name].setup({})
				end,
			})
		end,
	},
}
